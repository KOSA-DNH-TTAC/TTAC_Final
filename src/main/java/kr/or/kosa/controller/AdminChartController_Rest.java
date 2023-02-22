package kr.or.kosa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@RequestMapping("/adminachart/sleepover")
	public ResponseEntity<List<AdminChart>> mySleepOverChart(@RequestParam HashMap<String,Object> year){
		System.out.println("year : "+year);
		Map<String, Object> map = new HashMap<String, Object>();
		String years = (String)year.get("year");
		System.out.println("years : "+years);
		
		int years1 = Integer.parseInt(years);
		System.out.println("years1 : "+years1);
		List<AdminChart> list = adminchartservice.getMontlySleepover(years1);
		
		return new ResponseEntity<List<AdminChart>>(list, HttpStatus.OK);
	}
	
	
	//관리자 통계 포인트 관련
		@RequestMapping("/adminachart/point")
		public ResponseEntity<List<AdminChart>> pointChart(@RequestParam HashMap<String,Object> year){
			System.out.println("year : "+year);
			Map<String, Object> map = new HashMap<String, Object>();
			String years = (String)year.get("year");
			System.out.println("years : "+years);
			
			int years1 = Integer.parseInt(years);
			System.out.println("years1 : "+years1);
			List<AdminChart> list = adminchartservice.getMontlySleepover(years1);
			
			return new ResponseEntity<List<AdminChart>>(list, HttpStatus.OK);
		}
	
	

	//관리자 통계 커뮤니티
	@RequestMapping("/adminchart/community")
	public ResponseEntity<List<AdminChart>> communityChart(@RequestParam HashMap<String,Object> year){
		System.out.println("year : "+year);
		Map<String, Object> map = new HashMap<String, Object>();
		String years = (String)year.get("year");
		System.out.println("years : "+years);

		List<AdminChart> list = adminchartservice.getMonthlyCommunity(years);
		
		return new ResponseEntity<List<AdminChart>>(list, HttpStatus.OK);
	}
}


