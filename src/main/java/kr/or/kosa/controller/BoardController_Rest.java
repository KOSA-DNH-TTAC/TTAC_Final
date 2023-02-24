package kr.or.kosa.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.aws.AwsS3;
import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.Facility;
import kr.or.kosa.dto.File;
import kr.or.kosa.dto.Reply;
import kr.or.kosa.dto.SleepOverHistory;
import kr.or.kosa.security.User;
import kr.or.kosa.service.BoardService;
import kr.or.kosa.service.FacilityService;
import kr.or.kosa.service.ReplyService;

@RestController
public class BoardController_Rest {

	BoardService boardService;
	FacilityService facilityService;
	ReplyService replyservice;

	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	@Autowired
	public void setFacilityService(FacilityService facilityService) {
		this.facilityService = facilityService;
	}
	
	@Autowired
	public void setReplyservice(ReplyService replyservice) {
		this.replyservice = replyservice;
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

	// 댓글, 대댓글 Map Return
	@GetMapping("/board/{allBoard}/{idx}/reply")
	public ResponseEntity<Map<String, Object>> allReply(@PathVariable("idx") String idx) {
		
		Map<String, Object> map = new HashMap<>();
		try {
			map.put("replyContent", boardService.replyContent(idx));
			map.put("reReplyContent", boardService.reReplyContent(idx));
			return new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			map.put("replyContent", boardService.replyContent(idx));
			map.put("reReplyContent", boardService.reReplyContent(idx));
			return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
		}
	}
	
	// 게시글 추천 (트랜잭션)
	@RequestMapping("/board/{allBoard}/{idx}/postlike")
	public int postLike(@PathVariable("idx") String idx) {
		int postLike = 0;
		postLike = boardService.likeCheck(idx);
		
		return postLike;
	}
	
	// 게시글 추천 (아이콘)
	@RequestMapping("/board/{allBoard}/{idx}/postlike/icon")
	public int myPostLikeCheck(@PathVariable("idx") String idx) {
		int myPostLikeCheck = 0;
		myPostLikeCheck = boardService.myPostLikeCheck(idx);
		return myPostLikeCheck;
	}
	
	
	// 새댓글 작성
	@RequestMapping("/board/newreply")
	public ResponseEntity<Map<String, Object>> newReply(@RequestBody HashMap<String,Object> data){

		Map<String, Object> map = new HashMap<String, Object>();		
        String postidx = (String)data.get("postidx");
        String reply = (String)data.get("reply");

        int result = replyservice.newReply(postidx, reply);
        if(result > 0) {
        	map.put("성공", result);
        }else {
        	map.put("실패", result);
        }
		
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		
	}
	
	//답댓글 작성
	@RequestMapping("/board/newrereply")
	public ResponseEntity<Map<String, Object>> newRereply(@RequestBody HashMap<String,Object> data){

		Map<String, Object> map = new HashMap<String, Object>();		
        String postidx = (String)data.get("postidx");
        String parentidx = (String)data.get("parentidx");
        String reply = (String)data.get("reply");
        
        //String postidx, String parentidx, String reply
        int result = replyservice.newRereply(postidx, parentidx, reply);
        if(result > 0) {
        	map.put("성공", result);
        }else {
        	map.put("실패", result);
        }
		
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		
	}
	
	//댓글 삭제
	@DeleteMapping("/board/reply/{replyidx}")
	public  Map<String, Integer> delreply(@PathVariable("replyidx") String replyidx) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map = replyservice.deleteReply(replyidx);
		
		return map;
	}
	
	//파일 삭제
	@DeleteMapping("/board/delete/{idx}/{filename}")
	public int delFile(@PathVariable("idx") String idx,
					   @PathVariable("filename") String fileName) {

		return boardService.fileDelete(idx, fileName);
	}

	/*
	 * // 첨부파일 삭제
	 * 
	 * @delete("/delete/{idx}/{file}") public ResponseEntity<List<File> fileList(){
	 * AwsS3 awsS3 = AwsS3.getInstance();
	 * 
	 * awsS3.delete(key);
	 * 
	 * }
	 */

}
