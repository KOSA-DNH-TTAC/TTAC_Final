package kr.or.kosa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosa.dto.Member;

public interface MemberDao {
	
	//회원 전체 정보(같은 학교 기숙사생만 조회)
	public List<Member> getAllMember(String universitycode);
	
	//특정 회원 조회(아이디)
	public Member getMember(String memberid);
	
	//특정 회원 조회(이름)
	public List<Member> getMemberByName(@Param("name")String name, @Param("universitycode")String universitycode);
	
	//정보 수정(마이페이지)
	
	
}
