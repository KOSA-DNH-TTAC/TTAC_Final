package kr.or.kosa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/board")
public class BoardController {

	@GetMapping("/write")
	public String BoardWrite() {
		
		return "member/board/boardWrite";
	}
	
	@GetMapping("/list")
	public String BoardList() {
		
		return "member/board/boardList";
	}
}
