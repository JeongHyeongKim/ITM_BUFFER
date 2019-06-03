package com.gsitm.meeting.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gsitm.meeting.branch.dto.Branch;
import com.gsitm.meeting.reservation.dto.Reservation;
import com.gsitm.meeting.reservation.service.ReservationService;
import com.gsitm.meeting.room.dto.MeetingRoom;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReservationService resService;
	
	@GetMapping("/list/{brId}")
	public String resList(Model model,@PathVariable String brId) {
		model.addAttribute("resList",resService.resList(brId));
		model.addAttribute("branchList",resService.branchList());
		model.addAttribute("mrTypeList",resService.mrTypeList());
		model.addAttribute("mrLimitList",resService.mrLimitList());
		return "reservation/resList";
	}
	@PostMapping("/writeReservation")
	public String writeReservation(Reservation reservation) {
		resService.writeReservation(reservation);
		return "redirect:/reservation/list"; //리턴중, 리다이렉트는 url형식으로 전달된다.
	}
	@GetMapping("/resShortMain/{brId}")
	public String meetingRoomList(Model model,@PathVariable String brId) {
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
