package kr.or.kosa.utils;

import java.util.Date;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
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
	
	
	public Map<User, Date> information(User user) {
//		Member member = dao.getMember(memberid);
		Date now = new Date();
		Map<User, Date> map = new HashedMap<User, Date>();
		map.put(user, now);
		
		return map;
	}
}
