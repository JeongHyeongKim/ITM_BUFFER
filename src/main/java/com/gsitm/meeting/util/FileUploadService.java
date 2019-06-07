package com.gsitm.meeting.util;

import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.gsitm.meeting.branch.service.BranchService;

@Service
public class FileUploadService { // 미완성
	
	@Autowired
	private BranchService brService;
	//https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/context/support/FileSystemXmlApplicationContext.html
	//다음 주소에서 프로젝트 갱신을 할 수 있을 것 같다.
	
	//할일 리스트
	//1. 사진 폼에 올리면 그 사진으로  form이 바뀌며, 디폴트 사진을 다른 것으로 대체
	//2. list에서 커서 색깔 제대로 잘 안바뀌는 오류 해결 요망
	//3. 파일 올리기 했으면 파일 삭제하는 것도 해야지.
	//4. 역시 바꿔치기도 해야지.
	public String restore(MultipartFile multipartFile, String absoluteURL, String object) { // 만들 객체마다 다른 기능을 써야한다.
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
			
			writeFile(multipartFile, saveFileName,absoluteURL, object);
			url = absoluteURL +object+"/"+saveFileName;
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
	private boolean writeFile(MultipartFile multipartFile, String saveFileName, String absoluteURL,String object)
								throws IOException{
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(absoluteURL + "/" +object+"/"+ saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
	}

}
