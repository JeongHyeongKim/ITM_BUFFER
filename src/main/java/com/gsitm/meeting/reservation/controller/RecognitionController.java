package com.gsitm.meeting.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gsitm.meeting.reservation.dao.RecognitionDaoImpl;
import com.gsitm.meeting.reservation.service.RecognitionService;

@Controller
public class RecognitionController {

	@Autowired
	private RecognitionService recService;
}
