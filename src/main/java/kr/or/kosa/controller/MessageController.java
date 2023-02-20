package kr.or.kosa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kosa.dto.Message;
import kr.or.kosa.security.User;
import kr.or.kosa.service.MessageService;

@RestController
@RequestMapping("/message")
public class MessageController {
	
	private MessageService service;
	
	@Autowired
	public void setMsgService(MessageService service) {
		this.service = service;
	}
	
	//받은 쪽지 전체 조회
	@GetMapping("/notebox")
	public ResponseEntity<List<Message>> getReceivedMsg(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Message> list = service.getReceivedMsg(user.getMemberId());
//		System.out.println(list);
		return new ResponseEntity<List<Message>>(list, HttpStatus.OK);
	     
	}
	
	//보낸 쪽지 전체 조회
	@GetMapping("/getSend")
	public ResponseEntity<List<Message>> getSendMsg(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Message> list = service.getSendMsg(user.getMemberId());
//		System.out.println(list);
		return new ResponseEntity<List<Message>>(list, HttpStatus.OK);
	     
	}
	
	
	//쪽지 하나 조회
	
//	public ResponseEntity<Message> readMsg(@PathVariable("idx")String idx){
//		int index = Integer.parseInt(idx);
//		Message msg = service.getMsg(index);
//		
//		return new ResponseEntity<Message>(msg, HttpStatus.OK);
//	     
//	}
	@GetMapping("/read/{idx}")
	public ModelAndView readMsg(@PathVariable("idx")String idx) {
		ModelAndView mv = new ModelAndView();
		
		int index = Integer.parseInt(idx);
		Message msg = service.getMsg(index);
		
		mv.setViewName("member/message/note");
		mv.addObject("msg", msg);
		return mv;
		
	}
	
	//쪽지 작성
//	@PostMapping("/writing")
}
