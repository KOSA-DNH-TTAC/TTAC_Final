package kr.or.kosa.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;

@Service
public class MemberService {
	
	private SqlSession sqlsession;
	 
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
	   this.sqlsession = sqlsession;
	}
	
	
	//전체회원조회
	public List<Member> getAllMember(String universitycode){
		List<Member> list = new ArrayList<Member>();
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		list = dao.getAllMember(universitycode);
		return list;
	}
	
	//특정회원 조회에선 auth를 따로 넣지 않았음 필요시 resultmap으로 매퍼에서 구현해야함
	//특정회원조회 (학번으로)
	public Member getMemberById(String memberid) {
		Member member = new Member();
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		member = dao.getMember(memberid);
		return member;
	}
	//특정회원조회 (이름으로)
	public List<Member> getMemberByName(String name, String universitycode) {
		List<Member> list = new ArrayList<Member>();
		//이름으로 검색을 했을 때, 해당 유저가 속한 학교의 동명이인만 나와야 함
		//이 학교 코드는 어디서 넣는게 바람직할지 모르겠음
		//일단 생각해둔건 컨트롤러에서 principal로 유저 정보 받아와서 그 유저의 학교코드 넣는거
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		list = dao.getMemberByName(name, universitycode);
		return list;
	}
}
