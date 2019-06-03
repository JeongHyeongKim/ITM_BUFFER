package com.gsitm.meeting.reservation.dao;

import java.util.List;

import com.gsitm.meeting.branch.dto.Branch;
import com.gsitm.meeting.reservation.dto.Reservation;
import com.gsitm.meeting.room.dto.MeetingRoom;
import com.gsitm.meeting.users.dto.Employee;

public interface ReservationDao {
	public List<Reservation> resList(String brId);
	public List<MeetingRoom> meetingRoomList(String brId);
	public List<Employee> meetingPeopleList();
	public List<Branch> branchList();
	public void writeReservation(Reservation reservation);
	public List<MeetingRoom> mrTypeList();
	public List<MeetingRoom> mrLimitList();
}
