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
	
	/*@GetMapping("One")
	public Department departmentOne(Model model) {
		model.addAttribute("departmentOne", deptService.departmentOne());
	}*/
	//update매서드를 실행하기 전에 한 객체를 불러오는 것도 필요한데 여기를 어떻게 처리해야 할까?
	//service와 다오 임플리먼트에서는 이 부분들에 대해 하나의id값을 불러와서 처리하는데, 여기 controller에서는 어떻게 해야할지?
}
