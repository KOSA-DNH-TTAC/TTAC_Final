package kr.or.kosa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.SleepOver;
import kr.or.kosa.dto.SleepOverHistory;
import kr.or.kosa.service.SleepOverService;

@RestController
@RequestMapping("/adminPopular")
public class SleepOverController_Rest {

	@Autowired
	SleepOverService service;

	// 오늘자 외박 신청
	@GetMapping("/getTodays")
	public ResponseEntity<Map<String, Object>> getToday() {
		Map<String, Object> map = new HashMap<>();

		List<SleepOver> list = service.getTodaysList();
		List<SleepOver> nlist = new ArrayList<SleepOver>();
		List<SleepOver> ylist = new ArrayList<SleepOver>();

		for (SleepOver over : list) {
			if (over.getSleepOverConfirm().equals("N")) {
				nlist.add(over);
			} else {
				ylist.add(over);
			}
		}

		map.put("nlist", nlist);
		map.put("ylist", ylist);

		return new ResponseEntity<>(map, HttpStatus.OK);
	}

	// 외박 승인
	@GetMapping("/update")
	public ResponseEntity<Map<String, Object>> updateSleepOver(int idx) {
		int result = service.confirm(idx);
		Map<String, Object> map = new HashMap<String, Object>();

		if (result > 0) {
			map.put("결과", "승인완료");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("결과", "문제발생");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.BAD_REQUEST);
		}
	}

	// 외박 내역 조회
	@GetMapping("/getHistory")
	public ResponseEntity<Map<String, Object>> getHistory() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<SleepOverHistory> list = service.getHistory();
		map.put("list", list);

		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

	}

	// 현 시각 외박 조회
	@GetMapping("/getTodayHistory")
	public ResponseEntity<Map<String, Object>> getTodaySleepOverHistory() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<SleepOverHistory> list = service.getTodaysHistory();
		map.put("list", list);

		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

	}

	// 기간 별 외박 검색
	@GetMapping("/getIntervalHistory")
	public ResponseEntity<Map<String, Object>> getIntervalSleepOverHistory(@RequestParam HashMap<String, Object> data) {
		Map<String, Object> map = new HashMap<String, Object>();

		String startdate = (String) data.get("startdate");
		String enddate = (String) data.get("enddate");
		String memberid = (String) data.get("memberid");

		List<SleepOverHistory> list = service.searchIntervalHistory(startdate, enddate, memberid);
		map.put("list", list);

		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

	}

}
