package com.gsitm.meeting.reservation.dao;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonElement;
import com.gsitm.meeting.branch.dto.DepartmentDTO;
import com.gsitm.meeting.users.dto.EmployeeDTO;
import com.gsitm.meeting.vo.Branch;
import com.gsitm.meeting.vo.Department;
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
	public void updateDeptCost(String deptId, String resCost) {
		// TODO Auto-generated method stub
		Map<String, String> result = new HashMap<>();
		
		result.put("deptId", deptId);
		result.put("resCost",resCost);
		System.out.println("DaolImpl Start: ");
		session.update(namespace + ".updateDeptCost",result);
		System.out.println("DaolImpl End: ");
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

}
