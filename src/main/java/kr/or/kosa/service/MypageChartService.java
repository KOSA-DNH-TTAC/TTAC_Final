package kr.or.kosa.service;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.ChartDao;
import kr.or.kosa.dto.Chart;
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
	public List<Chart> getMontlySleepover(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ChartDao dao = sqlsession.getMapper(ChartDao.class);
		List<Chart> list = new ArrayList<Chart>();
		try {
			list = dao.monthlySleepover(user.getMemberId());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//월별 결제
	public List<Chart> getMonthlyPayments(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		ChartDao dao = sqlsession.getMapper(ChartDao.class);
		List<Chart> list = new ArrayList<Chart>();
		list = dao.monthlyPayment(user.getMemberId());
		
		return list;
	}
	
	//월별 커뮤니티
	public List<Chart> getMonthlyCommunity(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		ChartDao dao = sqlsession.getMapper(ChartDao.class);
		List<Chart> list = new ArrayList<Chart>();
		list = dao.monthlyCommunity(user.getMemberId());
		
		return list;
	}
	
	//월별 벌점
	public List<Chart> getMonthlyDemerit(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		ChartDao dao = sqlsession.getMapper(ChartDao.class);
		List<Chart> list = new ArrayList<Chart>();
		list = dao.monthlyDemerit(user.getMemberId());
		
		return list;
	}
}
