package com.gsitm.meeting.reservation.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.gsitm.meeting.branch.dto.BranchDTO;
import com.gsitm.meeting.reservation.dao.ReservationDaoImpl;
import com.gsitm.meeting.reservation.dto.EquipmentReservationDTO;
import com.gsitm.meeting.reservation.dto.ReservationDTO;
import com.gsitm.meeting.reservation.dto.SearchDTO;
import com.gsitm.meeting.vo.Reservation;
import com.gsitm.meeting.room.dto.MeetingRoomDTO;
import com.gsitm.meeting.users.dto.EmployeeDTO;

@Service
public class ReservationService {

	@Autowired
	private ReservationDaoImpl resDao;
	
	@Autowired
	private Gson gson;
	
	public List<ReservationDTO> resList(String brId){
		return resDao.resList(brId);
	}
	public List<MeetingRoomDTO> meetingRoomList(String brId){
		//System.out.println(resDao.meetingRoomList());
		return resDao.meetingRoomList(brId);
		
	}
	public List<EmployeeDTO> meetingPeopleList(){
		return resDao.meetingPeopleList();
	}
	public List<BranchDTO> branchList(){
		return resDao.branchList();
	}
	public void writeReservation(ReservationDTO reservation) {
		// TODO Auto-generated method stub
		resDao.writeReservation(reservation);
	}
	public List<MeetingRoomDTO> mrTypeList(){
		return resDao.mrTypeList();
	}
	public List<MeetingRoomDTO> mrLimitList(){
		return resDao.mrLimitList();
	}
	public List<ReservationDTO> mrReservationList(String mrId){
		return resDao.mrReservationList(mrId);
	}
	public List<EquipmentReservationDTO> equipList(String mrId){
		return resDao.equipList(mrId);
	}
	public List<MeetingRoomDTO> search(SearchDTO search) {
		// TODO Auto-generated method stub
		System.out.println(search);
		return resDao.search(search);
	}
	
	//이후에 users 패키지로 옮길 것
	public int cancelRes(String resId) {
		// TODO Auto-generated method stub
		return resDao.cancelRes(resId);
	}
	
	public String mySchedule(String empId) {
		// TODO Auto-generated method stub
		return gson.toJson(resDao.mySchedule(empId));
	}
	public List<EmployeeDTO> empList() {
		// TODO Auto-generated method stub
		return resDao.empList();
	}
	public List<ReservationDTO> myListPeriod(String resStartDate) {
		// TODO Auto-generated method stub
		return resDao.myListPeriod(resStartDate);
	}
	

}
