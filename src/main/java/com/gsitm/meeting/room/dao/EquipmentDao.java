package com.gsitm.meeting.room.dao;

import java.util.List;

import com.gsitm.meeting.vo.Equipment;

public interface EquipmentDao {
	
	public List<Equipment>equipmentAllList();
	
	public List<Equipment>searchEquipment(String mrId);
	
	public void equipmentInsert(Equipment equipment);
	
	public void equipmentUpdate(Equipment equipment);
	
	public void equipmentDelete(String eqId);

}
