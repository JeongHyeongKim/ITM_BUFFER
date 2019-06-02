package com.gsitm.meeting.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.meeting.branch.dto.Branch;
import com.gsitm.meeting.reservation.dto.Reservation;
import com.gsitm.meeting.room.dto.MeetingRoom;
import com.gsitm.meeting.users.dto.Employee;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.reservationMapper";
	
	/*@Override
	public List<Reservation> resList(String mrName) {
		return session.selectList(namespace + ".resList");
	}*/

	@Override
	public List<MeetingRoom> meetingRoomList(String brId) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".meetingRoomList", brId);
	}

	@Override
	public List<Employee> meetingPeopleList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".meetingPeopleList");
	}
	@Override
	public List<Reservation> resList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".resList" );
	}
	@Override
	public List<Branch> branchList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".branchList");
	}

	@Override
	public void writeReservation(Reservation reservation) {
		// TODO Auto-generated method stub
		session.insert(namespace+".writeReservation", reservation);
	}

	@Override
	public List<MeetingRoom> mrTypeList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".mrTypeList");
	}

	public List<MeetingRoom> mrLimitList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".mrLimitList");
	}
	
	
	
	

}
