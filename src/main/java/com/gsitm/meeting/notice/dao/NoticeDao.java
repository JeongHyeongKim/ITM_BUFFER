package com.gsitm.meeting.notice.dao;

import java.util.List;
import java.util.Map;

import com.gsitm.meeting.notice.dto.NoticeDTO;

public interface NoticeDao {

	public List<NoticeDTO> noticeList(Map map);
	
	public int noticeCount();
	
	public NoticeDTO noticeRead(int noticeId);
	
	public void noticeInsert(NoticeDTO notice);
	
	public int noticeDelete(int noticeId);
	
	public void noticeUpdate(NoticeDTO notice);
	
	// DTO사용예제
	public NoticeDTO.NoticeTest noticeTest();
}
