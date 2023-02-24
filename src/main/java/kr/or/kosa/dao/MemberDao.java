package kr.or.kosa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.Post;
import kr.or.kosa.dto.RollCall;
import kr.or.kosa.security.User;

public interface MemberDao {

	// 회원 전체 정보(같은 학교 기숙사생만 조회)
	public List<Member> getAllMember(String universitycode);

	// 특정 회원 조회(아이디)
	public Member getMember(String memberid);

	// 특정 회원 조회(이름)
	public List<Member> getMemberByName(@Param("name") String name, @Param("universitycode") String universitycode);

	// 정보 수정(마이페이지)
	public int updateMember(Member member);

	// 포인트 수정(결제)
	public int updatePoint(Member member);

	// 특정 회원이 쓴 글들
	public List<Post> getPosts(String memberid);

	// 회원 이메일 유효 체크
	public Member getEmail(String email);

	// 회원 비밀번호 초기화
	public int insertPassword(Member member);

}
