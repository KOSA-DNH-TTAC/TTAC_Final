package kr.or.kosa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Reply;
import kr.or.kosa.service.BoardService;

@RestController
public class BoardController_Rest {

	BoardService boardService;

	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	// 게시판 종류
	@RequestMapping("/categoryList")
	public ResponseEntity<List<Board>> categoryList() {
		List<Board> categoryList = new ArrayList<Board>();
		try {
			categoryList = boardService.categoryList();
			return new ResponseEntity<List<Board>>(categoryList, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Board>>(categoryList, HttpStatus.BAD_REQUEST);
		}
	}

	/*
	// 게시판 상세보기
	@GetMapping("{allBoard}/{boardIdx}")
	public ResponseEntity<List<Post>> boardContent(@PathVariable("boardIdx") String boardIdx) {
		List<Post> boardContent = new ArrayList<Post>();
		try {
			boardContent = boardService.boardContent(boardIdx);
			return new ResponseEntity<List<Post>>(boardContent, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Post>>(boardContent, HttpStatus.BAD_REQUEST);
		}
	}
	
	
	// 게시판 상세보기
		@GetMapping("{allBoard}/{boardIdx}")
		public ResponseEntity<Map<String, Object>> boardAndReply(@PathVariable("boardIdx") String boardIdx) {
			Map<String, Object> map = new HashMap<>();
			
			try {
				map.put("boardContent", boardService.boardContent(boardIdx));
				map.put("replyContent", boardService.replyContent(boardIdx));
				return new ResponseEntity<>(map, HttpStatus.OK);
			} catch (Exception e) {
				map.put("boardContent", boardService.boardContent(boardIdx));
				map.put("replyContent", boardService.replyContent(boardIdx));
				return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
			}
		}
	
	*/
	
	// 게시판 댓글 보기
	@GetMapping("/{allBoard}/{idx}/{idx}")
	public ResponseEntity<List<Reply>> replyContent(@PathVariable("idx") String idx) {
		
		System.out.println("도는겨마는겨");
		
		List<Reply> replyContent = new ArrayList<Reply>();
		try {
			System.out.println("asdf");
			replyContent = boardService.replyContent(idx);
			System.out.println("replyContent: " + replyContent);
			return new ResponseEntity<List<Reply>>(replyContent, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Reply>>(replyContent, HttpStatus.BAD_REQUEST);
		}
	}
	

		// 게시판 상세보기
		//@GetMapping("/eveningCall/{arr}")
//		public ResponseEntity<String> boardContent(@PathVariable double[] arr) {
//			System.out.println("lat : "+ arr);
//			double lat = arr[0]; //latitude
//			double lon = arr[1]; //logitude
//			
//			String success = "점호가 완료되었습니다.";
//			String fail = "점호가 불가능한 지역입니다.";
//			String result;
//			try {
//				result = boardService.eveningCall(lat, lon);
//				return new ResponseEntity<String>(success, HttpStatus.OK);
//			} catch (Exception e) {
//				return new ResponseEntity<String>(fail, HttpStatus.BAD_REQUEST);
//			}
//		}
		
		 @RequestMapping(value = "/eveningCall", method = RequestMethod.POST)
		   public String eveningCall(@RequestParam(value = "report[]") double[] report) {
			 System.out.println("lat : "+ report);
			 double lat = report[0];
			 System.out.println("lat : "+ lat);
			 double lon = report[1];
			 System.out.println("lon : "+ lon);
			 String result = boardService.eveningCall(lat, lon);
			 //점호한 인원 정보 데이터 인서트
			 //boardService.eveningCall(lat, lon);
			 return result;
		 }
}
