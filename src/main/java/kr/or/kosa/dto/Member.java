package kr.or.kosa.dto;

import java.util.List;

import kr.or.kosa.security.User;
import lombok.Data;

@Data
public class Member {
	
	private String universityCode;
	private String memberId;
	private String password;
	private String name;
	private String major;
	private String email;
	private String gender;
	private String phone;
	private String parentsPhone;
	private String domitoryName;
	private String room;
	private int memberPoint;
	private int demerit;
	private int status;
	private String enabled;
	
	// resultMap을 이용...(memberauth테이블의 값 가져와서 넣어야함)
	private List<MemberAuth> authList;
	
	public Member(User user) {
		universityCode = user.getUniversityCode();
		memberId = user.getMemberId();
		password = user.getPassword();
		name = user.getUsername();
		major = user.getMajor();
		email = user.getEmail();
		gender = user.getGender();
		phone = user.getPhone();
		parentsPhone = user.getParentsPhone();
		domitoryName = user.getDomitoryName();
		room = user.getRoom();
		memberPoint = user.getMemberPoint();
		demerit = user.getDemerit();
		status = user.getStatus();
		enabled = user.getEnabled();
		authList = user.getAuthList();
	}
	
	public Member() {
	}
	
}
