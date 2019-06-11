package com.gsitm.meeting.users.service;

import java.text.DateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.gsitm.meeting.users.dao.EmployeeDaoImpl;
import com.gsitm.meeting.vo.Employee;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeDaoImpl empDao;
	
	@Autowired
	private Gson gson;
	
	public void lockAccount(String id) {
		empDao.lockAccount(id);
	}
	
	public Employee getCurrentId(String id) {
		return (empDao.getCurrentId(id));
	}
	
	public String getDeptCost(String empId) {
		return gson.toJson(empDao.getDeptCost(empId));
	}
	
	public String getReservationByEmpId(String empId) {
		return gson.toJson(empDao.getReservationByEmpId(empId));
	}
	
	public String getReservationBySearchtype(String empId, String searchtype) {
		return gson.toJson(empDao.getReservationBySearchtype(empId, searchtype));
	}
	
	//윤영
	public String availableMeetingDate(String availableDate, String mrId) {
		System.out.println("availableDate : " + availableDate);
		String[] splitDate = availableDate.split("-");
	
		String year = splitDate[0].substring(3, 5);
		String month = splitDate[1];
		String day = splitDate[2].substring(0, 2);
		
		String transDate = year + "/" + month + "/" + day;
		System.out.println("mrId : " + mrId);
		System.out.println("transDate : " + transDate);
		System.out.println(gson.toJson(empDao.availableMeetingDate(transDate, mrId)));
		return gson.toJson(empDao.availableMeetingDate(transDate, mrId));
	}
	public String CurrentInfoByMrId(String mrId) {
		System.out.println("service : "+ mrId);
		System.out.println(empDao.CurrentInfoByMrId(mrId));
		return gson.toJson(empDao.CurrentInfoByMrId(mrId));
	}
}
