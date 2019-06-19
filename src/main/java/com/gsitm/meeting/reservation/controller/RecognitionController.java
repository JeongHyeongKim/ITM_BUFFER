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

import com.gsitm.meeting.reservation.dao.RecognitionDaoImpl;
import com.gsitm.meeting.reservation.service.RecognitionService;
import com.gsitm.meeting.reservation.service.ReservationService;

@Controller
@RequestMapping("/recognition")
public class RecognitionController {

	@Autowired
	private RecognitionService recService;
	@Autowired
	private ReservationService resService;
	
	@GetMapping("/waitForRecognition")
	public String waitForRecognition(Model model) {
		model.addAttribute("branchList",recService.branchList());
		model.addAttribute("resList",recService.resList());
		return "admin/waitForRecognition";
	}
	@GetMapping("/paymentManagement")
	public String paymentManagement(Model model) {
		model.addAttribute("allPayment",recService.allPayment());
		model.addAttribute("allDeptPayment",recService.allDeptPayment());
		return "admin/paymentManagement";
	}
	@PostMapping("/search/{searchtype}")
	public ResponseEntity<String> myPaymentBySearch(@PathVariable String searchtype){
		return new ResponseEntity<>(recService.myPaymentBySearch(searchtype),HttpStatus.OK);
	}
	@GetMapping("/exchangeAdmin")
	public String exchangeAdmin(Model model){
		return "admin/exchangeAdmin";
	}
	
	/*
	@PostMapping("/waitForRecognition/{resId}")
	public ResponseEntity<String> updateResId(Principal principal,@PathVariable String resId){
		return new ResponseEntity<>(recService.updateResState(resId),HttpStatus.OK);
	}*/
	
}