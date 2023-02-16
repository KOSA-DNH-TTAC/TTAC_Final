package kr.or.kosa.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Mail {
	private String mailFrom;  //보내는 이

	 private String mailTo;	//받는 이

	 private String mailCc;

	 private String mailBcc;

	 private String mailSubject;  //제목

	 private String mailContent;  //내용

	 private String templateName;

	 private String contentType;
	 
	 private MultipartFile file;
	 
	
}