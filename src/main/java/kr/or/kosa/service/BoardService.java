package kr.or.kosa.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Post;

@Service
public class BoardService {
	
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 게시판 리스트
	public List<Board> categoryList() {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<Board> categoryList = boardDao.categoryList();
		return categoryList;
	}

	
	// 기본 제공 게시판 글 목록
		public List<Post> allBoardList(String allBoard) {
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			List<Post> allBoardList = boardDao.allBoardList(allBoard);
			Date nowDate = new Date();
		
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
			String formatNowDate = simpleDateFormat.format(nowDate);
			
			for(Post p : allBoardList) {
				String writedate = p.getWriteDate().substring(0, 10);
				if (formatNowDate.equals(writedate)) {
					p.setWriteDate(p.getWriteDate().substring(11, 16));
				} else {
					p.setWriteDate(writedate.substring(5));
				}
			}
			return allBoardList;
		}	
	
	// 커스텀 생성 게시판 목록
	public List<Post> customBoardList(String boardName) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<Post> customBoardList = boardDao.customBoardList(boardName);
		
		Date nowDate = new Date();
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
		String formatNowDate = simpleDateFormat.format(nowDate);
		
		for(Post p : customBoardList) {
			String writedate = p.getWriteDate().substring(0, 10);
			if (formatNowDate.equals(writedate)) {
				p.setWriteDate(p.getWriteDate().substring(11, 16));
			} else {
				p.setWriteDate(writedate.substring(5));
			}
		}
		return customBoardList;
	}
	
	// 게시글 상세보기
	public List<Post> boardContent(int idx) {
		
		System.out.println("서비스 진입");
		
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<Post> boardContent = boardDao.boardContent(idx);
		System.out.println(boardContent);
		return boardContent;
	}
	
	// 자유게시판 글쓰기
	public int freeBoardWrite(Post post) {
		
		int result = 0;
		
		try {
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			result = boardDao.boardInsert(post);
			
			System.out.println("");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
