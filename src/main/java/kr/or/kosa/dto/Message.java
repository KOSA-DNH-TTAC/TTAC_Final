package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Message {

	private int messageIdx;
	private String smemberId;
	private String rmemberId;
	private String messageTitle;
	private String messageContent;
	private Date messageDate;
	private String status;

}
