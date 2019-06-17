package com.gsitm.meeting.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.gsitm.meeting.reservation.dao.RecognitionDaoImpl;
import com.gsitm.meeting.vo.Reservation;

@Service
public class RecognitionService {

	@Autowired
	private RecognitionDaoImpl recDao;
	@Autowired
	private Gson gson;
	
	public String resList() {
		// TODO Auto-generated method stub
		return gson.toJson(recDao.resList());
	}

	public String branchList() {
		// TODO Auto-generated method stub
		return gson.toJson(recDao.branchList());
	}

	public String allPayment() {
		// TODO Auto-generated method stub
		return gson.toJson(recDao.allPayment());
	}
	public String allDeptPayment() {
		return gson.toJson(recDao.allDeptPayment());
	}

	public String myPaymentBySearch(String searchtype) {
		// TODO Auto-generated method stub
		return gson.toJson(recDao.myPaymentBySearch(searchtype));
	}

	/*public String updateResState(String resId) {
		recDao.updateResState(resId);
		return recDao.selectNewResList(resId);
	}*/
}
