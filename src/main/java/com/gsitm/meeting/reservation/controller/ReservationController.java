package com.gsitm.meeting.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gsitm.meeting.reservation.dao.ReservationDaoImpl;
import com.gsitm.meeting.reservation.service.ReservationService;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService resService;
}
