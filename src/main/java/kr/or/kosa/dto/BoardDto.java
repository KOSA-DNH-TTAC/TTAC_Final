package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDto {

	/*
	bno number(10,0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
	 */
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	
}
