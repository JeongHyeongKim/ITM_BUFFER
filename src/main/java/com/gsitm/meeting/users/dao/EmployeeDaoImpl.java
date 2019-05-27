package com.gsitm.meeting.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDaoImpl implements EmployeeDao{

	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.employeeMapper";

}
