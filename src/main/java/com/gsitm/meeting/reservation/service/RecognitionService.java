package com.gsitm.meeting.reservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.meeting.reservation.dao.RecognitionDaoImpl;

@Service
public class RecognitionService {

	@Autowired
	private RecognitionDaoImpl recDao;
}
