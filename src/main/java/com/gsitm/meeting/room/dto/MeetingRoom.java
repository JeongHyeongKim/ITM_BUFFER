package com.gsitm.meeting.room.dto;

public class MeetingRoom {
	
	private String mrId;
	private String mrName;
	private String brId;
	private int mrLimit;
	private int mrPrice;
	private int mrArea;
	private String mrNetwork;
	private String mrType;
	private String empId;
	private String mrLocation;
	private String mrImg;
	
	//단기예약메인페이지 관리자이름
	private String empName;
	//회의실 위치
	private String brLocation;
	
	public String getBrLocation() {
		return brLocation;
	}


	public void setBrLocation(String brLocation) {
		this.brLocation = brLocation;
	}


	public String getEmpName() {
		return empName;
	}


	public void setEmpName(String empName) {
		this.empName = empName;
	}


	public MeetingRoom() {
		super();
	}


	public String getMrId() {
		return mrId;
	}


	public void setMrId(String mrId) {
		this.mrId = mrId;
	}


	public String getMrName() {
		return mrName;
	}


	public void setMrName(String mrName) {
		this.mrName = mrName;
	}


	public String getBrId() {
		return brId;
	}


	public void setBrId(String brId) {
		this.brId = brId;
	}


	public int getMrLimit() {
		return mrLimit;
	}


	public void setMrLimit(int mrLimit) {
		this.mrLimit = mrLimit;
	}


	public int getMrPrice() {
		return mrPrice;
	}


	public void setMrPrice(int mrPrice) {
		this.mrPrice = mrPrice;
	}


	public int getMrArea() {
		return mrArea;
	}


	public void setMrArea(int mrArea) {
		this.mrArea = mrArea;
	}


	public String getMrNetwork() {
		return mrNetwork;
	}


	public void setMrNetwork(String mrNetwork) {
		this.mrNetwork = mrNetwork;
	}


	public String getMrType() {
		return mrType;
	}


	public void setMrType(String mrType) {
		this.mrType = mrType;
	}


	public String getEmpId() {
		return empId;
	}


	public void setEmpId(String empId) {
		this.empId = empId;
	}


	public String getMrLocation() {
		return mrLocation;
	}


	public void setMrLocation(String mrLocation) {
		this.mrLocation = mrLocation;
	}


	public String getMrImg() {
		return mrImg;
	}


	public void setMrImg(String mrImg) {
		this.mrImg = mrImg;
	}
	
	

}
