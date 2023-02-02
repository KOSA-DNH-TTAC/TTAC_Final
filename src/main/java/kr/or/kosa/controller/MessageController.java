package kr.or.kosa.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.security.CustomUser;
import kr.or.kosa.security.User;
import kr.or.kosa.service.MessageService;

@RestController
public class MessageController {
	
	private MessageService service;
	
	@Autowired
	public void setMsgService(MessageService service) {
		this.service = service;
	}
	
	//쪽지 전체 조회
	@GetMapping("/notebox")
	public ResponseEntity<String> getReceivedMsg(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		System.out.println(user);
		return null;
	     
	}
	
	//보낸 쪽지 전체 조회
	
	//쪽지 하나 조회
	
	//쪽지 작성
}
