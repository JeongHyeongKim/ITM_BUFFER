package com.gsitm.meeting.users.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.meeting.users.dao.EmployeeDaoImpl;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeDaoImpl empDao;
}
