package kr.or.kosa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosa.dto.Facility;
import kr.or.kosa.dto.Report;

public interface FacilityDao {

	// 시설물 DB 넣기
	public int insertItem(String universitycode, String facilityname);

	// 리스트 받아오기
	public List<Facility> selectItem();

	// 시설물 신고 인서트
	public int insertReport(@Param("facilityidx") int facilityidx, @Param("domitoryname") String domitoryname,
			@Param("domitoryfloor") String domitoryfloor, @Param("facilityname") String facilityname,
			@Param("facilityReport") String facilityReport, @Param("memberid") String memberid);

	// 특정 시설물 조회
	public Facility selectReportItem(String universityCode, String facilityname);

	// 신고 리스트 조회
	public List<Report> selectReport(String domitoryname);

	// 층별 신고 리스트 조회
	public List<Report> search(String domitoryname, String domitoryfloor);

	// 날짜별 신고 리스트 조회
	public List<Report> searchDate(String domitoryname, String startdate, String enddate);

	// 날짜별 신고 리스트 조회
	public List<Report> likeSearch(String domitoryname, String facilityname);

}