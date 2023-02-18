package kr.or.kosa.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.kosa.dto.SleepOverHistory;
import kr.or.kosa.security.User;

@Service
public class MypageChartService {
	private SqlSession sqlsession;
	 
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
	   this.sqlsession = sqlsession;
	}
	
	//월별 외박 통계
	public ResponseEntity<Map<String, Object>> getMontlySleepover(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Map map = new HashMap<String, Object>();
		
		List<SleepOverHistory> list;
		
		
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	//월별 결제
	
	//월별 커뮤니티
	
	//월별 벌점
}
