package com.gsitm.meeting.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.meeting.reservation.dto.Reservation;
import com.gsitm.meeting.room.dto.MeetingRoom;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.reservationMapper";

	@Override
	public List<Reservation> resList() {
		return session.selectList(namespace + ".resList");
	}

	@Override
	public List<MeetingRoom> meetingRoomList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".meetingRoomList");
	}

}
