package kr.or.kosa.dto;

import java.util.List;

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
	private int memberPoint;
	private int demerit;
	private int status;
	private String enabled;
	
	private List<MemberAuth> authList;
	
}
