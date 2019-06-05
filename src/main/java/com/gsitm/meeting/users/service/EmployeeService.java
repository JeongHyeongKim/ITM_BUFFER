package com.gsitm.meeting.users.service;

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
}
