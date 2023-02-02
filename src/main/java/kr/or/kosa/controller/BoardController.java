package kr.or.kosa.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.Post;
import kr.or.kosa.service.BoardService;
import kr.or.kosa.service.MemberService;

// 페이지 이동 Controller
@Controller
public class BoardController {

	private BoardService boardService;
	private MemberService memberservice;
	
	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@Autowired
    public void setMemberService(MemberService memberservice) {
        this.memberservice = memberservice;
    }
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
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
		System.out.println("button태그29!!!");
		System.out.println("일반 Controller boardName: " + boardName);
		
		List<Post> boardList = boardService.customBoardList(boardName);//글목록
		model.addAttribute("boardList", boardList);
		System.out.println("boardList: " + boardList);
		return "member/board/boardList";
	}
	
	
	// 커스텀 게시판 글쓰기 이것도 게시판마다 달라야함
	@GetMapping("/boardWrite")
	public String BoardWrite() {
		return "member/board/boardWrite";
	}
	
	@PostMapping("/boardWrite")
	public String BoardWriteOk() {
		return "member/board/boardWrite";
	}
	
	//공지사항 글쓰기
	@GetMapping("/noticeWrite")
	public String noticeWrite() {
		return "member/board/noticeWrite";
	}
	//공지사항 글쓰기
	@PostMapping("/noticeWrite")
	public String noticeWriteOk(Principal principal) {
		Member member = null;
		String memberid = principal.getName();
		member = memberservice.getMemberById(memberid);
		return "member/board/noticeWrite";
	}
	
	//건의사항 글쓰기
	@GetMapping("/opinionWrite")
	public String opinionWrite() {
		return "member/board/opinionWrite";
	}
	//건의사항 글쓰기
	@PostMapping("/opinionWrite")
	public String opinionWriteOk() {
		return "member/board/opinionWrite";
	}
		
	//자유게시판 글쓰기
	@GetMapping("/freeBoardWrite")
	public String freeBoardWrite() {
		return "member/board/freeBoardWrite";
	}
	//자유게시판 글쓰기
	@PostMapping("/freeBoardWrite")
	public String freeBoardWriteOk() {
		return "member/board/freeBoardWrite";
	}
	
	
	
	
}
