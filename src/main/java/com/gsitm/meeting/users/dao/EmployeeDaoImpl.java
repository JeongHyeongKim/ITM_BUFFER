package com.gsitm.meeting.users.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.meeting.users.dto.EmployeeDTO;
import com.gsitm.meeting.vo.Employee;
import com.gsitm.meeting.vo.Reservation;

@Repository
public class EmployeeDaoImpl implements EmployeeDao{

	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.employeeMapper";

	@Override
	public String getStoredId(String id) {
		return session.selectOne(namespace + ".getStoredId", id);
	}

	@Override
	public int getLoginFailureCnt(String empId) {
		return session.selectOne(namespace + ".getLoginFailureCnt", empId); 
	}

	@Override
	public void addLoginFailureCnt(Map map) {
		session.update(namespace + ".addLoginFailureCnt", map);
	}

	@Override
	public void resetLoginCnt(String id) {
		session.update(namespace + ".resetLoginCnt", id);
	}

	@Override
	public void lockAccount(String id) {
		session.update(namespace + ".lockAccount", id);
	}

	@Override
	public Employee getCurrentId(String empId) {
		return session.selectOne(namespace + ".getCurrentId", empId); 
	}

	@Override
	public int getDeptCost(String empId) {
		return session.selectOne(namespace + ".getDeptCost", empId);
	}

	@Override
	public EmployeeDTO.MyPageInfo getReservationByEmpId(String empId) {
		return session.selectOne(namespace + ".getReservationByEmpId", empId);
	}

}
