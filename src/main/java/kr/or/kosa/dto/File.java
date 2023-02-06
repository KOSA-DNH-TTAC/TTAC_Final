package kr.or.kosa.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class File {

	private int filenum; //파일번호
	private int idx; //글번호
	private String fileName;
	private int fileSize;
	private MultipartFile file;
		
}
