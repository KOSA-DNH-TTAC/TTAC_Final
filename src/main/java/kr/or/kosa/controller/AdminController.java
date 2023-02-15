package kr.or.kosa.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {

	
	@GetMapping("/popular")
	public String admin() {
		
		return "admin/adminPopular";
	}
	@GetMapping("/sleepOverHistory")
	public String adminSleepOverHistory() {
		
		return "admin/adminSleepOverHistory";
	}
	
	@GetMapping("/analyze")
	public String adminAnalyze() {
		
		return "admin/adminAnalyze";
	}
	
	@GetMapping("/sail")
	public String adminSail() {
		
		return "admin/adminSail";
	}
	
	@GetMapping("/coupon")
	public String adminCoupon() {
		
		return "admin/adminMealCoupon";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/adminMember")
	public String adminMember() {
		
		return "admin/adminMemberList";
	}
	
	@GetMapping("/calendar")
	public String adminCalendar() {
		
		return "admin/adminCalendar";
	}
	
	@GetMapping("/enroll")
	public String adminEnroll() {
		
		return "admin/adminEnroll";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/domitory")
	public String adminDomitory() {
		
		return "admin/adminDomitory";
	}
	
	@GetMapping("/board")
	public String adminBoard() {
		return "admin/adminBoard";
	}
}
