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
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosa.dao.AdminDao;
import kr.or.kosa.dto.Cafeteria;
import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dao.ExcellFileDao;
import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.DemeritHistory;
import kr.or.kosa.dto.Member;
import kr.or.kosa.security.User;
import kr.or.kosa.utils.ExcelUtils;

@Service
public class AdminService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	
	//엑셀
	@Autowired
	ExcelUtils excelUtil;


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
		searchList = adminDao.searchMember(params);

		return searchList;
	}

	// 벌점
	@Transactional(rollbackFor = Exception.class)
	public void memberDemerit(String memberId, String demerit, String demeritReason) {
		AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
		int demerit2 = Integer.parseInt(demerit);
		DemeritHistory result = new DemeritHistory();

		result.setMemberId(memberId);
		result.setDemerit(demerit2);
		result.setDemeritReason(demeritReason);

		System.out.println(result);
		adminDao.insertDemerit(result);
		adminDao.updateDemerit(demerit2, memberId);

	}

	// 벌점 이력 보기
	public List<DemeritHistory> memberDemeritHistory(String memberId) {
		AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
		List<DemeritHistory> demeritHistory = new ArrayList<DemeritHistory>();
		demeritHistory = adminDao.memberDemeritHistory(memberId);

		for (DemeritHistory d : demeritHistory) {
			d.setDemeritDate(d.getDemeritDate().substring(0, 10));
		}
		return demeritHistory;
	}

	// 관리자 게시판 목록 보기
	public List<Board> getBoardList() {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
		List<Board> list = boarddao.getAdminCategory(user.getUniversityCode());
		return list;
	}

	// 관리자 게시판 이름 수정
	public int updateBoard(String boardname, String boardidx) {
		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
		int result = boarddao.updateBoardName(boardname, boardidx);
		return result;
	}

	// 관리자 게시판 생성
	public int createBoard(String boardname) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
		int result = boarddao.newCustomBoard(user.getUniversityCode(), boardname);
		return result;
	}

	// 관리자 게시판 삭제(비활성화)
	public int deleteBoard(String boardidx) {
		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
		int result = boarddao.deleteBoard(boardidx);
		return result;
	}

	// 퇴소 조치
	public void memberGetOut(String memberId) {
		AdminDao adminDao = sqlsession.getMapper(AdminDao.class);
		adminDao.memberGetOut(memberId);
	}
	

	
	//엑셀 파일 읽어와서 memberDto로 만드는...
	public List<Member> addExcel(MultipartFile file) {
		ExcellFileDao excellFileDao = sqlsession.getMapper(ExcellFileDao.class);
		List<Member> memberList = new ArrayList<Member>();
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String universityCode = user.getUniversityCode();
		String domitoryName = user.getDomitoryName();
		System.out.println("domitoryName : "+domitoryName);
		
		// 엑셀의 셀데이터를 가져와서 VO에 담기
		List<Map<String, Object>> listMap = excelUtil.getListData(file, 1, 4); //파일, 시작행, 컬럼 개수
		for (Map<String, Object> map : listMap) {
			Member member = new Member();
			// 각 셀의 데이터를 VO에 set한다.
			member.setEmail((map.get("0").toString()));
			member.setMemberId(map.get("1").toString());
			member.setPassword(map.get("2").toString());
			member.setName(map.get("3").toString());
			memberList.add(member);
		}
		// 리스트에 담은 VO를 DB에 저장
		for (Member m : memberList){
			System.out.println("엑셀에서 읽은 유저 : " + m);
			
			//인서트된 엑셀 데이터 리스트 받아오기 (status = 21)
			List<Member> memberlist = excellFileDao.selectExcellData(universityCode, domitoryName);
			
			
			//여기서 dao 호출... 기존 회원인지 확인 (Count 구해서 0보다 크면 기존 회원)
			//해당 멤버가 이미 회원에 있으면 update (휴면 해제)
			//해당 멤버가 없으면 insert (신규가입)
		}
		return memberList;
	}
	

}
