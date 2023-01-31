package kr.or.kosa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Post;
import kr.or.kosa.service.BoardService;

@RestController
public class BoardController_Rest {

	BoardService boardService;
	
	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping("")
	public ResponseEntity<List<Post>> noticeList() {
		System.out.println("rest controller");
		List<Post> noticeList = new ArrayList<Post>();
		try {
			noticeList = boardService.noticeList();
			return new ResponseEntity<List<Post>>(noticeList, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Post>>(noticeList, HttpStatus.BAD_REQUEST);
		}
	}
}
