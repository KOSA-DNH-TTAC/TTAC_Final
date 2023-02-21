package kr.or.kosa.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.kosa.dto.AdminChart;

public interface AdminChartDao {

	//마이페이지 통계//////////////
	
	//년도별 월별 외박
	public List<AdminChart> adminMonthlySleepover(String year, String universityCode, String domitoryName) throws ClassNotFoundException, SQLException;
	
	//월별 결제
	//public List<AdminChart> monthlyPayment(String memberid);
	
	//월별 커뮤니티
	//public List<AdminChart> monthlyCommunity(String memberid);
	
	//월별 벌점
	//public List<AdminChart> monthlyDemerit(String memberid);
	
	
	//관리자 통계//////////////////
	

}
