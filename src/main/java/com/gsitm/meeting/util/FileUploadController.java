package com.gsitm.meeting.util;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.gsitm.meeting.util.FileUploadService;
import com.gsitm.meeting.vo.Branch;
import com.gsitm.meeting.branch.service.BranchService;


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
		
		Set pathSet = request.getSession().getServletContext().getResourcePaths("/");
		System.out.println(pathSet);	
		
		System.out.println(brImg.getOriginalFilename());
		System.out.println("asdf");
		System.out.println("size : " + brImg.getSize());
		String url = fileUploadService.restore(brImg);
		System.out.println(url);
		Branch branch = new Branch(brId, brName, brLocation, brTel, url); //branchCreate와 왜 매핑이 안될까? 분명 url상 경로는 잘들어가는 중이다. 404 error
		//끝! ㅇ
		brService.branchInsert(branch);
		return "redirect:/branch/list"; //리턴중, 리다이렉트는 url형식으로 전달된다. 
	}
	
	@PostMapping("/meetingRoomWrite")
	public String meetingRoomInsert() {
		return null;
		
	}
	
	
}
