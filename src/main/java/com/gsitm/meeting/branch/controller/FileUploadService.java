package com.gsitm.meeting.branch.controller;

import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;
import com.gsitm.meeting.branch.service.BranchService;

public class FileUploadService { // 미완성
	
	private static final String SAVE_PATH = "/upload";
	private static final String PREFIX_URL = "/upload/";
	private BranchService brService;
	
	public String restore(MultipartFile multipartFile, String object) { // 만들 객체마다 다른 기능을 써야한다.
		String url = null;
		
		try {
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();
			
			// 서버에서 저장 할 파일 이름
			String saveFileName = genSaveFileName(extName); // 경로 뺀 완벽한 파일 이름 ex) brImg1.jpg
			
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			
			writeFile(multipartFile, saveFileName, object);
			url = PREFIX_URL + saveFileName;
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
		return url;
	}
	
	
	// 파일 아이디
	private String genSaveFileName(String extName) { //.~~~으로 확장자만 불러온다.
		String fileName = "brImg";
		
		int recentId = brService.branchGetRecentImgId();
		
		fileName += recentId+extName;
		return fileName;
	}
	
	
	// 파일을 실제로 write 하는 메서드
	private boolean writeFile(MultipartFile multipartFile, String saveFileName,String object)
								throws IOException{
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
	}

}
