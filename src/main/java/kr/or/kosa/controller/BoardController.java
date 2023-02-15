package kr.or.kosa.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
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
		List<Post> boardList = boardService.allBoardList(boardName);
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardName", boardName);

		return "member/board/customBoardList";
	}

	// 게시글 보기
	@GetMapping("/board/{boardName}/{idx}")
	public String boardContent(Model model, @PathVariable("idx") String idx,
			@PathVariable("boardName") String boardName) {
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		String param = "";
		String path = "";
		String extension = "";
		String url = "";
		System.out.println("보드네임 : " + boardName);
		List<Post> boardContent = boardService.boardContent(idx);
		
		//컨트롤러에서 받아온 파일 리스트
		List<File> fileContent = boardService.fileContent(idx);
//		System.out.println("컨트롤러 fileContent : "+fileContent);

		if (boardName.equals("noticeList")) {
//			param = "공지사항";
			path = "noticeContent";
			System.out.println("공지돌고잇니?");
		} else if (boardName.equals("opinionList")) {
//			param += "건의사항";
			path = "opinionContent";
		} else if (boardName.equals("freeBoardList")) {
//			param += "자유게시판";
			path = "freeBoardContent";
		} else if (boardName.equals("productBoardList")) {
//			param += "거래게시판";
			path = "productBoardContent";
		}

		if (!fileContent.isEmpty()) {
			model.addAttribute("fileContent", fileContent);
		}
		
		model.addAttribute("boardContent", boardContent);
		model.addAttribute("userId", user.getMemberId());

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
	
	// 게시글 삭제
	@GetMapping("board/{boardName}/{idx}/delete")
	public String boardDelete(Model model, @PathVariable("idx") int idx,
			 							   @PathVariable("boardName") String boardName) throws ClassNotFoundException, SQLException{
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Post boardContent = boardService.boardContentDTO(idx);
		
		int result= 0;
		String icon= "";
		String msg = "";
		String url = "";

		// 로그인 오래되면 팅기도록
		if (user == null) {

			icon = "error";
			msg = "세션이 만료되었습니다.";
			url = "/";
			
		} else {
			//게시글 status 22로 변경 (삭제)
			boardContent.setStatus(22);
			result = boardService.boardContentEdit(boardContent);
			
			//글 수정이 제대로 되었는지 확인
			if (result < 1) {
				icon = "error";
				msg = "글 작성이 실패했습니다.";
				url = "/board/"+boardName+"/"+idx+"/edit";
			} else {
				icon = "success";
				msg = "글 삭제가 완료되었습니다!";
				url = "/board/"+boardName;
				
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("icon", icon);
		
		return "/common/redirect";
	}
	
	// 게시글 수정(GET)
	@GetMapping("/board/{boardName}/{idx}/edit")
	public String boardEdit(Model model, @PathVariable("idx") int idx,
										 @PathVariable("boardName") String boardName) throws ClassNotFoundException, SQLException{
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Post boardContent = boardService.boardContentDTO(idx);

		
		// 글 쓴사람과 로그인한 사람이 같은지
		if (!user.getMemberId().equals(boardContent.getMemberId())) {

			String icon = "";
			String msg = "세션이 만료되었습니다.";
			String url = "/";
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			model.addAttribute("icon", icon);
			
			return "/common/redirect";
			
		}
		
		model.addAttribute("boardContent", boardContent);
		
		return "member/board/freeBoardEdit";
	}
	
	// 게시글 수정(POST)
	@PostMapping("/board/{boardName}/{idx}/edit")
	public String boardEditOk(Model model, @PathVariable("idx") int idx,
										   @PathVariable("boardName") String boardName,
										   @RequestParam("title") String title,
										   @RequestParam("content") String content) throws ClassNotFoundException, SQLException {
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Post boardContent = boardService.boardContentDTO(idx);
		
		int result= 0;
		String icon= "";
		String msg = "";
		String url = "";

		// 로그인 오래되면 팅기도록
		if (user == null) {

			icon = "error";
			msg = "세션이 만료되었습니다.";
			url = "/";
			
		} else {
			//글 제목, 내용 수정
			boardContent.setTitle(title);
			boardContent.setContent(content);
			
			result = boardService.boardContentEdit(boardContent);
			
			//글 수정이 제대로 되었는지 확인
			if (result < 1) {
				icon = "error";
				msg = "글 작성이 실패했습니다.";
				url = "/board/"+boardName+"/"+idx+"/edit";
			} else {
				icon = "success";
				msg = "글 작성이 완료되었습니다!";
				url = "/board/"+boardName+"/"+idx;
				
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("icon", icon);
		
		return "/common/redirect";
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
	public String noticeWriteOk(Model model, @RequestParam("file") List<MultipartFile> files,
										 	 @RequestParam("title") String title,
										     @RequestParam("content") String content) throws IOException  {
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int boardIDX = 1;
		String msg = "";
		String url = "";
		String icon = "";
		String fileName = "";
		
		int result = 0;
		
		if (user == null) {
			icon = "warning";
			msg = "세션이 만료되었습니다.";
			url = "/";

		} else {
			Post postDTO = new Post();
			List<File> fileDTO = new ArrayList<File>();
			
			//글 담아주기
			postDTO.setBoardIdx(boardIDX);
			postDTO.setBoardName("공지사항");
			postDTO.setUniversityCode(user.getUniversityCode());
			postDTO.setMemberId(user.getMemberId());
			postDTO.setTitle(title);
			postDTO.setContent(content);
			
			//파일 담아주기
			for (MultipartFile multipartfile : files) {
				File fileOne = new File();
				
				UUID uuid = UUID.randomUUID();
				fileName = uuid.toString()+"_"+multipartfile.getOriginalFilename();
				fileOne.setFileName(fileName);
				fileOne.setFileRealName(multipartfile.getOriginalFilename());
				fileOne.setFileSize(multipartfile.getSize());
				
				fileDTO.add(fileOne);
			}
		
			//서비스슝슝
			result = boardService.noticeListInsert(postDTO, fileDTO, files);
			
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
	
	// 거래게시판 글쓰기
	@GetMapping("/board/productBoardWrite")
	public String productWrite() {
		return "member/board/productBoardWrite";
	}

	// 거래게시판 글쓰기
	@PostMapping("/board/productBoardWrite")
	public String productWriteOk() {
		return "member/board/productBoardWrite";
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
	
	@GetMapping("/download/{idx}/{file}")
	public ResponseEntity<byte[]> download(@PathVariable("idx") String idx,
										   @PathVariable("file") String file		) throws IOException {
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String university = "";
		String url = "";
		
		university = user.getUniversityCode();
		
		url = university +"/"+ "board" + "/" + idx + "/" + file;
		System.out.println("파일다운 url" + url);
		AwsS3 awsS3 = AwsS3.getInstance();
        return awsS3.getObject(url);
    }

}
