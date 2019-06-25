package com.gsitm.meeting.reservation.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.gsitm.meeting.branch.dto.BranchDTO;
import com.gsitm.meeting.reservation.dao.ReservationDaoImpl;
import com.gsitm.meeting.reservation.dto.EquipmentReservationDTO;
import com.gsitm.meeting.reservation.dto.ReservationDTO;
import com.gsitm.meeting.reservation.dto.SearchDTO;
import com.gsitm.meeting.room.dto.MeetingRoomDTO;
import com.gsitm.meeting.users.dto.EmployeeDTO;
import com.gsitm.meeting.vo.Attendee;
import com.gsitm.meeting.vo.Equipment;
import com.gsitm.meeting.vo.EquipmentReservation;
import com.gsitm.meeting.vo.Reservation;

@Service
public class ReservationService {

	@Autowired
	private ReservationDaoImpl resDao;
	
	@Autowired
	private Gson gson;
	
	public void insertReservation(Reservation res, String times, String equipElement, String empList) {
		
		String storedId = resDao.resMostRecent();
		String nextId = calcId(storedId);
		// 계산된 ID값 입력
		res.setResId(nextId);
		
		// 데이트포멧 변경후 입력
		String changeStartTime = calcDate(res.getResStartDate());
		res.setResStartDate(changeStartTime+" "+times.split(",")[0]);
		String changeEndTime = calcDate(res.getResEndDate());
		res.setResEndDate(changeEndTime+" "+times.split(",")[1]);
		
		// 기자재 입력
		List<Equipment> storedEquip = resDao.getResEquip(res.getMrId());
		ArrayList<String> mrEquip = new ArrayList<>();
		for(int i=0; i<storedEquip.size(); i++) {
			mrEquip.add(storedEquip.get(i).getEqId());
		}
		
		String[] equipList = equipElement.split(",");
		
		ArrayList<String> resultEquip = new ArrayList<>();
		
		for(int i=0; i<equipList.length; i++) {
			
			if(equipList[i].split(" ")[0].equals("빔프로젝터")) {
				int count = 0 ;
				for(int j=0; j<Integer.parseInt(equipList[i].split(" ")[1].substring(1, 2)); j++) {
					for(int k=0; k<mrEquip.size(); k++) {
						
						if(mrEquip.get(k).substring(0, 1).equals("V")) {
							break;
						}
						count++;
					}
				}
				for(int j=0; j<Integer.parseInt(equipList[i].split(" ")[1].substring(1, 2)); j++) {
					resultEquip.add(mrEquip.get(count+j));
				}
			}
			if(equipList[i].split(" ")[0].equals("화이트보드")) {
				int count = 0 ;
				for(int j=0; j<Integer.parseInt(equipList[i].split(" ")[1].substring(1, 2)); j++) {
					for(int k=0; k<mrEquip.size(); k++) {
						
						if(mrEquip.get(k).substring(0, 1).equals("W")) {
							break;
						}
						count++;
					}
				}
				for(int j=0; j<Integer.parseInt(equipList[i].split(" ")[1].substring(1, 2)); j++) {
					resultEquip.add(mrEquip.get(count+j));
				}
			}
			if(equipList[i].split(" ")[0].equals("마이크")) {
				int count = 0 ;
				for(int j=0; j<Integer.parseInt(equipList[i].split(" ")[1].substring(1, 2)); j++) {
					for(int k=0; k<mrEquip.size(); k++) {
						
						if(mrEquip.get(k).substring(0, 1).equals("M")) {
							break;
						}
						count++;
					}
				}
				for(int j=0; j<Integer.parseInt(equipList[i].split(" ")[1].substring(1, 2)); j++) {
					resultEquip.add(mrEquip.get(count+j));
				}
			}
			if(equipList[i].split(" ")[0].equals("노트북")) {
				int count =0;
				for(int j=0; j<Integer.parseInt(equipList[i].split(" ")[1].substring(1, 2)); j++) {
					for(int k=0; k<mrEquip.size(); k++) {
						
						if(mrEquip.get(k).substring(0, 1).equals("N")) {
							break;
						}
						count++;
					}
				}
				for(int j=0; j<Integer.parseInt(equipList[i].split(" ")[1].substring(1, 2)); j++) {
					resultEquip.add(mrEquip.get(count+j));
				}
			}
		}
		List<EquipmentReservation> sendEquip = new ArrayList<>();
		for(int i=0; i<resultEquip.size(); i++) {
			EquipmentReservation temp = new EquipmentReservation(nextId, resultEquip.get(i));
			sendEquip.add(temp);
		}
		// attendee 객체
		String[] empListArray = empList.split(",");
		List<Attendee> sendAttendee = new ArrayList<>();
		
		for(int i=0; i<empListArray.length; i++) {
			String deptId = resDao.getDeptIdByEmpId(empListArray[i]);
			Attendee temp = new Attendee(nextId, empListArray[i], "att_type_0", deptId);
			sendAttendee.add(temp);
		}

		// resultEquip 전송 (기자재)
		System.out.println("equip : " + sendEquip);
		// res 전송 (예약)
		System.out.println("reservation : " + res);
		// empList 전송 (참석자)
		System.out.println("attendee : " + sendAttendee);
	}
	
	public String calcDate(String currentDate) {
		if(currentDate.length()==10) {
			return currentDate;
		}
		String[] splitDate = currentDate.split("-");
		String year = splitDate[0].substring(1,5);
		String month = splitDate[1];
		String day = splitDate[2].substring(0, 2);
		String date = year+"-"+month+"-"+day;
		return date;
	}
	public String calcId(String storedId) {
		String resId = storedId.split("_")[1]; // 숫자 뒤에 있는거 자르고 쓰기
		int resIdInt = Integer.parseInt(resId)+1;
		
		String nextId=null;
		if(resIdInt>999) {
			nextId="res_"+resIdInt;
		} else if(resIdInt>99) {
			nextId="res_0"+resIdInt;
		} else if(resIdInt>9) {
			nextId="res_00"+resIdInt;
		} else if(resIdInt>=0) {
			nextId="res_000"+resIdInt;	
		}
		return nextId;
	}
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
	public String equipList(String mrId){
		
		Map<String,Integer> countEquip = new HashMap<>(); 
		List<Equipment> equi = resDao.equipList(mrId);
		
		for(Equipment eqId : equi) {
			if(countEquip.get(eqId.getEqId())==null) {
				
				countEquip.put(eqId.getEqId(), 1);
			} else {
				
				countEquip.put(eqId.getEqId(), countEquip.get(eqId.getEqId())+1);
			}
		}
		
		return gson.toJson(countEquip);
	}
	public List<MeetingRoomDTO> search(SearchDTO search) {
		
		return resDao.search(search);
	}
	
	//이후에 users 패키지로 옮길 것
	public int cancelRes(String resId) {
		
		return resDao.cancelRes(resId);
	}
	
	public String mySchedule(String empId) {
		
		return gson.toJson(resDao.mySchedule(empId));
	}
	public List<EmployeeDTO> empList() {
		return resDao.empList();
	}
	public List<ReservationDTO> myListPeriod(String resStartDate) {
		
		return resDao.myListPeriod(resStartDate);
	}
	
	public String getPastReservation(String empId) {
		
		return gson.toJson(resDao.getPastReservation(empId));
	}
}
