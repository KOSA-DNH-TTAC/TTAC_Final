package kr.or.kosa.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Post;

public interface BoardDao {
	
	// 게시판 이름 (종류)
	public List<Board> categoryList();
	
	// 기본 제공 게시판 글 목록
	public List<Post> allBoardList(String allBoard);
	
	// 커스텀 생성 게시판
	public List<Post> customBoardList(String boardName);
	
	// 게시글 상세보기
	public List<Post> boardContent(String idx);
	
	// 글 작성(파일첨부 x)
	public int boardInsert(Post post) throws ClassNotFoundException, SQLException;
}