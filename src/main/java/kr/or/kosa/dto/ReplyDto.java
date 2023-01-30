package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDto {
	
	private Long rno;
	private Long bno;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;

}
