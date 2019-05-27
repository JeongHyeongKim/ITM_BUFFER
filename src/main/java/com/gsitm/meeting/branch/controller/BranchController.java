package com.gsitm.meeting.branch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	/*public String branchOne(Model model) {
		model.addAttribute("branchOne", brService.branchList());
		return "branch/branchOne";
		//하나만 조회할때가 필요한가? 일단 만들어놓음
	}*/
}
