package kr.or.kosa.controller;

import java.security.Principal;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kosa.dto.Message;
import kr.or.kosa.security.User;
import kr.or.kosa.service.MemberService;
import kr.or.kosa.service.MessageService;
import kr.or.kosa.utils.VisitorInfo;

@Controller
public class FrontController {
	
	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);

	@Autowired
	MemberService memberservice;
	
	@Autowired
	MessageService msgservice;
	
	@Autowired
	VisitorInfo visitorinfo;
	
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

//		auth의 롤이 anonymous가 아니면 어쩌고...
//		if (SecurityContextHolder.getContext().getAuthentication() != null 
//			    && SecurityContextHolder.getContext().getAuthentication().isAuthenticated()
//			    && !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
//			    
//			    // 사용자가 로그인한 상태이면 실행될 코드
//			    // ...
//			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//			//visitor 정보 넘김
//			visitorinfo.information(user);
//
//			}		
		
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
	
	@GetMapping("/accessError")
	public String accessError() {
		
		return "common/errorPage";
	}
	
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
		int result = 0;
		String contents = message.getMessageContent().replace("\r\n","<br>");
		message.setMessageContent(contents);
		result = msgservice.sendMsg(message);
		String msg = "";
		String url = "";
		String icon = "";
		if (result > 0) {
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
	
	
	@GetMapping("/eveningCall")
	public String eveningCall() {
		
		return "member/eveningCall";
	}
	
	@GetMapping("/memberCalendar")
	public String calendar() {
		
		return "member/memberCalendar";
	}

	
}
