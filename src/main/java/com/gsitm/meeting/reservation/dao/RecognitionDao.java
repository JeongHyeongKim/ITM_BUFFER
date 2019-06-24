package com.gsitm.meeting.reservation.dao;

import java.util.List;

import com.gsitm.meeting.branch.dto.DepartmentDTO;
import com.gsitm.meeting.reservation.dto.RecognitionDTO.EmpAuthority;
import com.gsitm.meeting.users.dto.EmployeeDTO;
import com.gsitm.meeting.vo.Branch;
import com.gsitm.meeting.vo.Department;
import com.gsitm.meeting.vo.Equipment;
import com.gsitm.meeting.vo.EquipmentReservation;
import com.gsitm.meeting.vo.Reservation;

public interface RecognitionDao {
	public List<Reservation> resList();
	public List<Branch> branchList();
	public int allPayment();
	public List<DepartmentDTO.DepartmentTest> allDeptPayment();
	public List<DepartmentDTO.DepartmentTest> myPaymentBySearch(String searchtype);
	public int approval(String resId);
	public int back(String resId);
	public void updateDeptCost(String deptId, String resCost);
	public List<EmployeeDTO.MyPageInfo> getReservationBySearchtype(String empId, String searchtype,String searchtypeByBranch);
	/*public void updateResState(String resId);
	public String selectNewResList(String resId) ;*/
	public List<Reservation> resListForHead();
	public int approvalByHead(String resId);
	public int backByHead(String resId);
	
	public List<EquipmentReservation> allEquipList();
	public List<EmpAuthority> empAuthority();
	public void updateAuthority(String empId);
}
