package kr.or.kosa.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

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
	@GetMapping("/RollCall")
	public String adminRollCall() {
		
		return "admin/adminRollCall";
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
	
	@GetMapping("/file")
	public String adminFile() {
		return "admin/adminFile";
	}
	
	@GetMapping("/qr")
	public String adminQr() {
		return "admin/adminQr";
	}
	
}
