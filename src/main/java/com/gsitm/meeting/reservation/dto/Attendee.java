package com.gsitm.meeting.reservation.dto;

public class Attendee {
	
	private String resId;
	private String attendId;
	private String attendType;
	private String deptId;
	
	public Attendee () {
		super();
	}

	public String getResId() {
		return resId;
	}

	public void setResId(String resId) {
		this.resId = resId;
	}

	public String getAttendId() {
		return attendId;
	}

	public void setAttendId(String attendId) {
		this.attendId = attendId;
	}

	public String getAttendType() {
		return attendType;
	}

	public void setAttendType(String attendType) {
		this.attendType = attendType;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	
	

}
