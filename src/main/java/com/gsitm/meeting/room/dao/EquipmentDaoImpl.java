package com.gsitm.meeting.room.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.meeting.vo.Equipment;

@Repository
public class EquipmentDaoImpl implements EquipmentDao{

	@Autowired
	private SqlSession session;
	
	private String namespace = "com.gsitm.meeting.mappers.equipmentMapper";

	@Override
	public List<Equipment> equipmentAllList() {
		return session.selectList(namespace+".equipmentAllList");
	}

	@Override
	public List<Equipment> searchEquipment(String mrId) {
		return session.selectList(namespace+".searchEquipment",mrId);
	}

	@Override
	public void equipmentInsert(Equipment equipment) {
		session.insert(namespace+".equipmentInsert",equipment);
		
	}

	@Override
	public void equipmentUpdate(Equipment equipment) {
		session.update(namespace+".equipmentUpdate",equipment);
	}

	@Override
	public void equipmentDelete(String eqId) {
		session.delete(namespace+".equipmentDelete", eqId);
	}

}
