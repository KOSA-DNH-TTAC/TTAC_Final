package kr.or.kosa.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.kosa.dto.Chart;

public interface ChartDao {

	// 마이페이지 통계//////////////

	// 월별 외박
	public List<Chart> monthlySleepover(String memberid) throws ClassNotFoundException, SQLException;

	// 월별 결제
	public List<Chart> monthlyPayment(String memberid);

	// 월별 커뮤니티
	public List<Chart> monthlyCommunity(String memberid);

	// 월별 벌점
	public List<Chart> monthlyDemerit(String memberid);
}
