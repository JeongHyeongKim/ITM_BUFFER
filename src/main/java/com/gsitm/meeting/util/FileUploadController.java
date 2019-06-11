package com.gsitm.meeting.util;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gsitm.meeting.branch.service.BranchService;
import com.gsitm.meeting.vo.Branch;



@Controller
@RequestMapping("/file")
public class FileUploadController {
	
	@Autowired
	private BranchService brService;
	@Autowired
	private FileUploadService fileUploadService;
	
	
	
	@PostMapping("/branchWrite")
	public String branchInsert( @RequestParam("brId") String brId, @RequestParam("brName") String brName,
			@RequestParam("brLocation") String brLocation, @RequestParam("brTel") String brTel,
			@RequestParam("brImg") MultipartFile brImg, HttpServletRequest request) {
		
		
		String url = request.getSession().getServletContext().getRealPath("/");
		String urlBefore = url.split("\\.metadata")[0];
		String urlAfter = url.split("wtpwebapps")[1];
		String realURL = urlBefore+urlAfter+"/src/main/webapp/resources/img/"; // 실제 컴퓨터 상에서의 프로젝트 경로
		System.out.println(realURL);
		
		String finalURL = fileUploadService.restore(brImg, realURL, "branch");
		finalURL = finalURL.split("webapp/")[1];
		finalURL = "/meeting/"+finalURL;
		System.out.println(finalURL);
		
		Branch branch = new Branch(brId, brName, brLocation, brTel, finalURL); //branchCreate와 왜 매핑이 안될까? 분명 url상 경로는 잘들어가는 중이다. 404 error
		brService.branchInsert(branch);
		return "redirect:/branch/list";
	}
	
	@PostMapping("/branchUpdate")
	public String branchUpdate(@RequestParam("brId") String brId, @RequestParam("brName") String brName,
			@RequestParam("brLocation") String brLocation, @RequestParam("brTel") String brTel,
			@RequestParam("brImg") MultipartFile brImg, HttpServletRequest request) {
		
		String buf = brService.branchOne(brId).getBrImg(); // brId받은 것을 통해 파일 경로를 그대로 가져온다 -> 상대경로임!
		
		String url = request.getSession().getServletContext().getRealPath("/");
		String urlBefore = url.split("\\.metadata")[0];
		String urlAfter = url.split("wtpwebapps")[1];
		String realURL = urlBefore+urlAfter+"/src/main/webapp/resources/img/"; // 실제 컴퓨터 상에서의 프로젝트 경로
		System.out.println(realURL);
		
		
		fileUploadService.restoreUpdate(brImg, realURL, "branch", brId); // 시스템상에 있는 branch 사진 수정
		
		Branch branch = new Branch(brId, brName, brLocation, brTel, buf); // 상대경로는 바뀌지 않으므로, 그대로 가져다 쓴다.
		brService.branchUpdate(branch);
		return "redirect:/branch/list";
	}
	
	
	
	
	
	
	@PostMapping("/meetingRoomWrite")
	public String meetingRoomInsert() {
		return null;
		
	}
	
	
}
