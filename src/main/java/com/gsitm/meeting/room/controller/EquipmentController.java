package com.gsitm.meeting.room.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gsitm.meeting.room.service.EquipmentService;
import com.gsitm.meeting.vo.Equipment;

@Controller
@RequestMapping("equipment")
public class EquipmentController {

	@Autowired
	private EquipmentService eqService;
	
	
	
	@GetMapping("/list")
	public String equipmentAllList(Model model) {
		model.addAttribute("meetingRoomList", eqService.equipmentAllList());
		return "equipment/equipmentList";
	}
	
	
	@PostMapping("/insert")
	public String equipmentInsert(Equipment equipment) {
		eqService.equipmentInsert(equipment);
		return "redirect:/equipment/list";
	}
	
	@GetMapping("read")
	public String equipmentRead(Equipment equipment) {
		return null;
	}
	
	@PostMapping("/update")
	public String equipmentUpdate(Equipment equipment) {
		eqService.equipmentUpdate(equipment);
		return "redirect:/equipment/list";
		
	}
}
