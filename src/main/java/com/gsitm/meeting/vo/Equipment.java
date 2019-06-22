package com.gsitm.meeting.vo;

public class Equipment {
	
	private String eqId;
	private String mrId;

	
	public Equipment() {
		super();
	}
	
	public Equipment(String eqId, String mrId) {
		this.eqId=eqId;
		this.mrId=mrId;
	}


	public String getEqId() {
		return eqId;
	}

	public void setEqId(String eqId) {
		this.eqId = eqId;
	}

	public String getMrId() {
		return mrId;
	}

	public void setMrId(String mrId) {
		this.mrId = mrId;
	}
	
	
	

}
