package kr.or.kosa.dao;

import java.util.List;

import kr.or.kosa.dto.DemeritHistory;
import kr.or.kosa.dto.Member;

public interface AdminDao {
	
	//기숙사생 전체 조회
	
	//기숙사생 특정 조회
	public List<Member> getMemberInfo(String memberId, String universitycode);
	
	// 기숙사생 벌점
	public void setDemerit(DemeritHistory demerit);
	
	//처리되지 않은 외박 신청 조회
	
	//처리된 외박 신청 내역 조회
	
	//시설 조회
	
	//시설 추가
	
	//시설 삭제
}