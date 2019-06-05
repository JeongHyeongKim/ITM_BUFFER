package com.gsitm.meeting.branch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gsitm.meeting.branch.dto.BranchDTO;
import com.gsitm.meeting.branch.service.BranchService;
import com.gsitm.meeting.vo.Branch;

@Controller
@RequestMapping("/branch")
public class BranchController {
	
	@Autowired
	private BranchService brService;
	private FileUploadService fileUploadService;
	
	@GetMapping("/list")
	public String branchList(Model model) {
		model.addAttribute("branchList", brService.branchList());
		model.addAttribute("meetingRoomListOrderByBranch", brService.meetingRoomListOrderByBranch());
		return "branch/branchList";
	}
	
	@GetMapping("/read/{brId}")
	public String branchOne(Model model, @PathVariable String brId) {
		model.addAttribute("branch", brService.branchOne(brId));
		model.addAttribute("meetingRoomList", brService.meetingRoomListInBranch(brId)); // 해당 지사에 소속되어 있는 회의실 리스트 출력
		return "branch/branchRead"; // 리다이렉트 없이 바로 전달하면 경로로 설정
	}
	
	@PostMapping("/write")
	public String branchInsert(Branch branch) {
		brService.branchInsert(branch);
		return "redirect:/branch/list"; //리턴중, 리다이렉트는 url형식으로 전달된다.
	}
	
	@PostMapping("/update")
	public String branchUpdate(Branch branch) {
		System.out.println("update!!!!!!!!!!!!!!!!!!!!!");
		brService.branchUpdate(branch);
		return "redirect:/branch/list";
	}
	
	@PostMapping("/delete")
	public String branchDelete(String brId) {
		System.out.println(brId);
		brService.branchDelete(brId);
		return "redirect:/branch/list";
	}
	
	@GetMapping("/create")
	public String branchCreate() { // 글 입력폼만 있는 페이지로 이동함.
		return "branch/branchCreate";
	}
	
	
	@RequestMapping( "/upload" )
	public String upload(Model model,@RequestParam("email") String email,@RequestParam("file1") MultipartFile file) {
		
		String url = fileUploadService.restore(file);
		model.addAttribute("url", url);
		return "result";
	}
	
}
