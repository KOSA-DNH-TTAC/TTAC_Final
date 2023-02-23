package kr.or.kosa.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosa.aws.AwsS3;
import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.File;
import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.Post;
import kr.or.kosa.dto.Product;
import kr.or.kosa.security.User;
import kr.or.kosa.service.BoardService;
import kr.or.kosa.service.MemberService;
import kr.or.kosa.utils.Criteria;
import kr.or.kosa.utils.Pager;

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
	public String allBoardView(Model model, @PathVariable String allBoard, @RequestParam(value="cpage", required=false, defaultValue= "0") String cpage) {

		//널일 경우엔 그냥 default값으로 생성
		//널 아니면 그 값으로 set 해서 사용
		
		//페이지 사이즈는 어차피 cri에서 고정이고
		//파라미터로 현재 페이지만 받음
		
		Criteria cri = new Criteria();
		//cp가 널이 아니면 cri에서 해당 페이지를 셋 함(page에)

		if(!cpage.equals("0")) {
			cri.setPage(Integer.parseInt(cpage));
		}
		System.out.println("cpage : " + cpage);
		System.out.println(cri);
		
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

		Pager pager = new Pager(cri);
		int totalCount = boardService.totalCount(param);
		System.out.println(totalCount);
		pager.setTotalCount(totalCount);
		
//		System.out.println(pager);
		
		List<Post> allBoardList = boardService.allBoardList(param, cri);
		model.addAttribute("allBoardList", allBoardList);
		model.addAttribute("pager", pager);
		model.addAttribute("boardname", allBoard);

		return viewPage;
	}


//	 커스텀 생성 게시판
	@GetMapping("/board/custom/{boardName}")
	public String boardList(Model model, @PathVariable String boardName, @RequestParam(value="cpage", required=false, defaultValue= "0") String cpage) {
		
		Criteria cri = new Criteria();
		//cp가 널이 아니면 cri에서 해당 페이지를 셋 함(page에)

		if(!cpage.equals("0")) {
			cri.setPage(Integer.parseInt(cpage));
		}
		System.out.println("cpage : " + cpage);
		System.out.println(cri);
		
		Pager pager = new Pager(cri);
		int totalCount = boardService.totalCount(boardName);
		System.out.println(totalCount);
		pager.setTotalCount(totalCount);
		
		System.out.println(pager);
		
		
		List<Post> boardList = boardService.allBoardList(boardName, cri);
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardName", boardName);
		model.addAttribute("pager", pager);
		model.addAttribute("boardname", boardName); //페이징을 위한 이름

		return "member/board/customBoardList";
	}
	
	// 게시판 글쓰기
	@GetMapping("/board/custom/{boardName}/write")
	public String customBoardWrite(Model model, @PathVariable String boardName) {
		model.addAttribute("boardName", boardName);
		return "member/board/customBoardWrite";
	}
	
	// 커스텀 게시판 글쓰기
	@PostMapping("/board/custom/{boardName}/write")
	public String customBoardWriteOk(Model model, @RequestParam("title") String title,
												  @RequestParam("content") String content,
												  @PathVariable String boardName) throws ClassNotFoundException, SQLException {
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String msg = "";
		String url = "";
		String icon = "";
		int result = 0;

		Board board = new Board();
		Post post = new Post();
		

		board.setBoardName(boardName);
		board.setUniversityCode(user.getUniversityCode());

		post.setBoardIdx(boardService.selectBoardIdx(board));
		post.setBoardName(boardName);
		post.setUniversityCode(user.getUniversityCode());
		post.setMemberId(user.getMemberId());
		post.setTitle(title);
		post.setContent(content);
		

		result = boardService.freeBoardWrite(post);

		if (result < 1) {
			icon = "error";
			msg = "글 작성이 실패했습니다.";
			url = "/board/custom/"+boardName+"/write";
		} else {
			icon = "success";
			msg = "글 작성이 완료되었습니다!";
			url = "/board/custom/"+boardName;
		}
		

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("icon", icon);
		
		return "/common/redirect";
	}
	
	// 커스텀 게시글 수정(GET)
	@GetMapping("/board/custom/{boardName}/{idx}/edit")
	public String boardCustomEdit(Model model, @PathVariable("idx") int idx,
										 @PathVariable("boardName") String boardName) throws ClassNotFoundException, SQLException{
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Post boardContent = boardService.boardContentDTO(idx);

		model.addAttribute("boardContent", boardContent);
		
		return "member/board/customBoardEdit";
	}
	
	// 커스텀 게시글 수정(POST)
	@PostMapping("/board/custom/{boardName}/{idx}/edit")
	public String boardCustomEditOk(Model model, @PathVariable("idx") int idx,
										   @PathVariable("boardName") String boardName,
										   @RequestParam("title") String title,
										   @RequestParam("content") String content) throws ClassNotFoundException, SQLException {
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Post boardContent = boardService.boardContentDTO(idx);
		
		int result= 0;
		String icon= "";
		String msg = "";
		String url = "";

		
		//글 제목, 내용 수정
		boardContent.setTitle(title);
		boardContent.setContent(content);
		
		result = boardService.boardContentEdit(boardContent);
		
		//글 수정이 제대로 되었는지 확인
		if (result < 1) {
			icon = "error";
			msg = "글 작성이 실패했습니다.";
			url = "/board/custom/"+boardName+"/"+idx+"/edit";
		} else {
			icon = "success";
			msg = "글 작성이 완료되었습니다!";
			url = "/board/custom/"+boardName+"/"+idx;
			
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("icon", icon);
		
		return "/common/redirect";
	}
	
	// 커스텀게시글 삭제
	@GetMapping("/board/custom/{boardName}/{idx}/delete")
	public String boardDeleteOk(Model model, @PathVariable("idx") int idx,
			 							   @PathVariable("boardName") String boardName) throws ClassNotFoundException, SQLException{
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Post boardContent = boardService.boardContentDTO(idx);
		
		int result= 0;
		String icon= "";
		String msg = "";
		String url = "";

		//게시글 status 22로 변경 (삭제)
		boardContent.setStatus(22);
		result = boardService.boardContentEdit(boardContent);
		
		//글 수정이 제대로 되었는지 확인
		if (result < 1) {
			icon = "error";
			msg = "글 작성이 실패했습니다.";
			url = "/board/custom/"+boardName+"/"+idx+"/edit";
		} else {
			icon = "success";
			msg = "글 삭제가 완료되었습니다!";
			url = "/board/custom/"+boardName;
			
		}
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("icon", icon);
		
		return "/common/redirect";
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
//		System.out.println("보드네임 : " + boardName);
//		System.out.println("idx : " + idx);
		List<Post> boardContent = boardService.boardContent(idx);
		List<File> fileContent = boardService.fileContent(idx);
		Product productContent = boardService.productContent(idx);
		

		if (boardName.equals("noticeList")) {
//			param = "공지사항";
			path = "noticeContent";
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
		
		if (productContent != null) {
			model.addAttribute("productContent", productContent);
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
		List<File> fileContent = boardService.fileContent(Integer.toString(idx));

		
		if (!fileContent.isEmpty()) {
			model.addAttribute("fileContent", fileContent);
		}
		
		model.addAttribute("boardContent", boardContent);
		
		return "member/board/freeBoardEdit";
	}
	
	// 게시글 수정(POST)
	@PostMapping("/board/{boardName}/{idx}/edit")
	public String boardEditOk(Model model, @PathVariable("idx") int idx,
										   @PathVariable("boardName") String boardName,
										   @RequestParam("title") String title,
										   @RequestParam("content") String content,
										   @RequestParam(name = "sold", required = false) String sold,
										   @RequestParam(name = "file", required = false) List<MultipartFile> files) throws ClassNotFoundException, SQLException, IOException {
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Post boardContent = boardService.boardContentDTO(idx);
		
		int result= 0;
		String icon= "";
		String msg = "";
		String url = "";
		
		System.out.println("파일즈"+files);

		
		//글 제목, 내용 수정
		boardContent.setTitle(title);
		boardContent.setContent(content);
		
		if(boardName.equals("productBoardList")) {
			
			boardContent.setLikeNum(Integer.parseInt(sold));
			System.out.println("솔드 값: " + sold);
			System.out.println("보드컨텐츠: " +  boardContent);
			System.out.println("보드네임: " +  boardName);
		}
		
		result = boardService.boardContentEdit(boardContent, files);
		
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
		
		int result = 0;
		
		Post postDTO = new Post();
		
		//글 담아주기
		postDTO.setBoardIdx(boardIDX);
		postDTO.setBoardName("공지사항");
		postDTO.setUniversityCode(user.getUniversityCode());
		postDTO.setMemberId(user.getMemberId());
		postDTO.setTitle(title);
		postDTO.setContent(content);
		
		//서비스슝슝
		result = boardService.postListInsert(postDTO, files);
		
		if (result < 1) {
			icon = "error";
			msg = "글 작성이 실패했습니다.";
			url = "/board/noticeWrite";
		} else {
			icon = "success";
			msg = "글 작성이 완료되었습니다!";
			url = "/board/noticeList";
			
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
	public String productWriteOk(Model model, @RequestParam("file") List<MultipartFile> files,
							 	 			  @RequestParam("title") String title,
							 	 			  @RequestParam("content") String content,
							 	 			  @RequestParam("price") int price,
							 	 			  @RequestParam("sold") String sold) throws IOException  {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int boardIDX = 4;
		String msg = "";
		String url = "";
		String icon = "";
		String fileName = "";
		MultipartFile multiFile = files.get(0);
		
		int result = 0;
		
		
		Post postDTO = new Post();
		Product ProductDTO = new Product();
		List<File> fileDTO = new ArrayList<File>();
		
		//글 담아주기
		postDTO.setBoardIdx(boardIDX);
		postDTO.setBoardName("거래게시판");
		postDTO.setUniversityCode(user.getUniversityCode());
		postDTO.setMemberId(user.getMemberId());
		postDTO.setTitle(title);
		postDTO.setContent(content);
		
		ProductDTO.setProductPrice(price);
		ProductDTO.setProductSold(sold);
		
		//파일 담아주기
		if(multiFile.getSize() != 0) {
			for (MultipartFile multipartfile : files) {
				File fileOne = new File();
				
				UUID uuid = UUID.randomUUID();
				fileName = "https://d37qu1avlirbuh.cloudfront.net/" + uuid.toString()+"_"+multipartfile.getOriginalFilename();
				fileOne.setFileName(fileName);
				fileOne.setFileRealName(multipartfile.getOriginalFilename());
				fileOne.setFileSize(multipartfile.getSize());
				
				fileDTO.add(fileOne);
			}
		}
			
		
			//서비스슝슝
			result = boardService.postListInsert(postDTO, ProductDTO, fileDTO, files);
			
			if (result < 1) {
				icon = "error";
				msg = "글 작성이 실패했습니다.";
				url = "/board/productBoardWrite";
			} else {
				icon = "success";
				msg = "글 작성이 완료되었습니다!";
				url = "/board/productBoardList";
				
			}
		

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("icon", icon);

		return "/common/redirect";
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
