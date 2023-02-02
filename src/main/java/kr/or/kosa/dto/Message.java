package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Message {

	private int messageIdx;
	private String sMemberId;
	private String rMemberid;
	private String messageTitle;
	private String messageContent;
	private Date messageDate;
	private int memberpoint;
	private String status;

}
