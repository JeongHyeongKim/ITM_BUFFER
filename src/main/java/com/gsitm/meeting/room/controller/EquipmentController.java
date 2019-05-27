package com.gsitm.meeting.room.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gsitm.meeting.reservation.service.EquipmentReservationService;
import com.gsitm.meeting.room.service.EquipmentService;

@Controller
public class EquipmentController {

	@Autowired
	private EquipmentService equipService;
}
