package com.gsitm.meeting.branch.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.meeting.branch.dto.DepartmentHead;

@Repository
public class DepartmentHeadDaoImpl implements DepartmentHeadDao{
	
	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.departmentHeadMapper";

	@Override
	public int departmentHeadCreate(String empId, String deptId) {
		// TODO Auto-generated method stub
		return session.insert(namespace+"departmentHeadInsert");
	}

	@Override
	public List<DepartmentHead> departmentHeadList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"departmentHeadList");
	}

	@Override
	public DepartmentHead departmentHeadOne(String empId) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"departmentHeadOne");
	}

	@Override
	public int departmentHeadUpdate(String empId, String deptId) {
			
		return session.update(namespace+"departmentHeadUpdate");
		
	}

	@Override
	public int departmentHeadDelete(String empId) {
		// TODO Auto-generated method stub
		return session.delete(namespace+"departmentHeadDelete");
		
	}

}
