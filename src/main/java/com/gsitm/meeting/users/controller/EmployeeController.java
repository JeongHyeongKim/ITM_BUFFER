package com.gsitm.meeting.users.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.gsitm.meeting.users.dto.EmployeeDTO;
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
		model.addAttribute("myCost",empService.getDeptCost(principal.getName()));
		model.addAttribute("myInfo",empService.getReservationByEmpId(principal.getName()));
		return "/users/mypage";
	}
	
	@PostMapping("/users/search/{searchtype}")
	public ResponseEntity<String> myReservationBySearch(Principal principal,@PathVariable String searchtype){
		System.out.println(empService.getReservationBySearchtype(principal.getName(), searchtype));
		return new ResponseEntity<>(empService.getReservationBySearchtype(principal.getName(), searchtype),HttpStatus.OK);
	}
}
