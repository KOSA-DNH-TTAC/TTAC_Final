package kr.or.kosa.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.security.CustomUser;
import kr.or.kosa.service.MessageService;

@RestController
public class MessageController {
	
	private MessageService service;
	
	@Autowired
	public void setMsgService(MessageService service) {
		this.service = service;
	}
	
	//쪽지 전체 조회
//	public ResponseEntity<String> getReceivedMsg(Principal principal){
//		service.getReceivedMsg(memberid);
//	}
	
	//보낸 쪽지 전체 조회
	
	//쪽지 하나 조회
	
	//쪽지 작성
}
