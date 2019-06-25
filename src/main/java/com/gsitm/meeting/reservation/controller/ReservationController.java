package com.gsitm.meeting.reservation.controller;

import java.security.Principal;
import java.util.Date;

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
import com.gsitm.meeting.vo.Reservation;

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
		model.addAttribute("mySchedule",resService.mySchedule(principal.getName()));
		return "reservation/resList";
	}
	@PostMapping("/writeReservation")
	public String writeReservation(Model model, String mrId,@RequestParam(required=false) String resPurpose, 
			@RequestParam(required=false)String resAddRequest, String resStartDate, String resEndDate, 
			String resSnack, String resType, String resOutside, String equipElement, Principal principal, 
			String times, String empList, String resState) {
		
		Reservation res = new Reservation();
		res.setEmpId(principal.getName());
		res.setMrId(mrId);
		res.setResStartDate(resStartDate);
		res.setResEndDate(resEndDate);
		res.setResPurpose(resPurpose);
		res.setResAddRequest(resAddRequest);
		res.setResSnack(Integer.parseInt(resSnack));
		res.setResType(resType);
		res.setResState(resState);
		res.setResOutside(Integer.parseInt(resOutside));
		
		resService.insertReservation(res, times, equipElement, empList);
		return "redirect:/users/mypage"; //리턴중, 리다이렉트는 url형식으로 전달된다.
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
	public String resWrite(Model model,@PathVariable String mrId, Principal principal) {
		model.addAttribute("pastReservation",resService.getPastReservation(principal.getName()));
		model.addAttribute("equipList",resService.equipList(mrId));
		model.addAttribute("empList",resService.empList());
		return "reservation/resWrite";
	}
	@GetMapping("/search")
	public String search(Model model,SearchDTO search) {
		model.addAttribute("branchList",resService.branchList());
		model.addAttribute("search",resService.search(search));
		return "reservation/search";
	}
	
	//이후에 users 패키지로 바꾸기
	@PostMapping("/cancelRes/{resId}")
	public ResponseEntity<Void> cancelRes(@PathVariable String resId) {
		
		int result = resService.cancelRes(resId);
		return new ResponseEntity<>(result == 1 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
	}
	
	
//	@GetMapping("/users/mypage")
//	public String mySchedule(Model model,String empId,String resStartDate) {
//		/*model.addAttribute("myListPeriod",resService.myListPeriod(resStartDate));*/
//		/*model.addAttribute("mySchedule",resService.mySchedule(empId));*/
//		return "/users/mypage";
//	}
}
