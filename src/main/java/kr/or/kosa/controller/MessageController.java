package kr.or.kosa.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Message;
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
	public ResponseEntity<List<Message>> getReceivedMsg(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Message> list = service.getReceivedMsg(user.getMemberId());
		
		return new ResponseEntity<List<Message>>(list, HttpStatus.OK);
	     
	}
	
	//보낸 쪽지 전체 조회
	
	//쪽지 하나 조회
	
	//쪽지 작성
}
