package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Post {

	private int idx;
	private int boardIdx;
	private String universityCode;
	private String memberId;
	private String title;
	private String content;
	private int readNum;
	private Date writeDate;
	private int likeNum;
	private int status;
}
