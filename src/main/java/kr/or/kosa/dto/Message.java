package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Message {

	private int messageIdx;
	private String sUniversityCode;
	private String sMemberId;
	private String rUniversityCode;
	private String rMemberid;
	private String messageTitle;
	private String messageContent;
	private Date messageDate;

}
