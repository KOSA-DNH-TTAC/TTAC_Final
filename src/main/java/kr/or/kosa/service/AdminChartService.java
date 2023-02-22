package kr.or.kosa.service;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.AdminChartDao;
import kr.or.kosa.dao.ChartDao;
import kr.or.kosa.dto.AdminChart;
import kr.or.kosa.dto.Chart;
import kr.or.kosa.security.User;

@Service
public class AdminChartService {
	private SqlSession sqlsession;
//	private AdminChart adminchart;
	 
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
	   this.sqlsession = sqlsession;
	}
	
	//월별 외박 통계
	public List<AdminChart> getMontlySleepover(int year){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String universityCode = user.getUniversityCode();
		String domitoryname = user.getDomitoryName();
		AdminChartDao dao = sqlsession.getMapper(AdminChartDao.class);
		
		AdminChart adminChart = new AdminChart();
		
		System.out.println("기숙사" + domitoryname);
		
		List<AdminChart> list = new ArrayList<AdminChart>();
		adminChart.setDomitoryName(domitoryname);
		adminChart.setUniversityCode(universityCode);
		adminChart.setYear(year);
		try {
			list = dao.adminMonthlySleepover(adminChart);
			System.out.println("list : "+list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//월별 외박 통계
		public List<AdminChart> getMontlyPoint(int year){
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String universityCode = user.getUniversityCode();
			String domitoryname = user.getDomitoryName();
			AdminChartDao dao = sqlsession.getMapper(AdminChartDao.class);
			
			AdminChart adminChart = new AdminChart();
			
			System.out.println("기숙사" + domitoryname);
			
			List<AdminChart> list = new ArrayList<AdminChart>();
			adminChart.setDomitoryName(domitoryname);
			adminChart.setUniversityCode(universityCode);
			adminChart.setYear(year);
			try {
				list = dao.adminMonthlySleepover(adminChart);
				System.out.println("list : "+list);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
}
