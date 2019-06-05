package com.gsitm.meeting.branch.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.meeting.branch.dto.DepartmentDTO;

@Repository
public class DepartmentDaoImpl implements DepartmentDao{
	
	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.departmentMapper";



	@Override
	public List<DepartmentDTO> departmentList() {
		return session.selectList(namespace+".departmentList");
	}

	@Override
	public DepartmentDTO departmentOne(String deptId) {
		return session.selectOne(namespace+".departmentOne", deptId);
	}

	@Override
	public void departmentCreate(DepartmentDTO department) {
		session.insert(namespace+".departmentInsert", department);
		
	}

	@Override
	public void departmentUpdate(DepartmentDTO department) {
		session.update(namespace+".departmentUpdate", department);
	}

	@Override
	public void departmentDelete(String deptId) {
		session.delete(namespace+".departmentDelete", deptId);
		
	}

	




}
