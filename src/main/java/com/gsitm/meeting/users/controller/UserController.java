package com.gsitm.meeting.users.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gsitm.meeting.users.dto.EmployeeDTO;
import com.gsitm.meeting.users.service.EmployeeService;

@Controller
public class UserController {
	

	@Autowired
	private EmployeeService empService;
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/users/logout")
	public String logout() {
		return "/";
	}
	
	@PostMapping("/users/getCurrentId")
	public ResponseEntity<EmployeeDTO> getCurrentId(Model model, Principal principal) {
		
		EmployeeDTO userId = empService.getCurrentId(principal.getName());
		System.out.println(userId);
		return new ResponseEntity<>(userId, userId != null ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
	}
}
