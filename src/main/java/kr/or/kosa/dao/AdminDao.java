package kr.or.kosa.dao;

import java.util.List;
import java.util.Map;

import kr.or.kosa.dto.Cafeteria;
import kr.or.kosa.dto.DemeritHistory;
import kr.or.kosa.dto.Member;

public interface AdminDao {
	
	// 기숙사생 전체 조회
	
	// 기숙사생 특정 조회
	public List<Member> getMemberInfo(String memberId, String universitycode);
	
	// 기숙사생 검색
	public List<Member> searchMember(Map<String, Object> params);
	// public List<Member> searchMember(@Param("universitycode")String universitycode, @Param("radio")String radio, @Param("search")String search);
	
	// 기숙사생 벌점
	public void insertDemerit(DemeritHistory demerit);
	public void updateDemerit(int demerit2, String memberId);
	
	// 벌점 이력
	public List<DemeritHistory> memberDemeritHistory(String memberId);
	
	// 퇴소 조치
	public void memberGetOut(String memberId);
	
	// 식당 메뉴 조회
	public List<Cafeteria> allMenuList(String universitycode);
	
	
	
	// 시설 조회
	
	// 시설 추가
	
	// 시설 삭제
}