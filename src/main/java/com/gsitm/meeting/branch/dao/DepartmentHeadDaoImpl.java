package com.gsitm.meeting.branch.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.meeting.branch.dto.DepartmentHeadDTO;

@Repository
public class DepartmentHeadDaoImpl implements DepartmentHeadDao{
	
	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.departmentHeadMapper";



	@Override
	public List<DepartmentHeadDTO> departmentHeadList() {
		return session.selectList(namespace+".departmentHeadList");
	}

	@Override
	public DepartmentHeadDTO departmentHeadOneByEmpId(String empId) {
		return session.selectOne(namespace+".departmentHeadOneByEmpId");
	}


	@Override
	public void departmentHeadCreate(DepartmentHeadDTO departmentHead) {
		session.insert(namespace+".departmentHeadCreate", departmentHead);
		
	}

	@Override
	public void departmentHeadUpdate(DepartmentHeadDTO departmentHead) {
		session.update(namespace+".departmentHeadUpdate", departmentHead);
		
	}

	@Override
	public void departmentHeadDelete(String empId) {
		session.delete(namespace+".departmentHradDelete", empId);
	}

	@Override
	public DepartmentHeadDTO departmentHeadOneByDeptId(String deptId) {
		return session.selectOne(namespace+".departmentHeadHeadOneByDeptId");
	}
	

}
