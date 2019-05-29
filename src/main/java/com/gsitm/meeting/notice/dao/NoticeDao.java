package com.gsitm.meeting.notice.dao;

import java.util.List;
import java.util.Map;

import com.gsitm.meeting.notice.dto.Notice;

public interface NoticeDao {

	public List<Notice> noticeList(Map map);
	
	public int noticeCount();
	
	public Notice noticeRead(int noticeId);
	
	public void noticeInsert(Notice notice);
	
	public int noticeDelete(int noticeId);
	
	public void noticeUpdate(Notice notice);
}
