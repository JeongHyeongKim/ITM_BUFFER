package com.gsitm.meeting.branch.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.meeting.branch.dto.BranchDTO;
import com.gsitm.meeting.room.dto.MeetingRoomDTO;

@Repository
public class BranchDaoImpl implements BranchDao{
	
	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.branchMapper";

	@Override
	public List<BranchDTO> branchList() {
		return session.selectList(namespace+".branchList");
	}



	@Override
	public BranchDTO branchOne(String branchId) {
		return session.selectOne(namespace+".branchOne", branchId);
	}



	@Override
	public void branchDelete(String branchId) {
		session.delete(namespace+".branchDelete",branchId);
	}



	@Override
	public void branchUpdate(BranchDTO branch) {
		session.update(namespace+".branchUpdate", branch);
	}



	@Override
	public void branchCreate(BranchDTO branch) {
		session.insert(namespace+".branchInsert", branch);
	}



	@Override
	public String BranchGetRecent() {
		return session.selectOne(namespace+".branchMostRecent");
	}



	@Override
	public List<MeetingRoomDTO> meetingRoomListInBranch(String branchId) {
		return session.selectList(namespace+".meetingRoomInBranch",branchId);
	}



	@Override
	public List<HashMap<String, String>> meetingRoomListOrderByBranch() {
		return session.selectList(namespace+".meetingRoomListOrderByBranch");
	}



	@Override
	public String branchGetRecentImgId() {
		return session.selectOne(namespace+".branchImgMostRecent");
	}



	
	
	



	

}
