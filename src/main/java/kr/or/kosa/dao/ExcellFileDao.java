package kr.or.kosa.dao;

import java.util.List;

import kr.or.kosa.dto.Member;

public interface ExcellFileDao {
	
	//새학기 회원 엑셀 데이터 DB 넣기
	public int insertExcellData(Member member);
	
	//인서트된 엑셀 데이터 리스트 받아오기
	public List<Member> selectExcellData(String universityCode, String domitoryName);

	//회원 상태값 업데이트 (일괄 휴면)
	public int updateDeactivate(String universityCode, String domitoryName);
	
	//회원 상태값 업데이트 (기가입회원 상태값 활성화)
	public int updateActivate(String memberId);

	//회원 아이디가 테이블에 있는지 확인
	public int CountMember(String memberId);
}