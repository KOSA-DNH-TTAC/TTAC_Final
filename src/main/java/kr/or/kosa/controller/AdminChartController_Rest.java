package kr.or.kosa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.AdminChart;
import kr.or.kosa.service.AdminChartService;

@RestController
public class AdminChartController_Rest {
	
	private AdminChartService adminchartservice;

	@Autowired
	public void setadminchartservice(AdminChartService adminchartservice) {
		this.adminchartservice = adminchartservice;
	}
	
	//관리자 통계 그냥 외박
	@GetMapping("/adminachart/sleepover")
	public ResponseEntity<List<AdminChart>> mySleepOverChart(@RequestParam String year){		
		List<AdminChart> list = adminchartservice.getMontlySleepover(year);
		
		return new ResponseEntity<List<AdminChart>>(list, HttpStatus.OK);
	}
	
	

}


