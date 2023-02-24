package kr.or.kosa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosa.dto.AdminChart;

public interface AdminChartDao {

	// 년도별 월별 외박
	public List<AdminChart> adminMonthlySleepover(AdminChart adminchart);

	// 월별 결제
	public List<AdminChart> getMontlyPoint(AdminChart adminchart);

	// 월별 커뮤니티
	public List<AdminChart> monthlyCommunity(@Param("universitycode") String universitycode,
			@Param("year") String year);

}
