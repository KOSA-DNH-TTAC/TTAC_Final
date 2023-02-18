package kr.or.kosa.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;

@Service
public class CommonService {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

//  비밀번호 찾기 (초기화) 인증번호 대조
	public Member compareNum(Map<String, String>persnalNum, int checkNum, String email) {
		System.out.println("회원인증번호 대조 서비스 옴?");
		System.out.println("보낸 인증번호 checknum : "+checkNum);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		Member member = memberDao.getEmail(email); //회원이 입력한 이메일이 유효한지 체크
		String memberemail = member.getEmail();
		
		//Map에 회원의 이메일 정보가 Key로 있는지 True / False
		boolean result = persnalNum.containsKey(memberemail); //true or false
		System.out.println("result : "+result);
		String alert="";
		
		//Map에 회원정보가 있는지 없는 지 1차 검증
		if(result == false) {
			System.out.println("에러 : Map에 회원 정보 없음");
			alert = "에러 : Map에 회원 정보가 없습니다.";
			
		//Map에 회원정보가 있으면 로직 수행
		} else if(result == true) {
			System.out.println("성공 : Map에 회원 정보 있음");
			String memberNum  = persnalNum.get(email);
			System.out.println("memberNum : "+memberNum);
			int Num = Integer.parseInt(memberNum);
			
			//인증번호와 회원이 입력한 번호가 같은지?
			if(Num == checkNum) {
				alert = "번호가 일치합니다.";
				System.out.println("결과 : "+alert);
			} else {
				alert = "번호가 불일치합니다.";
				System.out.println("결과 : "+alert);
			}
		}
		//이메일로 찾은 회원정보 row의 비밀번호 초기화
		memberDao.insertPassword(memberemail);
		
		Member member1 = memberDao.getEmail(email);
		
		return member1;
	}
	
	public int insertPassword(String memberemail) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		int result = memberDao.insertPassword(memberemail);
		System.out.println("password 초기화된 member : "+result);
		
		return result;
	}
		
	
}
