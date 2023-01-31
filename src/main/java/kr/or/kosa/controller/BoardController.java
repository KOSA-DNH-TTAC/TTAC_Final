package kr.or.kosa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.kosa.dto.Post;
import kr.or.kosa.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 공지사항 화면만
	@GetMapping("noticeList")
	public String noticeView(Model model) {
		List<Post> noticeList = boardService.noticeList();
		model.addAttribute("noticeList", noticeList);
		return "member/board/noticeList";
	}
	
	// 자유게시판
	@GetMapping("freeBoardList")
	public String freeBoardView(Model model) {
		List<Post> freeBoardList = boardService.freeBoardList();
		model.addAttribute("freeBoardList", freeBoardList);
		return "member/board/freeBoardList";
	}

}
