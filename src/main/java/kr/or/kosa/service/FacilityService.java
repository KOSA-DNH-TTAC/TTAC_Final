package kr.or.kosa.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dao.DomitoryDao;
import kr.or.kosa.dao.FacilityDao;
import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.Facility;
import kr.or.kosa.dto.Report;

@Service
public class FacilityService {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

		
	// 시설물 인서트
	public Integer insertItem(String universitycode, String facilityname) {
		FacilityDao facilityDao = sqlSession.getMapper(FacilityDao.class);
		int  row = facilityDao.insertItem(universitycode, facilityname);
//		if( row >=1) {
//			System.out.println("성공");
//		}
//		System.out.println("row : " + row);
		
		return row;
	}
	
	// 시설물 조회
	public List<Facility> selectItem() {
		FacilityDao facilityDao = sqlSession.getMapper(FacilityDao.class);
		List<Facility>  facList = facilityDao.selectItem();
		
		System.out.println("facList : " + facList);
		
		return facList;
	}
	
	// 기숙사 건물 인서트
	public Integer insertDomitory(String universitycode, String domitoryname, String domitoryfloor) {
		DomitoryDao domitorydao = sqlSession.getMapper(DomitoryDao.class);
		int  row = domitorydao.insertDomitory(universitycode, domitoryname, domitoryfloor);
		
		if( row >=1) {
			System.out.println("성공");
		}
		System.out.println("row : " + row);
		
		return row;
	}
	
	// 건물(동) 조회
	public List<Domitory> selectDomitory(String universityCode, String domitoryname) {
		DomitoryDao domitorydao = sqlSession.getMapper(DomitoryDao.class);
		List<Domitory> domitoryList = domitorydao.selectDomitory(universityCode, domitoryname);

		return domitoryList;
	}
	
	//건물(동),층수,시설뭏 조회
	public List<Domitory> selectAllDomitory() {
		DomitoryDao domitorydao = sqlSession.getMapper(DomitoryDao.class);
		List<Domitory> domitoryList = domitorydao.selectAllDomitory();
			
		return domitoryList;
	}
		
	// 시설물 신고시 회원의 신고 데이터 인서트 
	public Integer insertReport(int facilityidx,String domitoryname, String domitoryfloor, String facilityname, String facilityReport,String memberid) {
		FacilityDao facilityDao = sqlSession.getMapper(FacilityDao.class);
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
		Facility facList = facilityDao.selectReportItem(universityCode, facilityname);
		
		return facList;
	}
	
	// 신고 리스트 불러오기
	public List<Report> selectReport(String domitoryname) {
		FacilityDao facilityDao = sqlSession.getMapper(FacilityDao.class);		
		List<Report> reportList = facilityDao.selectReport(domitoryname);
		return reportList;
	}
	
	// 층별 신고 리스트 불러오기
	public List<Report> search(String domitoryname,String domitoryfloor) {
		FacilityDao facilityDao = sqlSession.getMapper(FacilityDao.class);		
		List<Report> reportList = facilityDao.search(domitoryname, domitoryfloor);
		return reportList;
	}
	
	// 날짜별 신고 리스트 불러오기
	public List<Report> searchDate(String domitoryname,String startdate, String enddate) {
		FacilityDao facilityDao = sqlSession.getMapper(FacilityDao.class);		
		List<Report> reportList = facilityDao.searchDate(domitoryname, startdate, enddate);
		return reportList;
	}

	// 이름별 신고 리스트 불러오기
	public List<Report> likeSearch(String domitoryname,String facilityname) {
		FacilityDao facilityDao = sqlSession.getMapper(FacilityDao.class);		
		List<Report> reportList = facilityDao.likeSearch(domitoryname, facilityname);
		return reportList;
	}

}
