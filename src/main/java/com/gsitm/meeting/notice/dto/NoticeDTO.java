package com.gsitm.meeting.notice.dto;

import java.util.Date;

public class NoticeDTO {
	public static class NoticeTest{
		private String noticeId;
		private String noticeTitle;
		public String getNoticeId() {
			return noticeId;
		}
		public void setNoticeId(String noticeId) {
			this.noticeId = noticeId;
		}
		public String getNoticeTitle() {
			return noticeTitle;
		}
		public void setNoticeTitle(String noticeTitle) {
			this.noticeTitle = noticeTitle;
		}
		public NoticeTest() {
			super();
		}
		public NoticeTest(String noticeId, String noticeTitle) {
			super();
			this.noticeId = noticeId;
			this.noticeTitle = noticeTitle;
		}
		@Override
		public String toString() {
			StringBuilder builder = new StringBuilder();
			builder.append("NoticeTest [noticeId=");
			builder.append(noticeId);
			builder.append(", noticeTitle=");
			builder.append(noticeTitle);
			builder.append("]");
			return builder.toString();
		}
		
	}
}
