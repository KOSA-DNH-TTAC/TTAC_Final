package kr.or.kosa.security;

import java.util.HashSet;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.MemberAuth;
import kr.or.kosa.service.MemberService;

@Service
public class CustomUserDetailService implements UserDetailsService {
	
	@Autowired
	MemberDao dao;
	
	@Override
	public UserDetails loadUserByUsername(String memberid) throws UsernameNotFoundException {
		
		Member dto = dao.getMember(memberid);
		
		if(dto == null) {
			throw new UsernameNotFoundException("Invalid User");
		}
		
//		System.out.println("queried by memberdao : " + dto);
		System.out.println("아이디 : " + dto);
		 Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		for(MemberAuth a : dto.getAuthList()) {
			grantedAuthorities.add(new SimpleGrantedAuthority(a.getAuth()));
		}
		User user = new User(dto, grantedAuthorities);
		System.out.println(user.toString());
//		return dto == null ? null : new CustomUser(dto);
		return user;
	}

}