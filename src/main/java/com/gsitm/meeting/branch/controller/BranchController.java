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
		return "branch/branchRead"; // 
	}
	
	@PostMapping("/write")
	public String branchInsert(Branch branch) {
		brService.branchInsert(branch);
		return "redirect:/branch/list";
	}
	
	@PostMapping("/update")
	public String branchUpdate(Branch branch) {
		brService.branchUpdate(branch);
		return "redirect:/branch/list";
	}
	
	@PostMapping("/delete")
	public String branchDelete(String brId) {
		brService.branchDelete(brId);
		return "redirect:/branch/list";
	}
	
	
	/*public String branchOne(Model model) {
		model.addAttribute("branchOne", brService.branchList());
		return "branch/branchOne";
		//�ϳ��� ��ȸ�Ҷ��� �ʿ��Ѱ�? �ϴ� ��������
	}*/
}
