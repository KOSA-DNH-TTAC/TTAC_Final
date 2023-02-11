package kr.or.kosa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosa.dto.SleepOver;
import kr.or.kosa.dto.SleepOverHistory;
import kr.or.kosa.dto.SleepOverTime;

public interface SleepOverDao {
	
	//외박 신청(insert)
	public int insertSleepOver(SleepOver over);
	
	//외박 수정(update) : 사감이 승인을 했을 경우
	public int confirmSleepOver(int idx);
	
	//외박 신청 가능 시간 구하기
	public SleepOverTime getSleepOverTime(String universitycode);
	
	//오늘자 외박 신청 조회
	public List<SleepOver> getTodaysSleepOver(String universitycode);

	public List<SleepOverHistory> getTodayHistory(String universitycode);
	
	//외박신청이력 조회
	public List<SleepOverHistory> getSleepOverHistory(String universitycode);
	
	//외박 기간별 검색
	//오늘자 외박 현황 조회(승인된 외박) : startdate = "TODAY"
	public List<SleepOverHistory> searchHistoryWithDate(@Param("startdate")String startdate, @Param("enddate")String enddate, @Param("universitycode")String universitycode);
	
}
