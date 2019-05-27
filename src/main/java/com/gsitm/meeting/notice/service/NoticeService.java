package com.gsitm.meeting.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.gsitm.meeting.notice.dao.NoticeDaoImpl;
import com.gsitm.meeting.notice.dto.Notice;

@Service
public class NoticeService {

	@Autowired
	private NoticeDaoImpl noticeDao;
	
	@Autowired
	private Gson gson;
	
	public String noticeList(){
		return gson.toJson(noticeDao.noticeList());
	}
	
	public String noticeRead(int noticeNum) {
		return gson.toJson(noticeDao.noticeRead(noticeNum));
	}
	
	public void noticeInsert(Notice notice) {
		noticeDao.noticeInsert(notice);
	}
	
	public int noticeDelete(int noticeId) {
		return noticeDao.noticeDelete(noticeId);
	}

	public void noticeUpdate(Notice notice) {
		noticeDao.noticeUpdate(notice);
	}
	
}
