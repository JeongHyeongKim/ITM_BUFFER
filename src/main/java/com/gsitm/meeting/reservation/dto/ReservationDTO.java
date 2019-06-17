package com.gsitm.meeting.reservation.dto;

import lombok.Data;

public class ReservationDTO {
	@Data
	public static class mySchedule{
		private String resId;
		private String mrName;
		private String brName;
		private String resState;
		private String resStartDate;
		private String resEndDate;
		private String resDate;
	}
	public static class ReservationTest{
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
		
		
		//예약자 이름
		private String empName;
		//예약정보 중 회의실 이름
		private String mrName;
		//지사
		private String brName;

		public String getBrName() {
			return brName;
		}

		public void setBrName(String brName) {
			this.brName = brName;
		}

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
		
		
		public ReservationTest() {
			super();
		}

		@Override
		public String toString() {
			StringBuilder builder = new StringBuilder();
			builder.append("ReservationTest [resId=");
			builder.append(resId);
			builder.append(", empId=");
			builder.append(empId);
			builder.append(", mrId=");
			builder.append(mrId);
			builder.append(", resStartDate=");
			builder.append(resStartDate);
			builder.append(", resEndDate=");
			builder.append(resEndDate);
			builder.append(", resDate=");
			builder.append(resDate);
			builder.append(", resPurpose=");
			builder.append(resPurpose);
			builder.append(", resAttendCnt=");
			builder.append(resAttendCnt);
			builder.append(", resAddRequest=");
			builder.append(resAddRequest);
			builder.append(", resState=");
			builder.append(resState);
			builder.append(", resSnack=");
			builder.append(resSnack);
			builder.append(", resType=");
			builder.append(resType);
			builder.append(", resCancle=");
			builder.append(resCancle);
			builder.append(", resCost=");
			builder.append(resCost);
			builder.append(", resOutside=");
			builder.append(resOutside);
			builder.append(", empName=");
			builder.append(empName);
			builder.append(", mrName=");
			builder.append(mrName);
			builder.append("]");
			builder.append(brName);
			builder.append("]");
			return builder.toString();
		}

		public ReservationTest(String resId, String empId, String mrId, String resStartDate, String resEndDate,
				String resDate, String resPurpose, int resAttendCnt, String resAddRequest, String resState,
				int resSnack, String resType, String resCancle, int resCost, int resOutside,String empName, String mrName,String brName) {
			super();
			this.resId = resId;
			this.empId = empId;
			this.mrId = mrId;
			this.resStartDate = resStartDate;
			this.resEndDate = resEndDate;
			this.resDate = resDate;
			this.resPurpose = resPurpose;
			this.resAttendCnt = resAttendCnt;
			this.resAddRequest = resAddRequest;
			this.resState = resState;
			this.resSnack = resSnack;
			this.resType = resType;
			this.resCancle = resCancle;
			this.resCost = resCost;
			this.resOutside = resOutside;
			this.empName = empName;
			this.mrName = mrName;
			this.brName = brName;
			
		}
		
		
	}
}
