package kr.or.kosa.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dao.FacilityDao;
import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.Facility;
import kr.or.kosa.dto.File;
import kr.or.kosa.dto.Post;
import kr.or.kosa.dto.Reply;
import kr.or.kosa.dto.RollCall;

@Service
public class FacilityService {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

		
	// 점호완료시 DB에 회원 점호데이터 인서트
	public Integer insertItem(String universitycode, String facilityname) {
		FacilityDao facilityDao = sqlSession.getMapper(FacilityDao.class);
		System.out.println("시설물 인서트 서비스 옴?");
		int  row = facilityDao.insertItem(universitycode, facilityname);
		
		if( row >=1) {
			System.out.println("성공");
		}
		System.out.println("row : " + row);
		
		return row;
	}
	
	// 시설물 조회
	public List<Facility> selectItem() {
		FacilityDao facilityDao = sqlSession.getMapper(FacilityDao.class);
		System.out.println("시설물 셀렉트 서비스 옴?");
		List<Facility>  facList = facilityDao.selectItem();
		
		System.out.println("facList : " + facList);
		
		return facList;
	}
	
	// 기숙사 건물 인서트
	public Integer insertDomitory(String universitycode, String domitoryname, String domitoryfloor) {
		FacilityDao facilityDao = sqlSession.getMapper(FacilityDao.class);
		System.out.println("시설물 인서트 서비스 옴?");
		int  row = facilityDao.insertDomitory(universitycode, domitoryname, domitoryfloor);
		
		if( row >=1) {
			System.out.println("성공");
		}
		System.out.println("row : " + row);
		
		return row;
	}
	
	// 건물(동) 조회
	public List<Domitory> selectDomitory() {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		System.out.println("건물(동) 셀렉트 서비스 옴?");
		List<Domitory> domitoryList = boardDao.selectDomitory();
		System.out.println("서비스는 여기까지 도는데 왜 실행이 안되지;");
		System.out.println("domitoryList : " + domitoryList);
		
		return domitoryList;
	}

}
