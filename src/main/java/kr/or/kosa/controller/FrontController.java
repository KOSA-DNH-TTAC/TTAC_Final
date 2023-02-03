package kr.or.kosa.controller;

import java.security.Principal;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.Message;
import kr.or.kosa.security.User;
import kr.or.kosa.service.MemberService;
import kr.or.kosa.service.MessageService;

@Controller
public class FrontController {
	
	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);

	@Autowired
	MemberService memberservice;
	
	@Autowired
	MessageService msgservice;
	
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
	public ModelAndView myPage() {
		
		ModelAndView mv = new ModelAndView();
		//여기서 내 정보 조회까지 작업해서 뷰에 올린다
//		Member member = null;
//		String memberid = principal.getName();
//		member = memberservice.getMemberById(memberid);
		User member = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		mv.setViewName("member/mypage/mypageHome");
		mv.addObject("member", member);	
		return mv;
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
	
	@GetMapping("/userlogin")
	public String login() {
		
		return "common/login";
	}
	/*
	@PostMapping("/login")
	public String mylogin() {
		System.out.println("로그인제출?");
		return null;
	}
	*/
	
	@GetMapping("/message")
	@PreAuthorize("isAuthenticated()")
	public String messageBox() {
		//쪽지함
		return "member/message/notebox";
	}
	
	
	@GetMapping("/message/writing")
	public String messageWriting() {
		//쪽지쓰기 뷰
		return "member/message/writing";
	}
	
	@PostMapping("/message/writing")
	public String messageSend(Message message, Model model) {
		//쪽지 보내기
		System.out.println(message);
		msgservice.sendMsg(message);
		int result = 0;
		String msg = "";
		String url = "";
		if (result < 1) {
			msg = "쪽지 전송 성공";
			url = "/message";
		} else {
			msg = "쪽지 보내기 실패";
			url = "/message/writing";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "/common/redirect";
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
	
	@GetMapping("/memberCalendar")
	public String calendar() {
		
		return "member/memberCalendar";
	}
	
	@GetMapping("/facility")
	public String facility() {
		
		return "member/facilityReport";
	}
	
}
