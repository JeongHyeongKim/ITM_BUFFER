package com.gsitm.meeting.branch.dao;

import java.util.List;

import com.gsitm.meeting.branch.dto.Department;

public interface DepartmentDao {
	
	public int  departmentCreate(String deptId, String deptName, String deptCost, String brId);
	public List<Department>  departmentList();
	public Department departmentOne(String deptId);
	public int departmentUpdate(String deptId, String deptName, String deptCost, String brId);
	public int departmentDelete(String deptId);

}
