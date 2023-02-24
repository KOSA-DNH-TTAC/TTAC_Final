package kr.or.kosa.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.CalendarDao;
import kr.or.kosa.dto.Cafeteria;
import kr.or.kosa.dto.Schedule;

@Service
public class calendarService {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// DB에 연간일정 인서트
	public List<Schedule> insertcalendar(String universitycode, String scheduledate, String scheduletitle,
			String schedulecontent, String domitoryname) {
		CalendarDao calendarDao = sqlSession.getMapper(CalendarDao.class);
		int row = calendarDao.insertcalendar(universitycode, scheduledate, scheduletitle, schedulecontent,
				domitoryname);

		// 연간일정 목록 불러오기
		List<Schedule> list = this.selectCalendar(universitycode, domitoryname);

		return list;
	}

	// 시설물 조회
	public List<Schedule> selectCalendar(String universitycode, String domitoryname) {
		CalendarDao calendarDao = sqlSession.getMapper(CalendarDao.class);
		List<Schedule> list = calendarDao.selectCalendar(universitycode, domitoryname);

		return list;
	}

	// 외박 수정(update) : 사감이 승인을 했을 경우
	public int updateCalecdar(int idx) {
		int result = 0;

		CalendarDao calendarDao = sqlSession.getMapper(CalendarDao.class);
		result = calendarDao.updateCalecdar(idx);

		return result;
	}

	// 시설물 조회
	public List<Schedule> monthPrint(String universitycode, String domitoryname, String start, String end) {
		CalendarDao calendarDao = sqlSession.getMapper(CalendarDao.class);
		List<Schedule> list = calendarDao.monthPrint(universitycode, domitoryname, start, end);

		return list;
	}

}
