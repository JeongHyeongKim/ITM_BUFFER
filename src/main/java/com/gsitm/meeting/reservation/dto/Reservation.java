package com.gsitm.meeting.reservation.dto;

import java.util.Date;

public class Reservation {
	
	private String resId;
	private String empId;
	private String mrId;
	private Date resStartDate;
	private Date resEndDate;
	private Date resDate;
	private String resPurpose;
	private int resAttendCnt;
	private String resAddRequest;
	private String resState;
	private int resSnack;
	private String resType;
	private String resCancle;
	private int resCost;
	private int resOutside;
	
	public Reservation() {
		
	}

	public String getResId() {
		return resId;
	}

	public void setResId(String resId) {
		this.resId = resId;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getMrId() {
		return mrId;
	}

	public void setMrId(String mrId) {
		this.mrId = mrId;
	}

	public Date getResStartDate() {
		return resStartDate;
	}

	public void setResStartDate(Date resStartDate) {
		this.resStartDate = resStartDate;
	}

	public Date getResEndDate() {
		return resEndDate;
	}

	public void setResEndDate(Date resEndDate) {
		this.resEndDate = resEndDate;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public String getResPurpose() {
		return resPurpose;
	}

	public void setResPurpose(String resPurpose) {
		this.resPurpose = resPurpose;
	}

	public int getResAttendCnt() {
		return resAttendCnt;
	}

	public void setResAttendCnt(int resAttendCnt) {
		this.resAttendCnt = resAttendCnt;
	}

	public String getResAddRequest() {
		return resAddRequest;
	}

	public void setResAddRequest(String resAddRequest) {
		this.resAddRequest = resAddRequest;
	}

	public String getResState() {
		return resState;
	}

	public void setResState(String resState) {
		this.resState = resState;
	}

	public int getResSnack() {
		return resSnack;
	}

	public void setResSnack(int resSnack) {
		this.resSnack = resSnack;
	}

	public String getResType() {
		return resType;
	}

	public void setResType(String resType) {
		this.resType = resType;
	}

	public String getResCancle() {
		return resCancle;
	}

	public void setResCancle(String resCancle) {
		this.resCancle = resCancle;
	}

	public int getResCost() {
		return resCost;
	}

	public void setResCost(int resCost) {
		this.resCost = resCost;
	}

	public int getResOutside() {
		return resOutside;
	}

	public void setResOutside(int resOutside) {
		this.resOutside = resOutside;
	}
	
	

}
