package kr.or.kosa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Board;
import kr.or.kosa.service.AdminService;
import kr.or.kosa.service.BoardService;


@RequestMapping("/admin/board")
@RestController
public class AdminBoardController_Rest {
	
	private BoardService boardService;
	private AdminService adminservice;

	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@Autowired
	public void setAdminservice(AdminService adminservice) {
		this.adminservice = adminservice;
	}


	@GetMapping("/list")
	public ResponseEntity<Map<String, Object>> getCategory(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Board> list = adminservice.getBoardList();
		map.put("list", list);
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	@PatchMapping("/updateBoard")
	public ResponseEntity<Map<String, Object>> updateBoardName(@RequestBody HashMap<String,Object> data){
		Map<String, Object> map = new HashMap<String, Object>();
//		System.out.println(data);
		String boardname = (String)data.get("boardname");
		String boardidx = (String)data.get("boardidx");
		int result = adminservice.updateBoard(boardname, boardidx);

		map.put("rows", result);
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	@PostMapping("/create")
	public ResponseEntity<Map<String, Object>> createBoardName(@RequestBody HashMap<String,Object> data){
		Map<String, Object> map = new HashMap<String, Object>();
//		System.out.println(data);
		String boardname = (String)data.get("boardname");
		int result = adminservice.createBoard(boardname);

		map.put("rows", result);
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	@DeleteMapping("/delete")
	public ResponseEntity<Map<String, Object>> deleteBoard(@RequestBody HashMap<String,Object> data){
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(data);
		String boardidx = (String)data.get("boardidx");
		int result = adminservice.deleteBoard(boardidx);

		map.put("rows", result);
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
}
