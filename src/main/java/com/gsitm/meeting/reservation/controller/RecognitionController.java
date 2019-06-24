package com.gsitm.meeting.reservation.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gsitm.meeting.reservation.dao.RecognitionDaoImpl;
import com.gsitm.meeting.reservation.service.RecognitionService;
import com.gsitm.meeting.reservation.service.ReservationService;

@Controller
@RequestMapping(value ="/recognition", produces="text/plain; charset=UTF-8")
public class RecognitionController {

	@Autowired
	private RecognitionService recService;
	
	@GetMapping("/waitForRecognition")
	public String waitForRecognition(Model model) {
		model.addAttribute("branchList",recService.branchList());
		model.addAttribute("resList",recService.resList());
		model.addAttribute("equipList",recService.allEquipList());
		return "admin/waitForRecognition";
	}
	@GetMapping("/paymentManagement")
	public String paymentManagement(Model model) {
		model.addAttribute("allPayment",recService.allPayment());
		model.addAttribute("allDeptPayment",recService.allDeptPayment());
		return "admin/paymentManagement";
	}
	@PostMapping("/search/{searchtype}")
	public ResponseEntity<String> myPaymentBySearch(@PathVariable String searchtype){
		return new ResponseEntity<>(recService.myPaymentBySearch(searchtype),HttpStatus.OK);
	}
	@GetMapping("/exchangeAdmin")
	public String exchangeAdmin(Model model){
		return "admin/exchangeAdmin";
	}
	@PostMapping("/approval/{resId}")
	public ResponseEntity<Void> approval(@PathVariable String resId,@RequestParam String str,@RequestParam String email,@RequestParam String deptId,@RequestParam String resCost,@RequestParam String headEmail) {
		recService.updateDeptCost(deptId,resCost);
		recService.sendApprovalMailToHead(headEmail,str);
		recService.sendApprovalMail(email,str);
		int result = recService.approval(resId);
		return new ResponseEntity<>(result == 1 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
	}
	@PostMapping("/back/{resId}")
	public ResponseEntity<Void> back(@PathVariable String resId,@RequestParam String str,@RequestParam String email) {
		recService.sendMail(email,str);
		int result = recService.back(resId);
		return new ResponseEntity<>(result == 1 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
	}
	
	@PostMapping("/searchByPeriod/searchtype={searchtype}&searchtypeByBranch={brId}")
	public  @ResponseBody ResponseEntity<String> getReservationBySearchtype(Principal principal,@PathVariable String searchtype,@PathVariable String brId) {
		return new ResponseEntity<>(recService.getReservationBySearchtype(principal.getName(), searchtype,brId),HttpStatus.OK);
	}
	//상위관리자 승인 대기 페이지
	@GetMapping("/waitForRecognitionByHead")
	public String waitForRecognitionByHead(Model model) {
		model.addAttribute("resListForHead",recService.waitForRecognitionByHead());
		return "admin/waitForRecognitionByHead";
	}
	@PostMapping("/approvalByHead/{resId}")
	public ResponseEntity<Void> approvalByHead(@PathVariable String resId,@RequestParam String str,@RequestParam String email) {
		recService.sendApprovalMailByHead(email,str);
		int result = recService.approvalByHead(resId);
		return new ResponseEntity<>(result == 1 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
	}
	@PostMapping("/backByHead/{resId}")
	public ResponseEntity<Void> backByHead(@PathVariable String resId,@RequestParam String str,@RequestParam String email) {
		recService.sendBackMailByHead(email,str);
		int result = recService.backByHead(resId);
		return new ResponseEntity<>(result == 1 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
	}
}