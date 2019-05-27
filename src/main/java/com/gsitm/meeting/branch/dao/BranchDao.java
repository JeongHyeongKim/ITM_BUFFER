package com.gsitm.meeting.branch.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gsitm.meeting.branch.dto.Branch;

public interface BranchDao {
	
	
	
	public List<Branch> branchList();
	
	public int branchDelete(String branchId);
	
	public Branch branchOne(String branchId);
	
	public int branchUpdate();
	
	public int branchCreate(String brId, String brName, String brLocation, String brTel, String brImg);

}
	