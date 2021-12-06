package org.team.g2.reqboard.controller;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.team.g2.reqboard.dto.UploadResponseDTO;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@Log4j2
public class UploadController1 {
    @GetMapping("/sample/upload1")
    public void uploadGET() {
        //아무 내용은 없고 단순히 화면을 보기 위해서 만듦
    }

    @ResponseBody
    @PostMapping("/removeFile1")
    public ResponseEntity<String> removeFile1(@RequestBody Map<String,String> data) throws Exception { //파일삭제
        File file = new File("C:\\upload" + File.separator+ data.get("fileName"));
        boolean checkImage = Files.probeContentType(file.toPath()).startsWith("image");

        file.delete();
        if(checkImage) {
            File thumbnail = new File(file.getParent(), "s_" + file.getName());
            log.info(thumbnail);
            thumbnail.delete();
        }
        return ResponseEntity.ok().body("deleted");
    }

    @GetMapping("/downFile1")
    public ResponseEntity<byte[]> download1(@RequestParam("file") String fileName) throws Exception { //일반파일 다운로드

        File file = new File("C:\\upload" + File.separator+fileName);

        String originalFileName = fileName.substring(fileName.indexOf("_") +1); //uuid자르기

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type","application/octet-stream");
        headers.add("Content-Disposition","attachment; filename="
                + new String(originalFileName.getBytes(StandardCharsets.UTF_8),"ISO-8859-1"));
        byte[] data = FileCopyUtils.copyToByteArray(file);

        return ResponseEntity.ok().headers(headers).body(data);

    }

    @GetMapping("/viewFile1")
    @ResponseBody
    public ResponseEntity<byte[]> viewFile1(@RequestParam("file") String fileName)throws Exception { //이미지 조회
        File file = new File("C:\\upload" + File.separator + fileName);
        ResponseEntity<byte[]> result = null;

        byte[] data = FileCopyUtils.copyToByteArray(file);

        String mimeType = Files.probeContentType(file.toPath());

        log.info("mimeType: " + mimeType);

        result = ResponseEntity.ok().header("Content-Type",mimeType).body(data);
        log.info("-------------------------------------------");
        log.info(result);
        return result;
    }


    @ResponseBody
    @PostMapping("/upload1")
    public List<UploadResponseDTO> uploadPost1(MultipartFile[] uploadFiles) { //파일등록
        log.info("-----------------------------------");
        if (uploadFiles != null && uploadFiles.length > 0) {

            List<UploadResponseDTO> uploadedList = new ArrayList<>(); //위의 반환타입을 바꿔주고 그것을 받는 객체를 하나 만듦

            for (MultipartFile multipartFile : uploadFiles) {
                try {
                    uploadedList.add(uploadProcess1(multipartFile));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }//for
            return uploadedList;
        }//end
        return null;
    }


    private UploadResponseDTO uploadProcess1(MultipartFile multipartFile) throws Exception {

        String uploadPath = "C:\\upload";

        String folderName = makeFolder1(uploadPath);
        String fileName = multipartFile.getOriginalFilename();
        String uuid = UUID.randomUUID().toString();
        String originFileName = fileName;

        fileName = uuid + "_" + fileName; // 중복시 다른 이름으로 파일이 생성 됨.

        File savedFile = new File(uploadPath + File.separator + folderName, fileName); //파일 업로드 하면 년월일 폴더에 파일이 들어가게 된다.

        FileCopyUtils.copy(multipartFile.getBytes(), savedFile);

        //섬네일 처리
        String mimeType = multipartFile.getContentType();
        boolean checkImage = mimeType.startsWith("image");
        if (checkImage) {
            File thumbnailFile = new File(uploadPath + File.separator + folderName, "s_" + fileName); //썸네일 이름 붙여주기
            Thumbnailator.createThumbnail(savedFile, thumbnailFile, 100, 100); //이미 저장된 파일을 썸네일파일로 100x100사이즈로 조정해서 저장
        }
        return UploadResponseDTO.builder()
                .uuid(uuid)
                .uploadPath(folderName.replace(File.separator, "/")) //file.separator 가 맥 윈도우 다르기 때문에 /로 통일
                .fileName(originFileName)
                .image(checkImage)
                .build();

    }

    private String makeFolder1(String uploadPath) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = simpleDateFormat.format(date); // 오늘날짜의 문자열 만들어진다 2021-09-07
        String folderName = str.replace("-", File.separator); //win \\mac /
        //이 폴더가 있으면 만들어야하고 없으면 안만들어도 된다
        File uploadFolder = new File(uploadPath, folderName); //uploadpath라는 경로에 foldername을 준다
        if (uploadFolder.exists() == false) {
            uploadFolder.mkdirs(); //만약에 폴더가 없으면 업로드 폴더를 만들어라
        }
        return folderName; //폴더 이름만 반환해 줄 생각 .
    }
}
