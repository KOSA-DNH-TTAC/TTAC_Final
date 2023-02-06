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
import org.springframework.web.bind.annotation.PathVariable;
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
	public ModelAndView messageWriting() {
		//쪽지쓰기 뷰
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/message/writing");
		mv.addObject("reiceiver", "");
		
		return mv;
	}
	@GetMapping("/message/writing/{receiver}")
	public ModelAndView replyMessage(@PathVariable("receiver") String receiver) {
		//쪽지쓰기 뷰
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/message/writing");
		if(receiver!=null) {
			mv.addObject("receiver", receiver);
		}else {
			mv.addObject("reiceiver", "");
		}
		
		return mv;
	}
	
	@PostMapping("/message/writing")
	public String messageSend(Message message, Model model) {
		//쪽지 보내기
		System.out.println(message);
		
		String contents = message.getMessageContent().replace("\r\n","<br>");
		message.setMessageContent(contents);
		msgservice.sendMsg(message);
		int result = 0;
		String msg = "";
		String url = "";
		String icon = "";
		if (result < 1) {
			icon = "success";
			msg = "쪽지 전송 성공";
			url = "/message";
		} else {
			icon = "error";
			msg = "쪽지 보내기 실패";
			url = "/message/writing";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("icon", icon);
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
