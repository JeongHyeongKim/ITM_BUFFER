package com.gsitm.meeting.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gsitm.meeting.reservation.dao.ReservationDaoImpl;
import com.gsitm.meeting.reservation.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReservationService resService;
	
	@GetMapping("/list")
	public String resList(Model model) {
		model.addAttribute("list",resService.resList());
		return "reservation/resList";
	}
	
	@GetMapping("resShortMain")
	public String meetingRoomList(Model model) {
		model.addAttribute("resShortMain",resService.meetingRoomList());
		return "reservation/resShortMain";
	}
}
