package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Message {

	private int messageIdx;
	private String sMemberId;
	private String rMemberId;
	private String messageTitle;
	private String messageContent;
	private Date messageDate;
	private String status;

}
