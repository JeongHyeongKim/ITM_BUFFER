package com.gsitm.meeting.reservation.dto;

import java.util.Date;

import lombok.Data;

public class RecognitionDTO {
	
	private String recId;
	private String deptHeadId;
	private String manId;
	private Date recAcceptDate;
	private String resId;
	private Date recRefuse;
	
	public RecognitionDTO() {
		super();
	}
	public String getRecId() {
		return recId;
	}
	public void setRecId(String recId) {
		this.recId = recId;
	}
	public String getDeptHeadId() {
		return deptHeadId;
	}
	public void setDeptHeadId(String deptHeadId) {
		this.deptHeadId = deptHeadId;
	}
	public String getManId() {
		return manId;
	}
	public void setManId(String manId) {
		this.manId = manId;
	}
	public Date getRecAcceptDate() {
		return recAcceptDate;
	}
	public void setRecAcceptDate(Date recAcceptDate) {
		this.recAcceptDate = recAcceptDate;
	}
	public String getResId() {
		return resId;
	}
	public void setResId(String resId) {
		this.resId = resId;
	}
	public Date getRecRefuse() {
		return recRefuse;
	}
	public void setRecRefuse(Date recRefuse) {
		this.recRefuse = recRefuse;
	}
	
	@Data
	public static class EmpAuthority{
		
		private String empId;
		private String empName;
		private String deptName;
		private String authority;
	}
}
