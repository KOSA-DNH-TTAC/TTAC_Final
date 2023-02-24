package kr.or.kosa.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosa.dao.AdminDao;
import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dao.ExcellFileDao;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.DemeritHistory;
import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.RollCall;
import kr.or.kosa.security.User;
import kr.or.kosa.utils.ExcelUtils;

@Service
public class AdminService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	// 암호화
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// 엑셀
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

	// 엑셀 파일 읽어와서 memberDto로 만드는...
	public List<Member> addExcel(MultipartFile file) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ExcellFileDao dao = sqlsession.getMapper(ExcellFileDao.class);
		List<Member> memberList = new ArrayList<Member>();

		// 관리자의 학교 코드
		String universityCode = user.getUniversityCode();

		// 엑셀의 셀데이터를 가져와서 DTO에 담기
		List<Map<String, Object>> listMap = excelUtil.getListData(file, 1, 9); // 파일, 시작행, 컬럼 개수

		for (Map<String, Object> map : listMap) {
			Member member = new Member();
			// 각 셀의 데이터를 DTO에 set한다.
			member.setMemberId(map.get("0").toString());
			member.setName(map.get("1").toString());
			member.setMajor(map.get("2").toString());
			member.setEmail(map.get("3").toString());
			member.setGender(map.get("4").toString());
			member.setPhone(map.get("5").toString());
			member.setParentsPhone(map.get("6").toString());
			member.setDomitoryName(map.get("7").toString());
			member.setRoom(map.get("8").toString());

			member.setUniversityCode(universityCode);

			memberList.add(member);
		}
		// 리스트에 담은 VO를 DB에 저장
		for (Member m : memberList) {
			// 여기서 dao 호출... 기존 회원인지 확인 (Count 구해서 0보다 크면 기존 회원)
			int count = 0;
			count = dao.CountMember(m.getMemberId());

			if (count > 0) {
				// 해당 멤버가 이미 회원에 있으면 update (휴면 해제)
				m.setNewjoin("N");

			} else {
				// 해당 멤버가 없으면 insert (신규가입) (비밀번호 암호화해서)
				String rawpwd = "1004";
				String pwd = bCryptPasswordEncoder.encode(rawpwd);
				m.setNewjoin("Y");
			}

		}
		return memberList;
	}

	@Transactional(rollbackFor = Exception.class)
	public String updateNewSemester(List<Member> list) {
		ExcellFileDao dao = sqlsession.getMapper(ExcellFileDao.class);

		int length = list.size();
		int insertcount = 0;
		int updatecount = 0;

		for (Member m : list) {
			int count = 0;
			count = dao.CountMember(m.getMemberId());

			if (count > 0) {
				int temp = dao.updateActivate(m.getMemberId(), m.getDomitoryName(), m.getRoom());
				updatecount += temp;

			} else {
				// 해당 멤버가 없으면 insert (신규가입) (비밀번호 암호화해서)
				String rawpwd = "1004";
				String pwd = bCryptPasswordEncoder.encode(rawpwd);
				m.setPassword(pwd);

				int temp = dao.insertExcellData(m);
				insertcount += temp;
			}
		}
		String result = "성공";
		int total = insertcount + updatecount;

		return result;
	}

	// 학기말 전체 휴면
	public void updateDeactivate() {
		ExcellFileDao dao = sqlsession.getMapper(ExcellFileDao.class);
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String universityCode = user.getUniversityCode();
		String domitoryName = user.getDomitoryName();
		dao.updateDeactivate(universityCode, domitoryName);
	}

	// 일일 점호한 회원조회
	public List<RollCall> getAllRollCallMember(String universitycode, String domitoryName, String rollCallDate) {
		List<RollCall> list = new ArrayList<RollCall>();
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		RollCall rollCall = new RollCall();
		rollCall.setDomitoryName(domitoryName);
		rollCall.setUniversityCode(universitycode);
		rollCall.setRollCallDate(rollCallDate);
		list = dao.getAllRollCallMember(rollCall);
		return list;
	}

	// 일일 점호 안한 놈
	public List<Member> getNotRollCall(String universitycode, String domitoryName, String rollCallDate) {
		List<Member> list = new ArrayList<Member>();
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		list = dao.getNotRollCall(rollCallDate, universitycode, domitoryName);
		return list;
	}

}
