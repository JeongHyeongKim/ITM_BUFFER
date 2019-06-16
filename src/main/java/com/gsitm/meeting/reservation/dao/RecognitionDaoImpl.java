package com.gsitm.meeting.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonElement;
import com.gsitm.meeting.vo.Branch;
import com.gsitm.meeting.vo.Reservation;

@Repository
public class RecognitionDaoImpl implements RecognitionDao{

	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.recognitionMapper";

	public List<Reservation> resList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".resList");
	}

	public List<Branch> branchList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".branchList");
	}

	/*public void updateResState(String resId) {
		// TODO Auto-generated method stub
		 session.update(namespace+".updateResState",resId);
	}
	@Override
	public String selectNewResList(String resId) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".resNewList",resId);
	}*/

}
