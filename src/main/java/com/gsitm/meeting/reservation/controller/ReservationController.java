package com.gsitm.meeting.reservation.controller;

import java.security.Principal;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gsitm.meeting.reservation.dto.ReservationDTO;
import com.gsitm.meeting.reservation.service.ReservationService;
import com.gsitm.meeting.users.service.EmployeeService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReservationService resService;
	
	@Autowired
	private EmployeeService empService;
	
	@GetMapping("/list/{brId}")
	public String resList(Model model,@PathVariable String brId, Principal principal) {
		model.addAttribute("deptCost", empService.getDeptCost(principal.getName()));
		model.addAttribute("resList",resService.resList(brId));
		model.addAttribute("branchList",resService.branchList());
		model.addAttribute("mrTypeList",resService.mrTypeList());
		model.addAttribute("mrLimitList",resService.mrLimitList());
		return "reservation/resList";
	}
	@PostMapping("/writeReservation")
	public String writeReservation(ReservationDTO reservation) {
		resService.writeReservation(reservation);
		return "redirect:/reservation/list"; //리턴중, 리다이렉트는 url형식으로 전달된다.
	}
	@GetMapping("/resShortMain/{brId}")
	public String meetingRoomList(Model model,@PathVariable String brId) {
		model.addAttribute("branchList",resService.branchList());
		model.addAttribute("resShortMain",resService.meetingRoomList(brId));
		model.addAttribute("meetingPeopleList",resService.meetingPeopleList());
		return "reservation/resShortMain";
	}
	
	@GetMapping("/resShortDetail/{mrId}")
	public String resshortDetail(Model model,@PathVariable String mrId) {
		model.addAttribute("mrReservationList",resService.mrReservationList(mrId));
		return "reservation/resShortDetail";
	}
	@GetMapping("/resWrite")
	public String resWrite(Model model) {
		return "reservation/resWrite";
	}
}
