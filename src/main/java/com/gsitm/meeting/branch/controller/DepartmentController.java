package com.gsitm.meeting.branch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gsitm.meeting.branch.dto.Department;
import com.gsitm.meeting.branch.service.DepartmentService;

@Controller
@RequestMapping("/department")
public class DepartmentController {

	@Autowired
	private DepartmentService deptService;
	
	@GetMapping("/list")
	public String departmentList(Model model){
		model.addAttribute("departmentList", deptService.departmentList());
		return "department/departmentList";
	}
	
	
}
