package kr.or.kosa.dao;

import java.util.List;

import kr.or.kosa.dto.Board;

public interface BoardDao {
	
	// 게시판 이름 (종류)
	public List<Board> getBoardname();

}
