package kr.or.kosa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Post;
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
	
	// 게시판 상세보기
	@GetMapping("{allBoard}/{boardIdx}")
	public ResponseEntity<List<Post>> boardContent(@PathVariable("boardIdx") String boardIdx){
		
		
		System.out.println("idx: " + boardIdx);
		System.out.println("RestController 도는중.. .13");
		
		List<Post> boardContent = new ArrayList<Post>();
		try {
			boardContent = boardService.boardContent(boardIdx);
			return new ResponseEntity<List<Post>>(boardContent, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Post>>(boardContent, HttpStatus.BAD_REQUEST);
		}
	} 
	
	
} 
