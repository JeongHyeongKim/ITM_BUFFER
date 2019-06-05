package com.gsitm.meeting.branch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.meeting.branch.dao.DepartmentDaoImpl;
import com.gsitm.meeting.branch.dto.DepartmentDTO;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentDaoImpl deptDao;
	
	public List<DepartmentDTO> departmentList(){
		return deptDao.departmentList();
	}
	
	public DepartmentDTO departmentOne(String deptId) {
		return deptDao.departmentOne(deptId);
	}
	
	public void departmentCreate(DepartmentDTO department) {
		deptDao.departmentCreate(department);
	}
	public void departmentUpdate(DepartmentDTO department) {
		deptDao.departmentUpdate(department);
	}
	
	public void departmentDelete(String deptId) {
		deptDao.departmentDelete(deptId);
	}
}
