package com.gsitm.meeting.reservation.service;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	@Autowired
	JavaMailSender mailSender;
	
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
	public int approval(String resId) {
		// TODO Auto-generated method stub
		return recDao.approval(resId);
	}
	/*public String updateResState(String resId) {
		recDao.updateResState(resId);
		return recDao.selectNewResList(resId);
	}*/

	public int back(String resId) {
		// TODO Auto-generated method stub
		return recDao.back(resId);
	}

	public String getReservationBySearchtype(String empId, String searchtype,String brId) {
		// TODO Auto-generated method stub
		return gson.toJson(recDao.getReservationBySearchtype(empId, searchtype,brId));
	}

	public void sendMail(String email, String inputValue) {
		// TODO Auto-generated method stub
		MimeMessage message = mailSender.createMimeMessage();
		try {
			
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("dlgyqls77@gmail.com");
			messageHelper.setTo(email);
			messageHelper.setSubject("[GSITM 회의실 예약 시스템]회의실 예약 반려 사유 알림");
			messageHelper.setText(inputValue);
			mailSender.send(message);
		} catch (MessagingException e) {	
			e.printStackTrace();
		}
	}

	public void sendApprovalMail(String email, String str) {
		// TODO Auto-generated method stub
		MimeMessage message = mailSender.createMimeMessage();
		try {
			
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("dlgyqls77@gmail.com");
			messageHelper.setTo(email);
			messageHelper.setSubject("[GSITM 회의실 예약 시스템]회의실 예약 승인 알림");
			messageHelper.setText(str);
			mailSender.send(message);
		} catch (MessagingException e) {	
			e.printStackTrace();
		}
	}

	public void updateDeptCost(String deptId, String resCost) {
		System.out.println("Service시작 ");
		recDao.updateDeptCost(deptId,resCost);
		System.out.println("Service끝 ");
	}

	public void sendApprovalMailToHead(String headEmail, String str) {
		// TODO Auto-generated method stub
		MimeMessage message = mailSender.createMimeMessage();
		try {
			
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("dlgyqls77@gmail.com");
			messageHelper.setTo(headEmail);
			messageHelper.setSubject("[GSITM 회의실 예약 시스템]회의실 예약 승인 알림");
			messageHelper.setText(str);
			mailSender.send(message);
		} catch (MessagingException e) {	
			e.printStackTrace();
		}
	}
	
}
