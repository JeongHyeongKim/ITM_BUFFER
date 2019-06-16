package com.gsitm.meeting.reservation.dao;

import java.util.List;

import com.gsitm.meeting.vo.Branch;
import com.gsitm.meeting.vo.Reservation;

public interface RecognitionDao {
	public List<Reservation> resList();
	public List<Branch> branchList();
	/*public void updateResState(String resId);
	public String selectNewResList(String resId) ;*/
}
