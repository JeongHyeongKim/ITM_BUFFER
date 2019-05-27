package com.gsitm.meeting.branch.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.meeting.branch.dto.Branch;

@Repository
public class BranchDaoImpl implements BranchDao{
	
	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.branchMapper";

	@Override
	public List<Branch> branchList() {
		return session.selectList(namespace+".branchList");
	}

	@Override
	public int branchDelete(String branchId) {
		return session.delete(namespace+".branchDelete");
		
	}

	@Override
	public Branch branchOne(String branchId) {
		return session.selectOne(namespace+".branchOne");
	}

	@Override
	public int branchUpdate() {
		return session.update(namespace+".branchUpdate");
		
	}

	@Override
	public int branchCreate(String brId, String brName, String brLocation, String brTel, String brImg) {
		return session.insert(namespace+".branchInsert");
	}

}
