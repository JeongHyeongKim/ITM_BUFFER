package com.gsitm.meeting.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.meeting.reservation.dao.RecognitionDaoImpl;
import com.gsitm.meeting.vo.Reservation;

@Service
public class RecognitionService {

	@Autowired
	private RecognitionDaoImpl recDao;

	public List<Reservation> resList() {
		// TODO Auto-generated method stub
		return recDao.resList();
	}

	/*public String updateResState(String resId) {
		recDao.updateResState(resId);
		return recDao.selectNewResList(resId);
	}*/
}
