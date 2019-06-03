package com.gsitm.meeting.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.gsitm.meeting.branch.dto.Branch;
import com.gsitm.meeting.reservation.dao.ReservationDaoImpl;
import com.gsitm.meeting.reservation.dto.Reservation;
import com.gsitm.meeting.room.dto.MeetingRoom;
import com.gsitm.meeting.users.dto.Employee;

@Service
public class ReservationService {

	@Autowired
	private ReservationDaoImpl resDao;
	
	@Autowired
	private Gson gson;
	
	public List<Reservation> resList(String brId){
		//System.out.println("Ȯ��: "+resDao.resList());
		//return gson.toJson(resDao.resList());
		return resDao.resList(brId);
	}
	public List<MeetingRoom> meetingRoomList(String brId){
		//System.out.println(resDao.meetingRoomList());
		return resDao.meetingRoomList(brId);
		
	}
	public List<Employee> meetingPeopleList(){
		return resDao.meetingPeopleList();
	}
	public List<Branch> branchList(){
		return resDao.branchList();
	}
	public void writeReservation(Reservation reservation) {
		// TODO Auto-generated method stub
		resDao.writeReservation(reservation);
	}
	public List<MeetingRoom> mrTypeList(){
		return resDao.mrTypeList();
	}
	public List<MeetingRoom> mrLimitList(){
		return resDao.mrLimitList();
	}
}
