package com.gsitm.meeting.users.dao;

import java.util.Map;

public interface EmployeeDao {

	public String getStoredId(String id);
	
	public int getLoginFailureCnt(String empId);
	
	public void addLoginFailureCnt(Map map);
	
	public void resetLoginCnt(String id);
	
	public void lockAccount(String id);
}
