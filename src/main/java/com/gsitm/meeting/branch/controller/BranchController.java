package com.gsitm.meeting.branch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gsitm.meeting.branch.dto.Branch;
import com.gsitm.meeting.branch.service.BranchService;

@Controller
@RequestMapping("/branch")
public class BranchController {
	
	@Autowired
	private BranchService brService;
	
	@GetMapping("/list")
	public String branchList(Model model) {
		model.addAttribute("branchList", brService.branchList());
		return "branch/branchList";
	}
	
	@GetMapping("/read/{brId}")
	public String branchOne(Model model, @PathVariable String brId) {
		model.addAttribute("branch", brService.branchOne(brId));
		return "branch/branchRead"; // 리다이렉트 없이 바로 전달하면 경로로 설정
	}
	
	@PostMapping("/write")
	public String branchInsert(Branch branch) {
		System.out.println("insert!!!!!!!!!!!!!!!!!!!!");
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
		brService.branchDelete(brId);
		return "redirect:/branch/list";
	}
	
	@GetMapping("/create")
	public String branchCreate() { // 글 입력폼만 있는 페이지로 이동함.
		return "branch/branchCreate";
	}
	
	
}
