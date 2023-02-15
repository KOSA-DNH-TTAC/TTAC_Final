package kr.or.kosa.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.kosa.dto.Message;
import kr.or.kosa.security.User;

@Controller
public class CommonController {
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/chat")
	public String chat(Model model) {
		
		System.out.println("채팅 컨트롤러");
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		System.out.println("========================");
		System.out.println("@ChatController  GET chat / Username : " + user.getName());
		model.addAttribute("userid", user.getUsername());
		return "chat";
	}
	
	@GetMapping("/forgot")
	public String findPw() {
		return "common/forgotPw";
	}
	
	//인증 메일 발송
	@GetMapping("/forgotMail")
	public String email() {
		return null;
	}
}