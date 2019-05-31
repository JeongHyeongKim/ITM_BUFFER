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
	
}
