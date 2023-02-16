package kr.or.kosa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.kosa.dto.Message;
import kr.or.kosa.security.User;
import kr.or.kosa.service.MessageService;

@Controller
public class CommonController {
	
	@Autowired
	MessageService messageservice;
	
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
	//헤더에서 쪽지함에 안 읽은 쪽지 있는지...
	@ResponseBody
	@GetMapping("/top/notebox")
	public String getMsgCount() {
		User user;
		String result = "N";
		try {
			user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			List<Message> list = messageservice.getReceivedMsg(user.getMemberId());
			loop : for(Message m : list) {
				if(m.getStatus().equals("N")) {
					result = "Y";
					break loop;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return result;
	}
}