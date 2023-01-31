package kr.or.kosa.dao;

import java.util.List;

import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Post;

public interface BoardDao {
	
	// 게시판 이름 (종류)
	public List<Board> categoryList();
	
	// 공지사항
	public List<Post> noticeList();
	
	// 자유게시판
	public List<Post> freeBoardList();
	
	// 새 게시판
	public List<Post> customBoardList();

}
