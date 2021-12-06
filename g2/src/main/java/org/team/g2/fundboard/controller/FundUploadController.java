package org.team.g2.fundboard.controller;

import com.google.gson.JsonObject;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;
import org.apache.commons.io.FileUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.team.g2.fundboard.dto.UploadResponseDTO;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
public class FundUploadController {

    @GetMapping("/view")
    @ResponseBody
    public ResponseEntity<byte[]> viewFile( @RequestParam("file") String fileName)throws Exception{

        // C:\\upload\\2021/09/08/cat.jpg
        File file = new File("C:\\upload" + File.separator+fileName);

        log.info(file);

        ResponseEntity<byte[]> result = null;

        byte[] data = FileCopyUtils.copyToByteArray(file);

        //mime type
        String mimeType = Files.probeContentType(file.toPath());

        log.info("mimeType: " + mimeType);

        result = ResponseEntity.ok().header("Content-Type", mimeType).body(data);

        return result;
    }



    @ResponseBody
    @PostMapping("/upload")
    public List<UploadResponseDTO> uploadPost(MultipartFile[] uploadFiles){

        log.info("-----------------------------");
        if(uploadFiles != null && uploadFiles.length > 0){

            List<UploadResponseDTO> uploadedList = new ArrayList<>();

            for (MultipartFile multipartFile : uploadFiles) {
                try {
                    uploadedList.add(uploadProcess(multipartFile));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }//for
            return uploadedList;

        }//end
        return null;

    }

    private UploadResponseDTO uploadProcess(MultipartFile multipartFile)throws Exception {

        String uploadPath ="C:\\upload";

        String folderName = makeFolder(uploadPath); // 2021-09-07
        String fileName = multipartFile.getOriginalFilename();
        String uuid = UUID.randomUUID().toString();
        String originalFileName = fileName;

        fileName = uuid +"_"+fileName;

        File savedFile = new File(uploadPath+File.separator+folderName, fileName);

        FileCopyUtils.copy(multipartFile.getBytes(), savedFile);

        //Thumbnail 처리
        String mimeType = multipartFile.getContentType();
        boolean checkImage = mimeType.startsWith("image");
        if(checkImage){
            File thumbnailFile = new File(uploadPath+File.separator+folderName, "s_"+fileName);
            Thumbnailator.createThumbnail(savedFile,thumbnailFile,400,400);
        }

        return UploadResponseDTO.builder()
                .uuid(uuid)
                .uploadPath(folderName.replace(File.separator,"/"))
                .fileName(originalFileName)
                .image(checkImage)
                .build();
    }

    private String makeFolder(String uploadPath) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = simpleDateFormat.format(date); //2021-09-07
        String folderName = str.replace("-", File.separator); //win \\ mac /
        File uploadFolder = new File(uploadPath, folderName);
        if(uploadFolder.exists() == false){
            uploadFolder.mkdirs();
        }
        return folderName;
    }

}

