package com.gsitm.meeting.room.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EquipmentDaoImpl implements EquipmentDao{

	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.equipmentMapper";

}
