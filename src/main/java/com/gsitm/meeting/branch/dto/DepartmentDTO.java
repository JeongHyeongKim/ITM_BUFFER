package com.gsitm.meeting.branch.dto;

public class DepartmentDTO {
	private String deptId;
	private String deptName;
	private int deptCost;
	private String brId;
	
	public DepartmentDTO() {
		super();
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public int getDeptCost() {
		return deptCost;
	}
	public void setDeptCose(int deptCost) {
		this.deptCost = deptCost;
	}
	public String getBrId() {
		return brId;
	}
	public void setBrId(String brId) {
		this.brId = brId;
	}
	
	

}
