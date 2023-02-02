package kr.or.kosa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import kr.or.kosa.dto.Post;
import kr.or.kosa.service.BoardService;

// 페이지 이동 Controller
@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	
	// 공지사항
	@GetMapping("공지사항")
	public String noticeView(Model model) {
		List<Post> noticeList = boardService.noticeList();
		model.addAttribute("noticeList", noticeList);
		return "member/board/noticeList";
	}
	
	// 자유게시판
	@GetMapping("자유게시판")
	public String freeBoardView(Model model) {
		List<Post> freeBoardList = boardService.freeBoardList();
		model.addAttribute("freeBoardList", freeBoardList);
		return "member/board/freeBoardList";
	}
	
	
	// 추가 게시판
	@GetMapping("board/{boardName}")
	public String boardList(Model model, @PathVariable String boardName) {
		
		List<Post> boardList = boardService.customBoardList(boardName);//글목록
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardName", boardName);
		
		return "member/board/boardList";
	}
	
	
	// 게시판 글쓰기 이것도 게시판마다 달라야함
	@GetMapping("/boardWrite")
	public String BoardWrite() {
		
		return "member/board/boardWrite";
	}
}
