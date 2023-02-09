package kr.or.kosa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.SleepOver;
import kr.or.kosa.security.User;
import kr.or.kosa.service.SleepOverService;

@RestController
@RequestMapping("/adminPopular")
public class SleepOverController_Rest {
	
	@Autowired
	SleepOverService service;
	
	@GetMapping("/getTodays")
	public ResponseEntity<Map<String, Object>> getToday(){
		Map<String, Object> map = new HashMap<>();

		List<SleepOver> list = service.getTodaysList();
		List<SleepOver> nlist = new ArrayList<SleepOver>();
		List<SleepOver> ylist = new ArrayList<SleepOver>();
		
		for(SleepOver over : list) {
			if(over.getSleepOverConfirm().equals("N")) {
				nlist.add(over);
			}else {
				ylist.add(over);
			}
		}
		
		map.put("nlist", nlist);
		map.put("ylist", ylist);
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@GetMapping("/update")
	public ResponseEntity<Map<String, Object>> updateSleepOver(int idx) {
//		int index = Integer.parseInt(idx);
//		int result = service.confirm(index);
//		System.out.println("썅!!");
		int result = service.confirm(idx);
//		int result = 1;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(result > 0) {
			map.put("결과", "승인완료");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		}else {
			map.put("결과", "문제발생");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.BAD_REQUEST);
		}
	}
	
}
