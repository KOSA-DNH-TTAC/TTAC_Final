package kr.or.kosa.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosa.dto.File;
import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.Post;
import kr.or.kosa.service.BoardService;
import kr.or.kosa.service.MemberService;

// 페이지 이동 Controller
@Controller
public class BoardController {

	private BoardService boardService;
	private MemberService memberService;

	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// 기본 제공 게시판
	@GetMapping("{allBoard}")
	public String allBoardView(Model model, @PathVariable String allBoard) {
		List<Post> allBoardList = boardService.allBoardList(allBoard); // 글목록
		model.addAttribute("allBoardList", allBoardList);
		System.out.println("allBoardList : " + allBoardList);
		String viewPage = "member/board/";
		if (allBoard.equals("공지사항")) {
			viewPage += "noticeList";
		} else if (allBoard.equals("건의사항")) {
			viewPage += "opinionList";
		} else if (allBoard.equals("자유게시판")) {
			viewPage += "freeBoardList";
		} else if (allBoard.equals("거래게시판")) {
			viewPage += "productBoardList";
		}
		return viewPage;
	}

	// 커스텀 생성 게시판
	@GetMapping("board/{boardName}")
	public String boardList(Model model, @PathVariable String boardName) {

		List<Post> boardList = boardService.customBoardList(boardName);// 글목록
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardName", boardName);

		return "member/board/customBoardList";
	}

	// 게시판 글쓰기 이것도 게시판마다 달라야함

	@GetMapping("/{boardName}/boardWrite")
	public String BoardWrite() {
		return "member/board/boardWrite";
	}

	@PostMapping("/{boardName}/boardWrite")
	public String BoardWriteOk() {
		return "member/board/boardWrite";
	}

	// 공지사항 글쓰기
	@GetMapping("/공지사항/noticeWrite")
	public String noticeWrite() {
		return "member/board/noticeWrite";
	}

	// 공지사항 글쓰기
	@PostMapping("/공지사항/noticeWrite")
	public String noticeWriteOk(Principal principal, Model model,MultipartFile file, @PathVariable("title") String title,
																							 @PathVariable("content") String content) {

		String msg = "";
		String url = "";
		int result = 0;
		
		
		if (principal == null) {
			
			msg = "세션이 만료되었습니다.";
			url = "/";
			
		} else {
			
			Member member = null;
			String memberid = principal.getName();
			member = memberService.getMemberById(memberid);
			
			String uploadFolder = "D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\springProj2\\src\\main\\webapp\\resources\\upload";
			File FFF = new File();
			FFF.getFileName()

			post.setBoardIdx(3);
			post.setUniversityCode(member.getUniversityCode());
			post.setMemberId(member.getMemberId());
			post.setTitle(title);
			post.setContent(content);

			result = boardService.freeBoardWrite(post);

			if (result < 1) {
				msg = "글 작성이 실패했습니다.";
				url = "/자유게시판/freeBoardWrite";
			} else {
				msg = "글 작성이 완료되었습니다!";
				url = "/자유게시판";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/redirect";
	}

	// 건의사항 글쓰기
	@GetMapping("/건의사항/opinionWrite")
	public String opinionWrite() {
		return "member/board/opinionWrite";
	}

	// 건의사항 글쓰기
	@PostMapping("/건의사항/opinionWrite")
	public String opinionWriteOk() {
		return "member/board/opinionWrite";
	}

	// 자유게시판 글쓰기
	@GetMapping("/자유게시판/freeBoardWrite")
	public String freeBoardWrite() {
		return "member/board/freeBoardWrite";
	}

	// 자유게시판 글쓰기
	@PostMapping("/자유게시판/freeBoardWrite")
	public String freeBoardWriteOk(Principal principal, Model model, @RequestParam("title") String title,
																	 @RequestParam("content") String content) {
		
		String msg = "";
		String url = "";
		int result = 0;
		
		
		if (principal == null) {
			
			msg = "세션이 만료되었습니다.";
			url = "/";
			
		} else {
			
			Member member = null;
			String memberid = principal.getName();
			member = memberService.getMemberById(memberid);
			Post post = new Post();

			post.setBoardIdx(3);
			post.setUniversityCode(member.getUniversityCode());
			post.setMemberId(member.getMemberId());
			post.setTitle(title);
			post.setContent(content);

			result = boardService.freeBoardWrite(post);

			if (result < 1) {
				msg = "글 작성이 실패했습니다.";
				url = "/자유게시판/freeBoardWrite";
			} else {
				msg = "글 작성이 완료되었습니다!";
				url = "/자유게시판";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/redirect";
	}

}
