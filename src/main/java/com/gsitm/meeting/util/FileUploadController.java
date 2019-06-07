package com.gsitm.meeting.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gsitm.meeting.util.FileUploadService;
import com.gsitm.meeting.branch.service.BranchService;
import com.gsitm.meeting.vo.Branch;

@Controller
@RequestMapping("/file")
public class FileUploadController {
	
	@Autowired
	private BranchService brService;
	private FileUploadService fileUploadService;
	
	
	
	@PostMapping("/branchWrite")
	public String branchInsert( @RequestParam("brId") String brId, @RequestParam("brName") String brName,
			@RequestParam("brLocation") String brLocation, @RequestParam("brTel") String brTel,
			@RequestParam("brImg") MultipartFile brImg) {
		fileUploadService = new FileUploadService();

		System.out.println(brImg.getOriginalFilename());
		System.out.println("asdf");
		System.out.println("size : " + brImg.getSize());
		String url = fileUploadService.restore(brImg);
		//System.out.println(url);
		//Branch branch = new Branch(brId, brName, brLocation, brTel, url); //branchCreate와 왜 매핑이 안될까? 분명 url상 경로는 잘들어가는 중이다. 404 error
		//끝! ㅇ
		//brService.branchInsert(branch);
		return "redirect:/branch/create"; //리턴중, 리다이렉트는 url형식으로 전달된다. 
	}
	
	@PostMapping("/meetingRoomWrite")
	public String meetingRoomInsert() {
		return null;
		
	}
	
	
}
