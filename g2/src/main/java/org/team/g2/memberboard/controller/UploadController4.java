package org.team.g2.memberboard.controller;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.team.g2.memberboard.dto.UploadResponseDTO4;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@Log4j2
public class UploadController4 {

	@GetMapping("/sample/upload4")
	public void uploadGET4() {
	}

	@ResponseBody
	@PostMapping("/removeFile4")
	public ResponseEntity<String> removeFile4(@RequestBody Map<String,String> data) throws Exception {
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

	@GetMapping("/downFile4")
	public ResponseEntity<byte[]> download4(@RequestParam("file") String fileName) throws Exception {

		File file = new File("C:\\upload" + File.separator+fileName);

		String originalFileName = fileName.substring(fileName.indexOf("_") +1);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type","application/octet-stream");
		headers.add("Content-Disposition","attachment; filename="
				+ new String(originalFileName.getBytes(StandardCharsets.UTF_8),"ISO-8859-1"));
		byte[] data = FileCopyUtils.copyToByteArray(file);

		return ResponseEntity.ok().headers(headers).body(data);

	}

	//이미지를 브라우저에서 조회하는 코드
	@GetMapping("/viewFile4")
	@ResponseBody
	//순수한 이미지 데이터를 보내주는 것
	public ResponseEntity<byte[]> viewFile4(@RequestParam("file") String fileName)throws Exception { //파라미터 보낼때는 file로 보내고 받을떄는 fileName으로 받는다.
		//
		File file = new File("C:\\upload" + File.separator + fileName);
		//파일존재여부 확인
		log.info("파일존재여부 확인 : " + file);

		ResponseEntity<byte[]> result = null; //ResponseEntity를 쓰는 이유 - content 타입이 매번 달라져야 한다.
		//byte의 배열에 담아준다.
		byte[] data = FileCopyUtils.copyToByteArray(file);

		//mimeType에 맞춰서 보내줘야 한다 - 타입 알아내기
		String mimeType = Files.probeContentType(file.toPath()); //문자열로 적절한 mimeType을 가져옴

		log.info("mimeType: " + mimeType);

		result = ResponseEntity.ok().header("Content-Type",mimeType).body(data); //ok는 응답코드메세지 만들어주는것 200번
		log.info("-------------------------------------------");
		log.info(result);
		return result;
	}



	@ResponseBody
	@PostMapping("/upload4")
	//파일을 여러개 받을거기 때문에 배열로 받는다.

	public List<UploadResponseDTO4> uploadPost4(MultipartFile[] uploadFiles) {
		log.info("-----------------------------------");
		if (uploadFiles != null && uploadFiles.length > 0) {

			List<UploadResponseDTO4> uploadedList = new ArrayList<>(); //위의 반환타입을 바꿔주고 그것을 받는 객체를 하나 만듦

			for (MultipartFile multipartFile : uploadFiles) {
				try {
					uploadedList.add(uploadProcess4(multipartFile));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//for
			return uploadedList;
		}//end
		return null;
	}
//file upload가 되는지 안되는지 확인하는 단계

	private UploadResponseDTO4 uploadProcess4(MultipartFile multipartFile) throws Exception {

		String uploadPath = "C:\\upload";

		String folderName = makeFolder4(uploadPath); //2021-09-07
		String fileName = multipartFile.getOriginalFilename();
		String uuid = UUID.randomUUID().toString(); //uuid를 써야하기 때문에 uuid값을 따로 빼준다
		String originFileName = fileName;

//        log.info(multipartFile.getContentType()); //mytype 이게 이미지라면 우리는 여기에 맞게 이미지 파일을 만들어 주어야함
//        log.info(multipartFile.getOriginalFilename());
//        log.info(multipartFile.getSize());


		fileName = uuid + "_" + fileName; // 중복시 다른 이름으로 파일이 생성 됨.

		File savedFile = new File(uploadPath + File.separator + folderName, fileName); //파일 업로드 하면 년월일 폴더에 파일이 들어가게 된다.

		FileCopyUtils.copy(multipartFile.getBytes(), savedFile); //여기가 파일을 복사하는 부분이다. 여기까지 되면 파일이 저장이 된것.

		//섬네일 처리 (아무때나가 아니라 이미지일때만 가려서 해 줘야함)
		String mimeType = multipartFile.getContentType(); //파일의 타입을 확인
		boolean checkImage = mimeType.startsWith("image");
		if (checkImage) {
			File thumbnailFile = new File(uploadPath + File.separator + folderName, "s_" + fileName); //썸네일 이름 붙여주기
			Thumbnailator.createThumbnail(savedFile, thumbnailFile, 100, 100); //이미 저장된 파일을 썸네일파일로 100x100사이즈로 조정해서 저장
		}
		return UploadResponseDTO4.builder()
				.userUuid(uuid)
				.userFilePath(folderName.replace(File.separator, "/")) //file.separator 가 맥 윈도우 다르기 때문에 /로 통일
				.userFileName(originFileName)
				.userImageCheck(checkImage)
				.build();


	}

	private String makeFolder4(String uploadPath) {
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
