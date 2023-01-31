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
	
	public List<Board> getBoardname() {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<Board> boardnameList = boardDao.getBoardname();
		System.out.println("boardnameList: " + boardnameList);
		return boardnameList;
	}
	
	public List<Post> noticeList() {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<Post> noticeList = boardDao.noticeList();
		System.out.println("noticeList: " + noticeList);
		System.out.println("시간: " + noticeList.get(0).getWriteDate());
		
		Date nowDate = new Date();
		System.out.println("nowDate: " + nowDate);
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd");
		SimpleDateFormat simpleDateFormatTime = new SimpleDateFormat("HH:mm");		
		
		for(Post p : noticeList) {
			String formatNowDate = simpleDateFormat.format(nowDate);
			String formatDate = simpleDateFormat.format(p.getWriteDate());
			String formatTime = simpleDateFormatTime.format(p.getWriteDate());
			
			if (formatDate.equals(formatNowDate)) {
				p.setWriteDate(formatTime);
			} else {
				p.setWriteDate(formatDate);
			}
		}
		
		
		
		return noticeList;
	}

}
