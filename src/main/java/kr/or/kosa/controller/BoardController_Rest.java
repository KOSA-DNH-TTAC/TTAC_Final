package kr.or.kosa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping("categoryList")
	public ResponseEntity<List<Board>> categoryList() {
		List<Board> categoryList = new ArrayList<Board>();
		try {
			categoryList = boardService.categoryList();
			return new ResponseEntity<List<Board>>(categoryList, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Board>>(categoryList, HttpStatus.BAD_REQUEST);
		}
	}
	
	
	// 동적 게시판별 글 보기
	@GetMapping("boardAjax/{boardName}")
	public ResponseEntity<List<Post>> boardListView(@PathVariable("boardName") String boardName) {
		System.out.println("Rest Controller.!!.!!........");
		System.out.println("parameter: " + boardName);
		
		List<Post> boardList = new ArrayList<Post>();
		try {
			boardList = boardService.customBoardList(boardName);
			System.out.println("boardList: " + boardList);
			return new ResponseEntity<List<Post>>(boardList, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Post>>(boardList, HttpStatus.BAD_REQUEST);
		}
	}

	/*
	 * @GetMapping("boardList") public ResponseEntity<List<Post>>
	 * boardListView(@PathVariable String boardName) {
	 * System.out.println("ㅇ??????ㄱ"); System.out.println("parameter: " +
	 * boardName);
	 * 
	 * List<Post> boardList = new ArrayList<Post>(); try { boardList =
	 * boardService.customBoardList(); System.out.println("Service 돌앗나???????");
	 * System.out.println("boardList: " + boardList); return new
	 * ResponseEntity<List<Post>>(boardList, HttpStatus.OK); } catch (Exception e) {
	 * return new ResponseEntity<List<Post>>(boardList, HttpStatus.BAD_REQUEST); } }
	 */
	
	// /customboard?boardname=덕질게시판
	
	
} 
