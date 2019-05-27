package com.gsitm.meeting.reservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.meeting.reservation.dao.ReservationDaoImpl;

@Service
public class ReservationService {

	@Autowired
	private ReservationDaoImpl resDao;
}
