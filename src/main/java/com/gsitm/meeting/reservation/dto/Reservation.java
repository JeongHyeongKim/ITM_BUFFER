package com.gsitm.meeting.reservation.dto;

import java.util.Date;

public class Reservation {
	
	private String resId;
	private String empId;
	private String mrId;
	private String resStartDate;
	private String resEndDate;
	private String resDate;
	private String resPurpose;
	private int resAttendCnt;
	private String resAddRequest;
	private String resState;
	private int resSnack;
	private String resType;
	private String resCancle;
	private int resCost;
	private int resOutside;
	
	//������Ȳ
	private String empName;
	//예약정보 중 회의실 이름
	private String mrName;
	
	public String getMrName() {
		return mrName;
	}

	public void setMrName(String mrName) {
		this.mrName = mrName;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

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

	public String getResStartDate() {
		return resStartDate;
	}

	public void setResStartDate(String resStartDate) {
		this.resStartDate = resStartDate;
	}

	public String getResEndDate() {
		return resEndDate;
	}

	public void setResEndDate(String resEndDate) {
		this.resEndDate = resEndDate;
	}

	public String getResDate() {
		return resDate;
	}

	public void setResDate(String resDate) {
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
