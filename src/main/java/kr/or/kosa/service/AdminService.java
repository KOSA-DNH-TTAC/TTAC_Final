package kr.or.kosa.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.kosa.dao.AdminDao;
import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.DemeritHistory;
import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.Reply;
import kr.or.kosa.security.User;

@Service
public class AdminService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	// 아이디 회원 조회
	public List<Member> memberInfo(String memberId) {
		List<Member> infoList = new ArrayList<Member>();
		AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		infoList = adminDao.getMemberInfo(memberId, user.getUniversityCode());

		return infoList;
	}
	
	// 기숙사생 검색
	public List<Member> searchMember(String radio, String search) {
		AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
		List<Member> searchList = new ArrayList<Member>();
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Map<String, Object> params = new HashMap<>();
		params.put("param1", user.getUniversityCode());
		params.put("param2", radio);
		params.put("param3", search);
		
		System.out.println(params);
		
		searchList = adminDao.searchMember(params);
		
		return searchList;
	}
	
	// 벌점
	@Transactional(rollbackFor = Exception.class)
	public void memberDemerit(DemeritHistory demeritHistory, String demerit, String memberid) {
		AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
		
		DemeritHistory result = new DemeritHistory();
		adminDao.insertDemerit(demeritHistory);
		adminDao.updateDemerit(demerit, memberid);
		
	}
	
	// 벌점 이력 보기
	public List<DemeritHistory> memberDemeritHistory(String memberId) {
		AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
		System.out.println("?");
		List<DemeritHistory> demeritHistory = new ArrayList<DemeritHistory>();
		demeritHistory = adminDao.memberDemeritHistory(memberId);
		
		for (DemeritHistory d : demeritHistory) {
			d.setDemeritDate(d.getDemeritDate().substring(0, 10));
		}
		
		System.out.println("Service: " + demeritHistory);
		return demeritHistory;
	}
	
	//관리자 게시판 목록 보기
	public List<Board> getBoardList(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
		List<Board> list = boarddao.getAdminCategory(user.getUniversityCode());
		return list;
	}
	
	//관리자 게시판 이름 수정
	public int updateBoard(String boardname, String boardidx) {
		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
		int result = boarddao.updateBoardName(boardname, boardidx);
		return result;
	}
	
	//관리자 게시판 생성
	public int createBoard(String boardname) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
		int result = boarddao.newCustomBoard(user.getUniversityCode(), boardname);
		return result;
	}
	
	//관리자 게시판 삭제(비활성화)
	public int deleteBoard(String boardidx) {
		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
		int result = boarddao.deleteBoard(boardidx);
		return result;
	}
}
