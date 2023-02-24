package kr.or.kosa.service;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import kr.or.kosa.dto.Mail;

@Service
public class MailService {

	@Autowired
	private JavaMailSender mailSender;

	// 첨부파일메일보내기
	public void sendMultieMessage(Mail mailDto) throws MessagingException, IOException {

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true);

		// 메일 제목 설정
		helper.setSubject(mailDto.getMailSubject());

		// 메일 수신자 설정
		helper.setTo(mailDto.getMailTo());
       
		// 메일 본문 설정
		helper.setText(mailDto.getMailContent(), false);
		
		// 메일 발신자 설정
		helper.setFrom("hjdo0211@naver.com");
		
		// 첨부 파일 설정
		String fileName = StringUtils.cleanPath(mailDto.getFile().getOriginalFilename());
		
		// 파일첨부
		helper.addAttachment(MimeUtility.encodeText(fileName, "UTF-8", "B"),
				new ByteArrayResource(IOUtils.toByteArray(mailDto.getFile().getInputStream())));

		mailSender.send(message);

	}

}
