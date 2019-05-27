package com.gsitm.meeting.notice.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gsitm.meeting.notice.dto.Notice;
import com.gsitm.meeting.notice.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 전체List
	@GetMapping("/list")
	public String noticeList(Model model) {
		model.addAttribute("list", noticeService.noticeList());
		return "notice/noticeTest11";
	}
	
	// 공지사항 글읽기
	@GetMapping("/read/{noticeNum}")
	public String noticeRead(Model model, @PathVariable int noticeNum) {
		model.addAttribute("notice", noticeService.noticeRead(noticeNum));
		return "notice/noticeRead";
	}
	
	@PostMapping("/write")
	public String noticeInsert(Notice notice) {
		noticeService.noticeInsert(notice);
		return "redirect:/notice/list";
	}
	
	@PostMapping("/delete")
	public ResponseEntity<Void> noticeDelete(int noticeId) {
		int result = noticeService.noticeDelete(noticeId);
		return new ResponseEntity<>(result == 1 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
	}
	
	@PostMapping("/update")
	public String noticeUpdate(Notice notice) {
		noticeService.noticeUpdate(notice);
		return "redirect:/notice/list";
	}

}
