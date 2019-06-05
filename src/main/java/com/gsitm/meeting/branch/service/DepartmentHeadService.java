package com.gsitm.meeting.branch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.meeting.branch.dao.DepartmentHeadDaoImpl;
import com.gsitm.meeting.branch.dto.DepartmentHeadDTO;

@Service
public class DepartmentHeadService {

	@Autowired
	private DepartmentHeadDaoImpl deptHeadDao;
	
	public List<DepartmentHeadDTO> departmentHeadList(){
		return deptHeadDao.departmentHeadList();
	}
	
	public DepartmentHeadDTO departmentHeadOneByEmpId(String empId) {
		return deptHeadDao.departmentHeadOneByEmpId(empId);
	}
	
	public DepartmentHeadDTO departmentHeadOneByDeptId(String deptId) {
		return deptHeadDao.departmentHeadOneByDeptId(deptId);
	}
	
	public void departmentHeadCreate(DepartmentHeadDTO departmentHead){
		deptHeadDao.departmentHeadCreate(departmentHead);
	}
	
	public void departmentHeadUpdate(DepartmentHeadDTO departmentHead) {
		deptHeadDao.departmentHeadUpdate(departmentHead);
	}
	
	public void departmentHeadDelete(String empId) {
		deptHeadDao.departmentHeadDelete(empId);
	}
}
