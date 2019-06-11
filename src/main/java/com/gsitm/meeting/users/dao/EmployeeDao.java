package com.gsitm.meeting.users.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gsitm.meeting.users.dto.EmployeeDTO;
import com.gsitm.meeting.vo.Employee;

public interface EmployeeDao {

	public String getStoredId(String id);
	
	public int getLoginFailureCnt(String empId);
	
	public void addLoginFailureCnt(Map map);
	
	public void resetLoginCnt(String id);
	
	public void lockAccount(String id);
	
	public Employee getCurrentId(String empId);
	
	public int getDeptCost(String empId);
	
	public List<EmployeeDTO.MyPageInfo> getReservationByEmpId(String empId);
	
	public List<EmployeeDTO.MyPageInfo> getReservationBySearchtype(String empId, @Param("searchtype")String searchtype);
	
	//윤영이거
	public List<String> availableMeetingDate(String availableDate, String mrId);
	public EmployeeDTO.CurrentInfoByMrId CurrentInfoByMrId(String mrId);
}
