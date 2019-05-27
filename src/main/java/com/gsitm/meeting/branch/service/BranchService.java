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
	
	public List<Branch> branchList(){
		System.out.println(brDao.branchList());
		return gson.toJson(brDao.branchList());
	}
	
	public Branch branchOne(String branchId) {
		System.out.println(brDao.branchOne(branchId));
		return brDao.branchOne(branchId);
	}
	
	
}
