package kr.or.kosa.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dao.FacilityDao;
import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.Facility;

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
	
	//건물(동),층수,시설뭏 조회
		public List<Domitory> selectfacility() {
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			System.out.println("건물(동) 셀렉트 서비스 옴?");
			List<Domitory> domitoryList = boardDao.selectDomitory();
			System.out.println("서비스는 여기까지 도는데 왜 실행이 안되지;");
			System.out.println("domitoryList : " + domitoryList);
			
			return domitoryList;
		}
		
	// 시설물 신고시 회원의 신고 데이터 인서트 
	public Integer insertReport(int facilityidx,String facilityname, String domitoryname, String domitoryfloor, String facilityReport,String memberid) {
		FacilityDao facilityDao = sqlSession.getMapper(FacilityDao.class);
		System.out.println("시설물 신고 데이터 인서트 서비스 옴?");
		int  row = facilityDao.insertReport(facilityidx, domitoryname, domitoryfloor,facilityname,memberid,facilityReport);
		if( row >=1) {
			System.out.println("성공");
		}
		System.out.println("row : " + row);
		
		return row;
	}
	
	// where문 특정 시설물 조회
	public Facility selectReportItem(String universityCode, String facilityname) {
		FacilityDao facilityDao = sqlSession.getMapper(FacilityDao.class);
		System.out.println("특정 시설물 셀렉트 서비스 옴?");
		Facility facList = facilityDao.selectReportItem(universityCode, facilityname);
		
		System.out.println("facList : " + facList);
		
		return facList;
	}

}
