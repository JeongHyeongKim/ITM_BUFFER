package com.gsitm.meeting.branch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gsitm.meeting.branch.service.DepartmentHeadService;

@Controller
@RequestMapping("/departmentHead")
public class DepartmentHeadController {
	
	@Autowired
	private DepartmentHeadService deptHeadService;
	
	@GetMapping
	public String departmentHeadList(Model model) {
		model.addAttribute("departmentHead", deptHeadService.departmentHeadList());
		return "departmentHead/departmentHeadList";
	}
}
