package kr.or.kosa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosa.dto.Schedule;

public interface CalendarDao {
	
	//시설물 DB 넣기
	public int insertcalendar(@Param("universitycode")String universitycode, @Param("scheduledate")String scheduledate, @Param("scheduletitle")String scheduletitle, @Param("schedulecontent")String schedulecontent, @Param("domitoryname")String domitoryname);
	
	//스케줄 리스트 받아오기
	public List<Schedule> selectCalendar(@Param("universityCode")String universityCode, @Param("domitoryName")String domitoryName);

	//일정삭제
	public int updateCalecdar(int idx);
	
	//월별 데이터 가져오기
	public List<Schedule> monthPrint(@Param("universityCode")String universityCode, @Param("domitoryName")String domitoryName, @Param("start")String start, @Param("end")String end);
}