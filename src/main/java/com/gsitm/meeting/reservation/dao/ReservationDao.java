package com.gsitm.meeting.reservation.dao;

import java.util.List;

import com.gsitm.meeting.reservation.dto.Reservation;
import com.gsitm.meeting.room.dto.MeetingRoom;

public interface ReservationDao {
	public List<Reservation> resList();
	public List<MeetingRoom> meetingRoomList();
}
