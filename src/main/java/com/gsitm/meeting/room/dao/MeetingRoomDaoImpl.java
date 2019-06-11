package com.gsitm.meeting.room.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.meeting.vo.MeetingRoom;

@Repository
public class MeetingRoomDaoImpl implements MeetingRoomDao {

	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.meetingRoomMapper";

	@Override
	public List<MeetingRoom> meetingRoomList() {
		
		return session.selectList(namespace+".meetRoomList");
	}

	@Override
	public void meetingRoomDelete(String meetingRoomId) {
		session.delete(namespace+".meetingRoomDelete", meetingRoomId);
		
	}

	@Override
	public MeetingRoom meetingRoomOne(String meetingRoomId) {
		return session.selectOne(namespace+".meetingRoomOne", meetingRoomId);
	}

	@Override
	public void meetingRoomUpdate(MeetingRoom meetingRoom) {
		session.update(namespace+".meetingRoomUpdate", meetingRoom);
	}

	@Override
	public void meetingRoomCreate(MeetingRoom meetingRoom) {
		session.insert(namespace+".meetingRoomInsert", meetingRoom);
	}

	@Override
	public String meetingRoomGetRecent() {
		return session.selectOne(namespace+".meetingRoomMostRecent");
	}


	@Override
	public String meetingRoomGetRecentImgId() {
		return session.selectOne(namespace+".meetingRoomImgMostRecent");
	}

}
