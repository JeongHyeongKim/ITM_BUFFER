package com.gsitm.meeting.branch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.meeting.branch.dao.DepartmentDaoImpl;
import com.gsitm.meeting.branch.dto.Department;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentDaoImpl deptDao;
	
	public List<Department> departmentList(){
		return deptDao.departmentList();
	}
	
	public Department departmentOne(String deptId) {
		return deptDao.departmentOne(deptId);
	}
}
