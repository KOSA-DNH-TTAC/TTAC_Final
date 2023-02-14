package kr.or.kosa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

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
	public void updateDemerit(String demerit, String memberid);

	
	
	
	// 시설 조회
	
	// 시설 추가
	
	// 시설 삭제
}