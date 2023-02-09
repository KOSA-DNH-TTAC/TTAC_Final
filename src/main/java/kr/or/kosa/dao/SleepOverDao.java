package kr.or.kosa.dao;

import kr.or.kosa.dto.SleepOver;
import kr.or.kosa.dto.SleepOverTime;

public interface SleepOverDao {
	
	//외박 신청(insert)
	public int insertSleepOver(SleepOver over);
	
	//외박 수정(update) : 사감이 승인을 했을 경우
	public int updateSleepOver(SleepOver over);
	
	//외박 신청 가능 시간
	public SleepOverTime getSleepOverTime(String universitycode);
}
