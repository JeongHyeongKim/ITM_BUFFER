package com.gsitm.meeting.branch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.gsitm.meeting.branch.dao.BranchDaoImpl;
import com.gsitm.meeting.branch.dto.Branch;

@Service
public class BranchService {

	@Autowired
	private BranchDaoImpl brDao;
	
	@Autowired
	private Gson gson;
	
	public String branchList(){
		System.out.println(brDao.branchList());
		return gson.toJson(brDao.branchList());
	}
	
	public String branchOne(String branchId) {
		System.out.println(brDao.branchOne(branchId));
		return gson.toJson(brDao.branchOne(branchId));
	}
	
	public void branchInsert(Branch branch) {
		brDao.branchCreate(branch);
	}
	
	
	public void branchUpdate(Branch branch) {
		brDao.branchUpdate(branch);
	}
	
	public void branchDelete(String brId) {
		brDao.branchDelete(brId);
	}
		
	
}
