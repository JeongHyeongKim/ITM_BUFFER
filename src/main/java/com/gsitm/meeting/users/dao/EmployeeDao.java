package com.gsitm.meeting.users.dao;

import java.util.Map;

import com.gsitm.meeting.reservation.dto.Reservation;
import com.gsitm.meeting.users.dto.Employee;

public interface EmployeeDao {

	public String getStoredId(String id);
	
	public int getLoginFailureCnt(String empId);
	
	public void addLoginFailureCnt(Map map);
	
	public void resetLoginCnt(String id);
	
	public void lockAccount(String id);
	
	public Employee getCurrentId(String empId);
	
	public int getDeptCost(String empId);
	
	public Reservation getReservationByEmpId(String empId);
}
