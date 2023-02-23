package kr.or.kosa.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;
import kr.or.kosa.security.User;

@Component
public class VisitorInfo {

	@Autowired
	MemberDao dao;
	
	
	public User information(User user) {
//		Member member = dao.getMember(memberid);
		System.out.println("쒯!!");
		return user;
	}
}
