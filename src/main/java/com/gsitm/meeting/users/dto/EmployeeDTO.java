package com.gsitm.meeting.users.dto;

public class EmployeeDTO {
	
	public static class MyPageInfo {
		
		private String resId;
		private String empId;
		private String mrId;
		private String mrName;
		private String brName;
		private String resStartTime;
		private String resEndTime;
		private String resDate;
		private String resPurpose;
		private String resState;
		private String resType;
		private int resCost;
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
		public String getMrName() {
			return mrName;
		}
		public void setMrName(String mrName) {
			this.mrName = mrName;
		}
		public String getBrName() {
			return brName;
		}
		public void setBrName(String brName) {
			this.brName = brName;
		}
		public String getResStartTime() {
			return resStartTime;
		}
		public void setResStartTime(String resStartTime) {
			this.resStartTime = resStartTime;
		}
		public String getResEndTime() {
			return resEndTime;
		}
		public void setResEndTime(String resEndTime) {
			this.resEndTime = resEndTime;
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
		public String getResState() {
			return resState;
		}
		public void setResState(String resState) {
			this.resState = resState;
		}
		public String getResType() {
			return resType;
		}
		public void setResType(String resType) {
			this.resType = resType;
		}
		public int getResCost() {
			return resCost;
		}
		public void setResCost(int resCost) {
			this.resCost = resCost;
		}
		public MyPageInfo(String resId, String empId, String mrId, String mrName, String brName, String resStartTime,
				String resEndTime, String resDate, String resPurpose, String resState, String resType, int resCost) {
			super();
			this.resId = resId;
			this.empId = empId;
			this.mrId = mrId;
			this.mrName = mrName;
			this.brName = brName;
			this.resStartTime = resStartTime;
			this.resEndTime = resEndTime;
			this.resDate = resDate;
			this.resPurpose = resPurpose;
			this.resState = resState;
			this.resType = resType;
			this.resCost = resCost;
		}
		public MyPageInfo() {
			super();
		}
		@Override
		public String toString() {
			StringBuilder builder = new StringBuilder();
			builder.append("getMyPageInfo [resId=");
			builder.append(resId);
			builder.append(", empId=");
			builder.append(empId);
			builder.append(", mrId=");
			builder.append(mrId);
			builder.append(", mrName=");
			builder.append(mrName);
			builder.append(", brName=");
			builder.append(brName);
			builder.append(", resStartTime=");
			builder.append(resStartTime);
			builder.append(", resEndTime=");
			builder.append(resEndTime);
			builder.append(", resDate=");
			builder.append(resDate);
			builder.append(", resPurpose=");
			builder.append(resPurpose);
			builder.append(", resState=");
			builder.append(resState);
			builder.append(", resType=");
			builder.append(resType);
			builder.append(", resCost=");
			builder.append(resCost);
			builder.append("]");
			return builder.toString();
		}
		
	}
}
