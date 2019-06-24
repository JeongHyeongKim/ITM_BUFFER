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
import com.gsitm.meeting.vo.Equipment;
import com.gsitm.meeting.vo.Reservation;

@Service
public class ReservationService {

	@Autowired
	private ReservationDaoImpl resDao;
	
	@Autowired
	private Gson gson;
	
	public void insertReservation(Reservation res, String times, String equipElement) {
		
		String storedId = resDao.resMostRecent();
		String nextId = calcId(storedId);
		res.setResId(nextId);
		String changeStartTime = calcDate(res.getResStartDate());
		res.setResStartDate(changeStartTime+" "+times.split(",")[0]);
		String changeEndTime = calcDate(res.getResEndDate());
		res.setResEndDate(changeEndTime+" "+times.split(",")[1]);
		System.out.println("service : "+res);
		
		List<Equipment> storedEquip = resDao.getResEquip(res.getMrId());
		ArrayList<String> mrEquip = new ArrayList<>();
		for(int i=0; i<storedEquip.size(); i++) {
			mrEquip.add(storedEquip.get(i).getEqId());
		}
		System.out.println(equipElement);
		String[] equipList = equipElement.split(",");
		System.out.println(equipList);
		ArrayList<String> resultEquip = new ArrayList<>();
		System.out.println(equipList[2].split(" ")[0]);
		System.out.println(equipList[2].split(" ")[1].substring(1, 2));
		for(int i=0; i<equipList.length; i++) {
			if(equipList[i].split(" ")[0].equals("빔프로젝터")) {
				for(int j=0; j<Integer.parseInt(equipList[i].split(" ")[1].substring(1, 2)); j++) {
					for(int k=0; k<mrEquip.size(); k++) {
						if(mrEquip.get(k).substring(0, 1).equals("V")) {
							resultEquip.add(mrEquip.get(k));
						}
					}
				}
			}
			if(equipList[i].split(" ")[0].equals("화이트보드")) {
				for(int j=0; j<Integer.parseInt(equipList[i].split(" ")[1].substring(1, 2)); j++) {
					for(int k=0; k<mrEquip.size(); k++) {
						if(mrEquip.get(k).substring(0, 1).equals("W")) {
							resultEquip.add(mrEquip.get(k));
						}
					}
				}
			}
			if(equipList[i].split(" ")[0].equals("마이크")) {
				for(int j=0; j<Integer.parseInt(equipList[i].split(" ")[1].substring(1, 2)); j++) {
					for(int k=0; k<mrEquip.size(); k++) {
						if(mrEquip.get(k).substring(0, 1).equals("M")) {
							resultEquip.add(mrEquip.get(k));
						}
					}
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
		
		System.out.println(resultEquip);
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
	public String empList() {
		// TODO Auto-generated method stub
		return gson.toJson(resDao.empList());
	}
	public List<ReservationDTO> myListPeriod(String resStartDate) {
		// TODO Auto-generated method stub
		return resDao.myListPeriod(resStartDate);
	}
	
	public String getPastReservation(String empId) {
		System.out.println(gson.toJson(resDao.getPastReservation(empId)));
		return gson.toJson(resDao.getPastReservation(empId));
	}
}
