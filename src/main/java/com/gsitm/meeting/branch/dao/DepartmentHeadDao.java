package com.gsitm.meeting.branch.dao;

import java.util.List;

import com.gsitm.meeting.branch.dto.*;

public interface DepartmentHeadDao {
	
	public int departmentHeadCreate(String empId, String deptId);
	
	public List<DepartmentHead> departmentHeadList();
	
	public DepartmentHead departmentHeadOne(String empId);
	
	public int departmentHeadUpdate(String empId, String deptId);
	
	public int departmentHeadDelete(String empId);
	
	

}
