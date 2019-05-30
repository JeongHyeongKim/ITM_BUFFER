package com.gsitm.meeting.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gsitm.meeting.reservation.service.ReservationService;
import com.gsitm.meeting.room.dto.MeetingRoom;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReservationService resService;
	
	@GetMapping("/list")
	public String resList(Model model) {
		model.addAttribute("list",resService.resList());
		model.addAttribute("branchList",resService.branchList());
		return "reservation/resList";
	}
	
	@GetMapping("/resShortMain/{brId}")
	public String meetingRoomList(Model model,@PathVariable String brId) {
		System.out.println(resService.meetingRoomList(brId));
		model.addAttribute("resShortMain",resService.meetingRoomList(brId));
		model.addAttribute("meetingPeopleList",resService.meetingPeopleList());
		return "reservation/resShortMain";
	}
	
	@GetMapping("/resShortDetail")
	public String resshortDetail(Model model) {
		//model.addAttribute("",resService.)
		return "reservation/resShortDetail";
	}
}
