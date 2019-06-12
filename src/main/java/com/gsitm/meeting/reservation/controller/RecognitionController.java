package com.gsitm.meeting.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
		model.addAttribute("branchList",resService.branchList());
		return "admin/waitForRecognition";
	}
}