package kr.or.kosa.service;

import java.text.SimpleDateFormat;
import java.util.Date;
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
		System.out.println("categoryList: " + categoryList);
		return categoryList;
	}
	
	// 공지사항 목록
	public List<Post> noticeList() {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<Post> noticeList = boardDao.noticeList();
		
		Date nowDate = new Date();
	
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
		String formatNowDate = simpleDateFormat.format(nowDate);
		
		for(Post p : noticeList) {
			String writedate = p.getWriteDate().substring(0, 10);
			if (formatNowDate.equals(writedate)) {
				p.setWriteDate(p.getWriteDate().substring(11, 16));
			} else {
				p.setWriteDate(writedate.substring(5));
			}
		}
		return noticeList;
	}
	
	// 자유게시판 목록
	public List<Post> freeBoardList() {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<Post> freeBoardList = boardDao.freeBoardList();
		
		Date nowDate = new Date();
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
		String formatNowDate = simpleDateFormat.format(nowDate);
		
		for(Post p : freeBoardList) {
			String writedate = p.getWriteDate().substring(0, 10);
			if (formatNowDate.equals(writedate)) {
				p.setWriteDate(p.getWriteDate().substring(11, 16));
			} else {
				p.setWriteDate(writedate.substring(5));
			}
		}
		return freeBoardList;
	}
	
	// 새 게시판 목록
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

}
