package com.gsitm.meeting.branch.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gsitm.meeting.branch.dto.BranchDTO;
import com.gsitm.meeting.room.dto.MeetingRoomDTO;

public interface BranchDao {
	

	public List<BranchDTO> branchList();
	
	public void branchDelete(String branchId);
	
	public BranchDTO branchOne(String branchId);
	
	public void branchUpdate(BranchDTO branch);
	
	public void branchCreate(BranchDTO branch);
	
	public String BranchGetRecent();
	
	public List<MeetingRoomDTO> meetingRoomListInBranch(String branchId);
	
	public List<HashMap<String,String>> meetingRoomListOrderByBranch();
	
	public String branchGetRecentImgId();

}
	