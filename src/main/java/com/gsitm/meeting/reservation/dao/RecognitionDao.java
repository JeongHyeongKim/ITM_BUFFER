package com.gsitm.meeting.reservation.dao;

import java.util.List;

import com.gsitm.meeting.branch.dto.DepartmentDTO;
import com.gsitm.meeting.users.dto.EmployeeDTO;
import com.gsitm.meeting.vo.Branch;
import com.gsitm.meeting.vo.Department;
import com.gsitm.meeting.vo.Reservation;

public interface RecognitionDao {
	public List<Reservation> resList();
	public List<Branch> branchList();
	public int allPayment();
	public List<DepartmentDTO.DepartmentTest> allDeptPayment();
	public List<DepartmentDTO.DepartmentTest> myPaymentBySearch(String searchtype);
	public int approval(String resId);
	public int back(String resId);
	public List<EmployeeDTO.MyPageInfo> getReservationBySearchtype(String empId, String searchtype,String searchtypeByBranch);
	/*public void updateResState(String resId);
	public String selectNewResList(String resId) ;*/
}
