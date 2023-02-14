package kr.or.kosa.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.AdminDao;
import kr.or.kosa.dto.Member;
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
		
		System.out.println("뭐해");
		
		System.out.println("memberId: " + memberId);
		infoList = adminDao.getMemberInfo(memberId, user.getUniversityCode());
		System.out.println("adminservice: " + infoList);
		
		return infoList;
	}

}
