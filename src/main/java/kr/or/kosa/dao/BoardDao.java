package kr.or.kosa.dao;

import java.util.List;

import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Post;

public interface BoardDao {
	
	// 게시판 이름 (종류)
	public List<Board> categoryList();
	
	// 기본 제공 게시판 글 목록
	public List<Post> allBoardList(String allBoard);
	
	// 공지사항
	public List<Post> noticeList();
	
	// 건의사항
	public List<Post> opinionList();
	
	// 자유게시판
	public List<Post> freeBoardList();
	
	// 거래게시판
	public List<Post> productBoardList();
	
	// 커스텀 생성 게시판
	public List<Post> customBoardList(String boardName);

}
