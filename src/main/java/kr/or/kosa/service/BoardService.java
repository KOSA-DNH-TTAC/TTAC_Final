package kr.or.kosa.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dao.FacilityDao;
import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.File;
import kr.or.kosa.dto.Post;
import kr.or.kosa.dto.Reply;
import kr.or.kosa.dto.RollCall;
import kr.or.kosa.security.User;

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

		for (Post p : allBoardList) {
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

		for (Post p : customBoardList) {
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
	public List<Post> boardContent(String idx) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<Post> boardContent = boardDao.boardContent(idx);

		boardContent.get(0).setWriteDate(boardContent.get(0).getWriteDate().substring(2, 16));

		return boardContent;
	}

	// 댓글 목록 보기
	public List<Reply> replyContent(String idx) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<Reply> replyContent = boardDao.replyContent(idx);

		Date nowDate = new Date();

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
		String formatNowDate = simpleDateFormat.format(nowDate);

		for (Reply r : replyContent) {
			String replyDate = r.getReplyDate().substring(0, 10);
			if (formatNowDate.equals(replyDate)) {
				r.setReplyDate(r.getReplyDate().substring(11, 16));
			} else {
				r.setReplyDate(replyDate.substring(5));
			}
		}
		return replyContent;
	}

	// 대댓글 목록 보기
	public List<Reply> reReplyContent(String replyIdx) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<Reply> reReplyContent = boardDao.reReplyContent(replyIdx);

		Date nowDate = new Date();

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
		String formatNowDate = simpleDateFormat.format(nowDate);

		for (Reply r : reReplyContent) {
			String replyDate = r.getReplyDate().substring(0, 10);
			if (formatNowDate.equals(replyDate)) {
				r.setReplyDate(r.getReplyDate().substring(11, 16));
			} else {
				r.setReplyDate(replyDate.substring(5));
			}
		}
		return reReplyContent;
	}

	// 자유게시판 글쓰기
	public int freeBoardWrite(Post post) {

		int result = 0;

		try {
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			result = boardDao.boardInsert(post);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 파일첨부 글쓰기
	public int fileWrite(File file) {

		int result = 0;

		try {
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			result = boardDao.fileInsert(file);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 점호 위치값 비교하기
	public String eveningCall(double lat, double lon) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		System.out.println("서비스 옴?");
		Domitory domitory = boardDao.eveningCall(lat, lon);
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//String unicode = user.getDomitoryName;
		System.out.println("domitory: " + domitory);
		double domitoryLat = domitory.getDomitoryLatitude();
		double domitoryLon = domitory.getDomitoryLogitude();

		String alert = "SUCCESS";
		if (!((domitoryLat - lat) < 0.005)) {
			alert = "FAIL";
		}
		if (!((domitoryLon - lon) < 0.005)) {
			alert = "FAIL";
		}

		return alert;
	}

	// 점호완료시 DB에 회원 점호데이터 인서트
			public String eveningCallInsert(String memberid, String universitycode) {
				BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
				System.out.println("memberid 서비스 옴?");
				int  rollcall = boardDao.eveningCallInsert(memberid, universitycode);

				if( rollcall >=1) {
					System.out.println("성공");
				}
				System.out.println("rollcall : " + rollcall);

				return null;
			}
		
		// 점호완료시 DB에 회원 점호데이터 인서트
		public String eveningCallCompare(String memberid, String universitycode, String rollcalldate) {
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			System.out.println("Camopare 서비스 옴?");
			RollCall  rollcall = boardDao.eveningCallCompare(memberid, universitycode, rollcalldate);
			String unicode = rollcall.getUniversityCode();
			String date = rollcall.getRollCallDate();
			String dbmemberid = rollcall.getMemberId();
			
			System.out.println("date : "+date);
			System.out.println("unicode : "+unicode);
			System.out.println("dbmemberid : "+ dbmemberid);
			
			String result = "SUCCESS"; 
			System.out.println("점호한 회원데이터 : "+memberid+"/"+universitycode +"===="+ "DB에서 가져온 비교데이터 : "+ dbmemberid+"/"+unicode);
			//조회된데이터 없으면
//			if(rollcall == null) {
//				result = "SUCCESS";
//			}
			if(memberid.equals(dbmemberid) && unicode.equals(universitycode) && date.equals(rollcalldate)) {
				System.out.println("이미 DB에 "+memberid+" 회원의 데이터 있음");
				result = "FAIL";
			}
			System.out.println("DB에서 받아온 점호 데이터 : " + rollcall);
			
			return result;
		}
	

}
