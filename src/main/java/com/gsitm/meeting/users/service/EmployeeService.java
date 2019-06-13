package com.gsitm.meeting.users.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.gsitm.meeting.users.dao.EmployeeDaoImpl;
import com.gsitm.meeting.users.dto.EmployeeDTO;
import com.gsitm.meeting.users.dto.EmployeeDTO.AvailableMeetingDate;
import com.gsitm.meeting.vo.Employee;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeDaoImpl empDao;
	
	@Autowired
	private Gson gson;
	
	public void lockAccount(String id) {
		empDao.lockAccount(id);
	}
	
	public Employee getCurrentId(String id) {
		return (empDao.getCurrentId(id));
	}
	
	public String getDeptCost(String empId) {
		return gson.toJson(empDao.getDeptCost(empId));
	}
	
	public String getReservationByEmpId(String empId) {
		return gson.toJson(empDao.getReservationByEmpId(empId));
	}
	
	public String getReservationBySearchtype(String empId, String searchtype) {
		return gson.toJson(empDao.getReservationBySearchtype(empId, searchtype));
	}
	
	//윤영
	public String availableMeetingDate(String availableDate, String mrId) throws ParseException {
		
		String[] splitDate = availableDate.split("-");
		String year = splitDate[0].substring(3, 5);
		String month = splitDate[1];
		String day = Integer.toString((Integer.parseInt(splitDate[2].substring(0, 2)) + 1));
		String transDate = year + "/" + month + "/" + day;
		
		List<EmployeeDTO.AvailableMeetingDate> result = empDao.availableMeetingDate(transDate, mrId);
		List<String[]> resultTime = new ArrayList<>();
		for(int i=0; i<result.size(); i++) {
			AvailableMeetingDate resultDate = result.get(i);
			
			String startDate = (resultDate.getResStartDate().replace(":", ""));
			String endDate = (resultDate.getResEndDate().replace(":", ""));
			int calcDate = Integer.parseInt(endDate) - Integer.parseInt(startDate);
			int mod = calcDate / 50;
			System.out.println("calcDate : " + calcDate + " mod : "+ mod);
			
			resultTime.add(calcTime(mod,startDate));
		}
		
		return gson.toJson(resultTime);
	}
	
	public String[] calcTime(int mod, String startTime) {
		String[] resultTime = new String[mod + 3];
		System.out.println(startTime);
		int hour =0;
		int minute =0;
		
		if(startTime.substring(2,4).equals("00")) {
			hour = (Integer.parseInt(startTime.substring(0,2))-1);
			minute = 30;
			System.out.println(hour +":"+minute);
		} else {
			hour = Integer.parseInt(startTime.substring(0,2));
			minute = 00;
			System.out.println(hour +":"+minute);
		}
		resultTime[0] = Integer.toString(hour) +":"+Integer.toString(minute);
		for(int i=1; i<mod+3; i++) {
			if(minute==30) {
				hour = hour+1;
				minute = 00;
			} else {
				minute = 30;
			}
			resultTime[i] = Integer.toString(hour) +":" +Integer.toString(minute);
		}
		return resultTime;
	}
	
	public String CurrentInfoByMrId(String mrId) {
		
		return gson.toJson(empDao.CurrentInfoByMrId(mrId));
	}
}
