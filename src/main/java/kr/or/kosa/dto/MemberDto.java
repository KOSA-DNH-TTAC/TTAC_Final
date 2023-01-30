package kr.or.kosa.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberDto {
	private String userid;
	private String userpw;
	private String userName;
	private boolean enabled;
	
	private Date regDate;
	private Date updateDate;
	private List<AuthDto> authList;
}
