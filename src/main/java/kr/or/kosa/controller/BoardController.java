package kr.or.kosa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

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
	
	
//	// 동적 게시판
//	@GetMapping("게시판")
//	public String customBoardView2() {
//		return "member/board/boardList";
//	}
	//주소를 localhost:9000/board?boardname=덕질게시판
	//이런 식으로 받는 걸로 짜보삼
	
/*	
	@RequestMapping(value="{boardName}", method=RequestMethod.GET)
	public String boardList(@PathVariable String boardName) {
		System.out.println("뭐라도 돌라고~~");
		System.out.println("일반 Controller boardName: " + boardName);
		return "boardList";
		}
*/	
	
	
	// 추가 게시판 뷰
	@GetMapping("board/{boardName}")
	public String boardList(Model model, @PathVariable String boardName) {
		System.out.println("일반 Controller boardName: " + boardName);
		
		List<Post> boardList = boardService.customBoardList(boardName);
		model.addAttribute("boardList", boardList);
		return "member/board/boardList";
	}
	
	

	@GetMapping("/boardWrite")
	public String BoardWrite() {
		
		return "member/board/boardWrite";
	}
}
