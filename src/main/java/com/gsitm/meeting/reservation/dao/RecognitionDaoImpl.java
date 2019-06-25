package com.gsitm.meeting.reservation.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonElement;
import com.gsitm.meeting.branch.dto.DepartmentDTO;
import com.gsitm.meeting.reservation.dto.AttendeeDTO;
import com.gsitm.meeting.reservation.dto.RecognitionDTO.EmpAuthority;
import com.gsitm.meeting.users.dto.EmployeeDTO;
import com.gsitm.meeting.vo.Attendee;
import com.gsitm.meeting.vo.Branch;
import com.gsitm.meeting.vo.EquipmentReservation;
import com.gsitm.meeting.vo.Recognition;
import com.gsitm.meeting.vo.Reservation;

@Repository
public class RecognitionDaoImpl implements RecognitionDao{

	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.recognitionMapper";

	public List<Reservation> resList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".resList");
	}

	public List<Branch> branchList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".branchList");
	}

	public int allPayment() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".allPayment");
	}
	public List<DepartmentDTO.DepartmentTest> allDeptPayment(){
		return session.selectList(namespace+".allDeptPayment");
	}
	/*public void updateResState(String resId) {
		// TODO Auto-generated method stub
		 session.update(namespace+".updateResState",resId);
	}
	@Override
	public String selectNewResList(String resId) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".resNewList",resId);
	}*/

	public List<DepartmentDTO.DepartmentTest> myPaymentBySearch(String searchtype) {
		// TODO Auto-generated method stub
		Map<String, String> result = new HashMap<>();
		result.put("searchtype", searchtype);
		return session.selectList(namespace+".myPaymentBySearch",result);
	}

	@Override
	public int approval(String resId) {
		// TODO Auto-generated method stub
		return session.update(namespace+".approval",resId);
	}

	public int back(String resId) {
		// TODO Auto-generated method stub
		return session.update(namespace+".back",resId);
	}

	@Override
	public List<EmployeeDTO.MyPageInfo> getReservationBySearchtype(String empId, String searchtype,String brId) {
		Map<String, String> result = new HashMap<>();
		
		result.put("searchtype", searchtype);
		result.put("brId",brId);
		return session.selectList(namespace + ".getReservationBySearchtype",result);
	}
	
	@Override
	public List<Reservation> resListForHead() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".resListForHead");
	}
	@Override
	public int approvalByHead(String resId) {
		// TODO Auto-generated method stub
		return session.update(namespace+".approvalByHead",resId);
	}

	@Override
	public int backByHead(String resId) {
		// TODO Auto-generated method stub
		return session.update(namespace+".backByHead",resId);
	}

	@Override
	public List<EquipmentReservation> allEquipList() {
		return session.selectList(namespace +".allEquipList");
	}

	@Override
	public List<EmpAuthority> empAuthority() {
		return session.selectList(namespace +".empAuthority");
	}

	@Override
	public void updateAuthority(String empId) {
		session.update(namespace + ".updateAuthority", empId);
	}
	@Override
	public List<AttendeeDTO.forUpdateCost> getDeptIdDeptCostForUpdateDeptCost(String resId) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".getDeptIdDeptCostForUpdateDeptCost",resId);
	}
	@Override
	public void updateDeptCost(AttendeeDTO.forUpdateCost list) {
		session.update(namespace + ".updateDeptCost",list);
	}

	public void updateFinalRecognition(String resId, String adminId) {
		// TODO Auto-generated method stub
		Map<String, String> result = new HashMap<>();
		
		result.put("resId", resId);
		result.put("adminId",adminId);
		session.update(namespace+".updateFinalRecognition",result);
	}

	public void updateFinalNotRecognition(String resId, String adminId,String str) {
		// TODO Auto-generated method stub
		Map<String, String> result = new HashMap<>();
		
		result.put("resId", resId);
		result.put("adminId",adminId);
		result.put("str", str);
		session.update(namespace+".updateFinalNotRecognition",result);
	}

	public void updateByHeadRecognition(String resId, String adminId) {
		// TODO Auto-generated method stub
		Map<String, String> result = new HashMap<>();
		
		result.put("resId", resId);
		result.put("adminId",adminId);
		session.update(namespace+".updateByHeadRecognition",result);
	}

	public void updateByHeadNotRecognition(String resId, String adminId, String inputValue) {
		// TODO Auto-generated method stub
		Map<String, String> result = new HashMap<>();
		
		result.put("resId", resId);
		result.put("adminId",adminId);
		result.put("inputValue", inputValue);
		session.update(namespace+".updateByHeadNotRecognition",result);
	}

	public List<Recognition> recogList() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".recogList");
	}

}
