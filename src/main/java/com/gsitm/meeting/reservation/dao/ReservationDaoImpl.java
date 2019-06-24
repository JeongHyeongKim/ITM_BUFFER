package com.gsitm.meeting.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.meeting.branch.dto.BranchDTO;
import com.gsitm.meeting.reservation.dto.ReservationDTO;
import com.gsitm.meeting.reservation.dto.SearchDTO;
import com.gsitm.meeting.room.dto.MeetingRoomDTO;
import com.gsitm.meeting.users.dto.EmployeeDTO;
import com.gsitm.meeting.vo.Equipment;
import com.gsitm.meeting.vo.Reservation;

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
	public List<MeetingRoomDTO> meetingRoomList(String brId) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".meetingRoomList", brId);
	}

	@Override
	public List<EmployeeDTO> meetingPeopleList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".meetingPeopleList");
	}
	@Override
	public List<ReservationDTO> resList(String brId) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".resList" ,brId);
	}
	@Override
	public List<BranchDTO> branchList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".branchList");
	}

	@Override
	public void writeReservation(ReservationDTO reservation) {
		// TODO Auto-generated method stub
		session.insert(namespace+".writeReservation", reservation);
	}

	@Override
	public List<MeetingRoomDTO> mrTypeList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".mrTypeList");
	}

	public List<MeetingRoomDTO> mrLimitList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".mrLimitList");
	}

	@Override
	public List<ReservationDTO> mrReservationList(String mrId) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".mrReservationList",mrId);
	}

	@Override
	public List<Equipment> equipList(String mrId) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".equipList",mrId);
	}

	public List<MeetingRoomDTO> search(SearchDTO search) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".search",search);
	}

	public int cancelRes(String resId) {
		// TODO Auto-generated method stub
		return session.delete(namespace+".cancelRes",resId);
	}

	public List<ReservationDTO.mySchedule> mySchedule(String empId) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".mySchedule",empId);
	}

	@Override
	public List<EmployeeDTO> empList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".empList");
	}

	public List<ReservationDTO> myListPeriod(String resStartDate) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".myListPeriod");
	}

	@Override
	public String resMostRecent() {
		return session.selectOne(namespace+".resMostRecent");
	}

	@Override
	public List<Reservation> getPastReservation(String empId) {
		return session.selectList(namespace + ".getPastReservation", empId);
	}

	@Override
	public List<Equipment> getResEquip(String mrId) {
		return session.selectList(namespace + ".getResEquip", mrId);
	}

}
