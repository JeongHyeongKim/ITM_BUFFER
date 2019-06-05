package com.gsitm.meeting.branch.dao;

import java.util.List;

import com.gsitm.meeting.branch.dto.*;

public interface DepartmentHeadDao {
	
	public void departmentHeadCreate(DepartmentHeadDTO departmentHead);
	
	public List<DepartmentHeadDTO> departmentHeadList();
	
	public DepartmentHeadDTO departmentHeadOneByEmpId(String empId);
	
	public DepartmentHeadDTO departmentHeadOneByDeptId(String deptId);
	
	public void departmentHeadUpdate(DepartmentHeadDTO departmentHead);
	
	public void departmentHeadDelete(String empId);
	

}
