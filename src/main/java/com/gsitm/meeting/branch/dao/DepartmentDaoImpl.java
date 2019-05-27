package com.gsitm.meeting.branch.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.meeting.branch.dto.Department;

@Repository
public class DepartmentDaoImpl implements DepartmentDao{
	
	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.departmentMapper";

	@Override
	public int departmentCreate(String deptId, String deptName, String deptCost, String brId) {
		return session.insert(namespace+"departmentInsert");
	}

	@Override
	public List<Department> departmentList() {
		return session.selectList(namespace+"departmentList");
	}

	@Override
	public Department departmentOne(String deptId) {
		return session.selectOne(namespace+"departmentOne");
	}

	@Override
	public int departmentUpdate(String deptId, String deptName, String deptCost, String brId) {
		return session.update(namespace+"departmentUpdate");
	}

	@Override
	public int departmentDelete(String deptId) {
		return session.delete(namespace+"departmentDelete");
	}


}
