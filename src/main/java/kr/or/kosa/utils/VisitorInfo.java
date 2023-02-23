package kr.or.kosa.utils;

import java.util.Date;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;
import kr.or.kosa.security.User;

@Component
public class VisitorInfo {

	
	public Map<String, Object> information(String id, String pwd, Boolean pass) {
		
		Date now = new Date();
		Map<String, Object> map = new HashedMap<>();
		
		if(pass) {
			//로그인 성공자
			map.put("성공", pass);
			map.put("로그인 유저 아이디", id);
			map.put("로그인 시각", now);
			
		}else {
			//로그인 실패자
			map.put("실패", pass);
			map.put("로그인 시도 아이디", id);
			map.put("입력된 비밀번호", pwd);
			map.put("시간", now);
		}
		
		
		return map;
	}
}
