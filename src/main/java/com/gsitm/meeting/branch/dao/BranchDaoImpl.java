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
	public Branch branchOne(String branchId) {
		return session.selectOne(namespace+".branchOne", branchId);
	}



	@Override
	public void branchDelete(String branchId) {
		session.delete(namespace+".branchDelete",branchId);
	}



	@Override
	public void branchUpdate(Branch branch) {
		session.update(namespace+".branchUpdate", branch);
	}



	@Override
	public void branchCreate(Branch branch) {
		session.insert(namespace+".branchInsert", branch);
	}



	@Override
	public String BranchGetRecent() {
		return session.selectOne(namespace+".branchMostRecent");
	}
	
	



	

}
