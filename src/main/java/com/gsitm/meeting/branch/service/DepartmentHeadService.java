package com.gsitm.meeting.branch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.meeting.branch.dao.DepartmentHeadDaoImpl;
import com.gsitm.meeting.branch.dto.DepartmentHead;

@Service
public class DepartmentHeadService {

	@Autowired
	private DepartmentHeadDaoImpl deptHeadDao;
	
	public List<DepartmentHead> departmentHeadList(){
		return deptHeadDao.departmentHeadList();
	}
	
	public DepartmentHead departmentHeadOne(String empId) {
		return deptHeadDao.departmentHeadOne(empId);
	}
}
