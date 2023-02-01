package kr.or.kosa.security;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;
import kr.or.kosa.service.MemberService;

public class CustomUserDetailService implements UserDetailsService {
	
	@Autowired
	MemberDao dao;
	
	@Override
	public UserDetails loadUserByUsername(String memberid) throws UsernameNotFoundException {
		
		Member dto = dao.getMember(memberid);
//		System.out.println("queried by memberdao : " + dto);
		System.out.println("로그인 된 아이디 : " + dto);
		
		return dto == null ? null : new CustomUser(dto);
	}

}