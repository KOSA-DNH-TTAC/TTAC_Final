package kr.or.kosa.dto;

import lombok.Data;

@Data
public class Post {

	private int idx;
	private int boardIdx;
	private String universityCode;
	private String memberId;
	private String boardName;
	private String title;
	private String content;
	private int readNum;
	private String writeDate;
	private int likeNum;
	private int status;
	private int replyCount;
}
