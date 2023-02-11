package kr.or.kosa.dto;

import lombok.Data;

@Data
public class File {

	private int filenum; //파일번호
	private int idx; //글번호
	private String fileName;
	private String fileRealName;
	private long fileSize;
		
}
