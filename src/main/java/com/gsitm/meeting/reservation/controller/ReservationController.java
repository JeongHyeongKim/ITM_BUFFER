package com.gsitm.meeting.reservation.controller;

import java.security.Principal;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gsitm.meeting.reservation.dto.ReservationDTO;
import com.gsitm.meeting.reservation.dto.SearchDTO;
import com.gsitm.meeting.reservation.service.EquipmentReservationService;
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
	public String writeReservation(Model model,@RequestParam("resId") String resId,@RequestParam("empId") String empId,
			@RequestParam("mrId") String mrId,@RequestParam("resStartDate") String resStartDate,
			@RequestParam("resEndDate") String resEndDate,@RequestParam("resDate") String resDate,
			@RequestParam("resPurpose") String resPurpose,@RequestParam("resAttendCnt") String resAttendCnt,
			@RequestParam("resAddRequest") String resAddRequest,@RequestParam("resState") String resState,
			@RequestParam("resSnack") String resSnack,@RequestParam("resType") String resType,
			@RequestParam("resCancle") String resCancle,
			@RequestParam("resCost") String resCost,@RequestParam("resOutside") String resOutside) {
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
	@GetMapping("/resWrite/{mrId}")
	public String resWrite(Model model,@PathVariable String mrId) {
		model.addAttribute("equipList",resService.equipList(mrId));
		return "reservation/resWrite";
	}
	@GetMapping("/search")
	public String search(Model model,SearchDTO search) {
		model.addAttribute("branchList",resService.branchList());
		model.addAttribute("search",resService.search(search));
		return "reservation/search";
	}
	
	@PostMapping("/cancelRes/{resId}")
	public ResponseEntity<Void> cancelRes(@PathVariable String resId) {
		
		int result = resService.cancelRes(resId);
		return new ResponseEntity<>(result == 1 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
	}
}
