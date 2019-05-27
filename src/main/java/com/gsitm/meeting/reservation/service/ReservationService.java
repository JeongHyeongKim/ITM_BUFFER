package com.gsitm.meeting.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.meeting.reservation.dao.ReservationDaoImpl;
import com.gsitm.meeting.reservation.dto.Reservation;
import com.gsitm.meeting.room.dto.MeetingRoom;

@Service
public class ReservationService {

	@Autowired
	private ReservationDaoImpl resDao;
	
	public List<Reservation> resList(){
		//System.out.println("»Æ¿Œ: "+resDao.resList());
		return resDao.resList();
	}
	public List<MeetingRoom> meetingRoomList(){
		System.out.println(resDao.meetingRoomList());
		return resDao.meetingRoomList();
	}
}
