package com.gsitm.meeting.users.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gsitm.meeting.users.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService empService;
	
	@GetMapping("/user/test")
	public String test(String id) {
		id="it0003";
		empService.lockAccount(id);
		return null;
	}
	
	/////////////////////
	@GetMapping("/user/deptCost")
	public String getDeptCost(String empId) {
		return empService.getDeptCost(empId);
	}
	
	@GetMapping("/users/mypage")
	public String myReservation(Model model, Principal principal) {
		System.out.println(empService.getReservationByEmpId(principal.getName()));
		model.addAttribute("myCost",empService.getDeptCost(principal.getName()));
		model.addAttribute("myInfo",empService.getReservationByEmpId(principal.getName()));
		return "/users/mypage";
	}
}
