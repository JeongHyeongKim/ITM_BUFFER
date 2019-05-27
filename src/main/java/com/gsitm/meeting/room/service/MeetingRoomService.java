package com.gsitm.meeting.room.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.meeting.room.dao.MeetingRoomDaoImpl;

@Service
public class MeetingRoomService {

	@Autowired
	private MeetingRoomDaoImpl meetingRoomDao;
}
