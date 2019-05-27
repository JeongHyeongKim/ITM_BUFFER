package com.gsitm.meeting.users.dto;

public class Employee {
	
	private String empId;
	private String empName;
	private String empPwd;
	private String deptId;
	private String brId;
	private String empLevel;
	private String empEnabled;
	private int empFailureCnt;
	private String empEmail;
	
	public Employee() {
		super();
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpPwd() {
		return empPwd;
	}
	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getBrId() {
		return brId;
	}
	public void setBrId(String brId) {
		this.brId = brId;
	}
	public String getEmpLevel() {
		return empLevel;
	}
	public void setEmpLevel(String empLevel) {
		this.empLevel = empLevel;
	}
	public String getEmpEnabled() {
		return empEnabled;
	}
	public void setEmpEnabled(String empEnabled) {
		this.empEnabled = empEnabled;
	}
	public int getEmpFailureCnt() {
		return empFailureCnt;
	}
	public void setEmpFailureCnt(int empFailureCnt) {
		this.empFailureCnt = empFailureCnt;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	
	

}
