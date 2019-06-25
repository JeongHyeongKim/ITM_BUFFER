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
		////////// cost계산
		
		String t1 = res.getResStartDate();
		String t2 = res.getResEndDate();
		
		String t1split = t1.split(" ")[0];
       	String t1splitYear = t1split.split("-")[0];
       	int t1splitMonth = Integer.parseInt(t1split.split("-")[1]);
       	int t1splitDay = Integer.parseInt(t1split.split("-")[2]);
       	
       	String t2split = t2.split(" ")[0];
       	String t2splitYear = t2split.split("-")[0];
       	int t2splitMonth = Integer.parseInt(t2split.split("-")[1]);
       	int t2splitDay = Integer.parseInt(t2split.split("-")[2]);
       	
       	int yearCost = (Integer.parseInt(t2splitYear) - Integer.parseInt(t1splitYear))*365;
       	int monthCost=0;
       	// 한달이상 예외
       	if(t1splitMonth==1 || t1splitMonth==3 || t1splitMonth==5 || t1splitMonth==7 || t1splitMonth==8 || t1splitMonth==10 || t1splitMonth==12){
       		monthCost = (t2splitMonth - t1splitMonth)*31;
       	} else if(t1splitMonth==4 || t1splitMonth==6 || t1splitMonth==9 || t1splitMonth==11){
       		monthCost = (t2splitMonth - t1splitMonth)*30;
       	} else {
       		monthCost = (t2splitMonth - t1splitMonth)*28;
       	}
       	int dayCost = (t2splitDay - t1splitDay);
       	int dateCost = (yearCost + monthCost + dayCost) *9;
       	
       	String t1splitTime = t1.split(" ")[1];
       	String t2splitTime = t2.split(" ")[1];
       	int t1splitHour = Integer.parseInt(t1splitTime.split(":")[0]); 
       	int t2splitHour = Integer.parseInt(t2splitTime.split(":")[0]);
       	int t1splitMinute = Integer.parseInt(t1splitTime.split(":")[1]);
       	int t2splitMinute = Integer.parseInt(t2splitTime.split(":")[1]);
       	
       	int minuteCost = t2splitMinute - t1splitMinute; // 0 || 30 || -30
       	int hourCost = t2splitHour - t1splitHour;
       	if(minuteCost<0) {
       		hourCost = hourCost -1;
       		minuteCost = 30;
       	}
       	
       	int mrCost = resDao.getCostByErId(res.getMrId()); // 5000원
       	
       	int cost = (dateCost+hourCost)*(2*mrCost);
       	if(minuteCost ==30) {
       		cost = cost + mrCost;
       	}
       	res.setResCost(cost);
		// resultEquip 전송 (기자재)
		System.out.println("equip : " + sendEquip);
		// res 전송 (예약)
		System.out.println("reservation : " + res);
		// empList 전송 (참석자)
		System.out.println("attendee : " + sendAttendee);
	}
	
	public String calcDate(String currentDate) {
		if(currentDate.length()==10) {
			
			currentDate.replaceAll("/", "-");
			
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
