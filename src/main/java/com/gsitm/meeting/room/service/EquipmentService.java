package com.gsitm.meeting.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.meeting.room.dao.EquipmentDaoImpl;
import com.gsitm.meeting.vo.Equipment;
import com.gsitm.meeting.vo.MeetingRoom;

@Service
public class EquipmentService {
	
	@Autowired
	private EquipmentDaoImpl eqDao;
	
	
	public List<Equipment> equipmentAllList(){
		return eqDao.equipmentAllList();
	}
	
	
	public List<Equipment> searchEquipment(String mrId) {
		return eqDao.searchEquipment(mrId);
	}

	
	public void equipmentInsert(Equipment equipment) {
		eqDao.equipmentInsert(equipment);
	}

	
	public void equipmentUpdate(Equipment equipment) {
		eqDao.equipmentUpdate(equipment);
	}

	
	public void equipmentDelete(String eqId) {
		eqDao.equipmentDelete(eqId);
	}
}
