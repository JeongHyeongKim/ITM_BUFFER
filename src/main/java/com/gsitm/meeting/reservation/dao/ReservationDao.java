package com.gsitm.meeting.reservation.dao;

import java.util.List;

import com.gsitm.meeting.branch.dto.BranchDTO;
import com.gsitm.meeting.reservation.dto.EquipmentReservationDTO;
import com.gsitm.meeting.reservation.dto.ReservationDTO;
import com.gsitm.meeting.room.dto.MeetingRoomDTO;
import com.gsitm.meeting.users.dto.EmployeeDTO;
import com.gsitm.meeting.vo.Reservation;

public interface ReservationDao {
	public List<ReservationDTO> resList(String brId);
	public List<MeetingRoomDTO> meetingRoomList(String brId);
	public List<EmployeeDTO> meetingPeopleList();
	public List<BranchDTO> branchList();
	public void writeReservation(ReservationDTO reservation);
	public List<MeetingRoomDTO> mrTypeList();
	public List<MeetingRoomDTO> mrLimitList();
	public List<ReservationDTO> mrReservationList(String mrId);
	public List<EquipmentReservationDTO> equipList(String mrId);
}
