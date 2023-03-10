package kr.or.kosa.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.AdminChartDao;
import kr.or.kosa.dto.AdminChart;
import kr.or.kosa.security.User;

@Service
public class AdminChartService {
	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	// 월별 외박 통계
	public List<AdminChart> getMontlySleepover(int year) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String universityCode = user.getUniversityCode();
		String domitoryname = user.getDomitoryName();
		AdminChartDao dao = sqlsession.getMapper(AdminChartDao.class);

		AdminChart adminChart = new AdminChart();

		List<AdminChart> list = new ArrayList<AdminChart>();
		adminChart.setDomitoryName(domitoryname);
		adminChart.setUniversityCode(universityCode);
		adminChart.setYear(year);
		try {
			list = dao.adminMonthlySleepover(adminChart);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 월별 사용자 포인트 충전 통계
	public List<AdminChart> getMontlyPoint(int year) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String universityCode = user.getUniversityCode();
		String domitoryname = user.getDomitoryName();
		AdminChartDao dao = sqlsession.getMapper(AdminChartDao.class);

		AdminChart adminChart = new AdminChart();

		List<AdminChart> list = new ArrayList<AdminChart>();
		adminChart.setDomitoryName(domitoryname);
		adminChart.setUniversityCode(universityCode);
		adminChart.setYear(year);
		try {
			list = dao.getMontlyPoint(adminChart);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 월별 커뮤니티
	public List<AdminChart> getMonthlyCommunity(String year) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		AdminChartDao dao = sqlsession.getMapper(AdminChartDao.class);
		List<AdminChart> list = new ArrayList<AdminChart>();
		list = dao.monthlyCommunity(user.getUniversityCode(), year);

		return list;
	}

}
