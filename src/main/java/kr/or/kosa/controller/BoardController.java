package kr.or.kosa.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosa.aws.AwsS3;
import kr.or.kosa.dto.File;
import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.Post;
import kr.or.kosa.security.User;
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
	@GetMapping("/board/{allBoard}")
	public String allBoardView(Model model, @PathVariable String allBoard) {

		String param = "";

		if (allBoard.equals("noticeList")) {
			param = "공지사항";
		} else if (allBoard.equals("opinionList")) {
			param += "건의사항";
		} else if (allBoard.equals("freeBoardList")) {
			param += "자유게시판";
		} else if (allBoard.equals("productBoardList")) {
			param += "거래게시판";
		}

		String viewPage = "member/board/" + allBoard;

		List<Post> allBoardList = boardService.allBoardList(param);
		model.addAttribute("allBoardList", allBoardList);

		return viewPage;
	}

	// 커스텀 생성 게시판
	@GetMapping("/board/custom/{boardName}")
	public String boardList(Model model, @PathVariable String boardName) {
		List<Post> boardList = boardService.customBoardList(boardName);
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardName", boardName);

		return "member/board/customBoardList";
	}

	// 게시글 보기
	@GetMapping("/board/{boardName}/{idx}")
	public String boardContent(Model model, @PathVariable("idx") String idx,
			@PathVariable("boardName") String boardName) {
		
		String param = "";
		String path = "";

		if (boardName.equals("noticeList")) {
			param = "공지사항";
			path = "noticeContent";
			System.out.println("공지돌고잇니?");
		} else if (boardName.equals("opinionList")) {
			param += "건의사항";
			path = "opinionContent";
		} else if (boardName.equals("freeBoardList")) {
			param += "자유게시판";
			path = "freeBoardContent";
		} else if (boardName.equals("productBoardList")) {
			param += "거래게시판";
			path = "productBoardContent";
		}

		List<Post> boardContent = boardService.boardContent(idx);
		List<File> fileContent = boardService.fileContent(idx);
		
		if (fileContent.isEmpty()) {
		} else {
			model.addAttribute("fileContent", fileContent);
		}
		
		model.addAttribute("boardContent", boardContent);
		
		String viewPage = "member/board/" + path;
			
		return viewPage;
	}
	
	// 커스텀 게시판 게시글 보기
	@GetMapping("/board/custom/{boardName}/{idx}")
	public String customBoardContent(Model model, @PathVariable("idx") String idx,
			@PathVariable("boardName") String boardName) {
		List<Post> customBoardContent = boardService.boardContent(idx);
		
		model.addAttribute("custom", customBoardContent);
		model.addAttribute("boardName", boardName);
		return "member/board/customBoardContent";
	}

	
	// 게시판 글쓰기

	@GetMapping("/{boardName}/boardWrite")
	public String BoardWrite() {
		return "member/board/boardWrite";
	}

	@PostMapping("/{boardName}/boardWrite")
	public String BoardWriteOk() {
		return "member/board/boardWrite";
	}

	// 공지사항 글쓰기
	@GetMapping("/board/noticeWrite")
	public String noticeWrite() {
		return "member/board/noticeWrite";
	}

	// 공지사항 글쓰기
	@PostMapping("/board/noticeWrite")
	public String noticeWriteOk(Principal principal, Model model,@RequestParam("file") MultipartFile file,
															 	 @RequestParam("title") String title,
															     @RequestParam("content") String content) throws IOException  {

		int boardIDX = 1;
		String route = "";
		String msg = "";
		String url = "";
		String icon = "";
		String fileName = "";
		int result = 0;
		
		if (principal == null) {

			msg = "세션이 만료되었습니다.";
			url = "/";

		} else {

			Member member = null;
			String memberid = principal.getName();
			member = memberService.getMemberById(memberid);
			
			Post postDTO = new Post();
			
			postDTO.setBoardIdx(boardIDX);
			postDTO.setBoardName("공지사항");
			postDTO.setUniversityCode(member.getUniversityCode());
			postDTO.setMemberId(member.getMemberId());
			postDTO.setTitle(title);
			postDTO.setContent(content);
			
			result = boardService.freeBoardWrite(postDTO);
			
			if (file.getSize() != 0) {
				File fileDTO = new File();
				fileName = file.getOriginalFilename();
				fileDTO.setFileName(fileName);
				fileDTO.setFileSize(file.getSize());
				
				result = boardService.fileWrite(fileDTO);
				int idx = boardService.recentFileIdx();
				
				try {
					AwsS3 awsS3 = AwsS3.getInstance();
					route = member.getUniversityCode()+"/"+ "board" + "/" + idx + "/" +fileName;
					System.out.println(route);
					awsS3.upload(file, route);
					
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			
			
			if (result < 1) {
				icon = "error";
				msg = "글 작성이 실패했습니다.";
				url = "/board/noticeList/noticeWrite";
			} else {
				icon = "success";
				msg = "글 작성이 완료되었습니다!";
				url = "/board/noticeList";
				
			}
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("icon", icon);

		return "/common/redirect";
	}

	// 건의사항 글쓰기
	@GetMapping("/opinionList/opinionWrite")
	public String opinionWrite() {
		return "member/board/opinionWrite";
	}

	// 건의사항 글쓰기
	@PostMapping("/opinionList/opinionWrite")
	public String opinionWriteOk() {
		return "member/board/opinionWrite";
	}

	// 자유게시판 글쓰기
	@GetMapping("/board/freeBoardWrite")
	public String freeBoardWrite() {
		return "member/board/freeBoardWrite";
	}
	
	// 자유게시판 글쓰기
	@PostMapping("/board/freeBoardWrite")
	public String freeBoardWriteOk(Principal principal, Model model, @RequestParam("title") String title,
			@RequestParam("content") String content) {

		String msg = "";
		String url = "";
		String icon = "";
		int result = 0;

		if (principal == null) {
			icon = "warning";
			msg = "세션이 만료되었습니다.";
			url = "/";

		} else {

			Member member = null;
			String memberid = principal.getName();
			member = memberService.getMemberById(memberid);
			Post post = new Post();

			post.setBoardIdx(3);
			post.setBoardName("자유게시판");
			post.setUniversityCode(member.getUniversityCode());
			post.setMemberId(member.getMemberId());
			post.setTitle(title);
			post.setContent(content);

			result = boardService.freeBoardWrite(post);

			if (result < 1) {
				icon = "error";
				msg = "글 작성이 실패했습니다.";
				url = "/board/freeBoardWrite";
			} else {
				icon = "success";
				msg = "글 작성이 완료되었습니다!";
				url = "/board/freeBoardList";
			}
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("icon", icon);
		
		return "/common/redirect";
	}
	
	//파일 다운로드
		@GetMapping("/download/{idx}/{fileName}")
		public ResponseEntity<byte[]> download(@PathVariable("idx") String idx,
											   @PathVariable("fileName") String fileName) throws IOException {
			String url = "";
			
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String university = user.getUniversityCode();
			
			url = university +"/"+ "board" + "/" + idx + "/" + fileName;
			System.out.println("파일다운 url" + url);
			AwsS3 awsS3 = AwsS3.getInstance();
	        return awsS3.getObject(url);
	    }

}
