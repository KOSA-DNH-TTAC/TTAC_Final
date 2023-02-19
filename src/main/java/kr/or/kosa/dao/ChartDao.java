package kr.or.kosa.dao;

import java.sql.SQLException;

import kr.or.kosa.dto.Chart;

public interface ChartDao {

	//마이페이지 통계//////////////
	
	//월별 외박
	public Chart monthSleepover(String memberid) throws ClassNotFoundException, SQLException;
	
	//
	
	
	//관리자 통계//////////////////
	

}
