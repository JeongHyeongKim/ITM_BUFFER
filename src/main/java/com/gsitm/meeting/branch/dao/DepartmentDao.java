package com.gsitm.meeting.branch.dao;

import java.util.List;

import com.gsitm.meeting.branch.dto.DepartmentDTO;

public interface DepartmentDao {
	
	public void  departmentCreate(DepartmentDTO department);
	public List<DepartmentDTO>  departmentList();
	public DepartmentDTO departmentOne(String deptId);
	public void departmentUpdate(DepartmentDTO department);
	public void departmentDelete(String deptId);

}
