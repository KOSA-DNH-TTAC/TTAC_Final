package kr.or.kosa.dao;

import java.util.List;

import kr.or.kosa.dto.Facility;

public interface FacilityDao {
	
	//시설물 DB 넣기
	public int insertItem(String universitycode, String facilityname);
	
	//시설물 DB 넣기
	public int insertDomitory(String universitycode, String domitoryname, String domitoryfloor);
	
	// 기본 제공 게시판 글 목록
	public List<Facility> selectItem();
	
//	//점호데이터 넣기
//	public int eveningCallInsert(String memberId, String universitycode);
//	
//	//점호 데이터 중복 체킹
//	public RollCall eveningCallCompare(String memberId, String universitycode);
}