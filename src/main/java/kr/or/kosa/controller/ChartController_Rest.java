package kr.or.kosa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Chart;
import kr.or.kosa.service.MypageChartService;

@RestController
public class ChartController_Rest {

	private MypageChartService mychartservice;

	@Autowired
	public void setMychartservice(MypageChartService mychartservice) {
		this.mychartservice = mychartservice;
	}

	// 내 외박
	@GetMapping("/mychart/sleepover")
	public ResponseEntity<Map<String, Object>> mySleepOverChart() {
		Map<String, Object> map = new HashMap<String, Object>();

		List<Chart> list = mychartservice.getMontlySleepover();
		map.put("list", list);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	// 내 결제
	@GetMapping("/mychart/payment")
	public ResponseEntity<Map<String, Object>> myPaymentChart() {
		Map<String, Object> map = new HashMap<String, Object>();

		List<Chart> list = mychartservice.getMonthlyPayments();
		map.put("list", list);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	// 내 커뮤니티
	@GetMapping("/mychart/community")
	public ResponseEntity<Map<String, Object>> myCommunityChart() {
		Map<String, Object> map = new HashMap<String, Object>();

		List<Chart> list = mychartservice.getMonthlyCommunity();
		map.put("list", list);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	// 내 벌점
	@GetMapping("/mychart/demerit")
	public ResponseEntity<Map<String, Object>> myDemeritChart() {
		Map<String, Object> map = new HashMap<String, Object>();

		List<Chart> list = mychartservice.getMonthlyDemerit();
		map.put("list", list);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

}
