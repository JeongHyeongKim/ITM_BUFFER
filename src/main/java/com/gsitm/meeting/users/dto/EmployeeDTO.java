package com.gsitm.meeting.users.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class EmployeeDTO {
	
	@Data
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
	}
	
	@Data
	public static class CurrentInfoByMrId {
		private String brName;
		private String mrName;
	}
}
