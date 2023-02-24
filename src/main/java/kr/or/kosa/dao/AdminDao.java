package kr.or.kosa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.kosa.dto.Cafeteria;
import kr.or.kosa.dto.DemeritHistory;
import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.RollCall;

public interface AdminDao {

	// 기숙사생 특정 조회
	public List<Member> getMemberInfo(String memberId, String universitycode);

	// 기숙사생 검색
	public List<Member> searchMember(Map<String, Object> params);

	// 기숙사생 벌점
	public void insertDemerit(DemeritHistory demerit);
	public void updateDemerit(int demerit2, String memberId);

	// 벌점 이력
	public List<DemeritHistory> memberDemeritHistory(String memberId);

	// 퇴소 조치
	public void memberGetOut(String memberId);

	// 식당 메뉴 조회
	public List<Cafeteria> allMenuList(String universitycode);

	// 일일 점호 회원 조회
	public List<RollCall> getAllRollCallMember(RollCall rollcall);

	// 일일 점호 안한 회원 조회
	public List<Member> getNotRollCall(@Param("date") String date, @Param("universitycode") String universitycode,
			@Param("domitoryname") String domitoryname);

}