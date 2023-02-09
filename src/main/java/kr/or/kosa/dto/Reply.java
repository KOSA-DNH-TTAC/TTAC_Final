package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Reply {
	
	private int replyIdx;
	private int parentReplyIdx;
	private int idx;
	private String memberId;
	private String replyContent;
	private String replyDate;
	private int status;

}
