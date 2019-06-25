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
		return session.selectList(namespace + ".meetingRoomList", brId);
	}

	@Override
	public List<EmployeeDTO> meetingPeopleList() {
		return session.selectList(namespace + ".meetingPeopleList");
	}
	@Override
	public List<ReservationDTO> resList(String brId) {
		return session.selectList(namespace + ".resList" ,brId);
	}
	@Override
	public List<BranchDTO> branchList() {
		return session.selectList(namespace+".branchList");
	}

	@Override
	public void writeReservation(ReservationDTO reservation) {
		session.insert(namespace+".writeReservation", reservation);
	}

	@Override
	public List<MeetingRoomDTO> mrTypeList() {
		return session.selectList(namespace+".mrTypeList");
	}

	public List<MeetingRoomDTO> mrLimitList() {
		return session.selectList(namespace+".mrLimitList");
	}

	@Override
	public List<ReservationDTO> mrReservationList(String mrId) {
		return session.selectList(namespace+".mrReservationList",mrId);
	}

	@Override
	public List<Equipment> equipList(String mrId) {
		return session.selectList(namespace+".equipList",mrId);
	}

	public List<MeetingRoomDTO> search(SearchDTO search) {
		return session.selectList(namespace+".search",search);
	}

	public int cancelRes(String resId) {
		return session.delete(namespace+".cancelRes",resId);
	}

	public List<ReservationDTO.mySchedule> mySchedule(String empId) {
		return session.selectList(namespace+".mySchedule",empId);
	}

	@Override
	public List<EmployeeDTO> empList() {
		return session.selectList(namespace+".empList");
	}

	public List<ReservationDTO> myListPeriod(String resStartDate) {
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

	@Override
	public String getDeptIdByEmpId(String empId) {
		return session.selectOne(namespace + ".getDeptIdByEmpId", empId);
	}

	@Override
	public int getCostByErId(String mrId) {
		return session.selectOne(namespace + ".getCostByErId", mrId);
	}

}
