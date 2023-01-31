package kr.or.kosa.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.kosa.dto.Member;

@Controller
public class FrontController {
	
	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);

	@GetMapping("")
	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
		return "index";
	}
	
	//마이페이지
	@GetMapping("/mypage")
	public String myPage() {
		//여기서 내 정보 조회까지 작업해서 뷰에 올려야 함
		return "member/mypage/mypageHome";
	}
	
	//마이페이지 - 정보수정
	@GetMapping("/mypage/modify")
	public String myPageModify() {
		return "member/mypage/modifyInfo";
	}
	
	//마이페이지 - 정보수정 (제출 시)
	@PostMapping("/mypage/modify")
	public String myPageModifySubmit(@AuthenticationPrincipal Member member) {
		System.out.println("정보수정 제출");
		return "member/mypage/mypageHome";
//		return null;
	}
	
	@GetMapping("/community")
	public String community() {
		
		return "member/community";
	}
	
	@GetMapping("/login")
	public String login() {
		
		return "common/login";
	}
	
	@PostMapping("/login")
	public String mylogin() {
		System.out.println("로그인제출?");
		return null;
	}
	
	@GetMapping("/error")
	public String error() {
		
		return "common/errorPage";
	}
	
	@GetMapping("/adminPopular")
	public String admin() {
		
		return "admin/adminPopular";
	}
	
	@GetMapping("/adminAnalyze")
	public String adminAnalyze() {
		
		return "admin/adminAnalyze";
	}
	
	@GetMapping("/adminSail")
	public String adminSail() {
		
		return "admin/adminSail";
	}
	
	@GetMapping("/adminCoupon")
	public String adminCoupon() {
		
		return "admin/adminMealCoupon";
	}
	
	@GetMapping("/adminMember")
	public String adminMember() {
		
		return "admin/adminMemberList";
	}
	
	@GetMapping("/adminCalendar")
	public String adminCalendar() {
		
		return "admin/adminCalendar";
	}
	
	@GetMapping("/adminEnroll")
	public String adminEnroll() {
		
		return "admin/adminEnroll";
	}
	
	@GetMapping("/eveningCall")
	public String eveningCall() {
		
		return "member/eveningCall";
	}
	
}
