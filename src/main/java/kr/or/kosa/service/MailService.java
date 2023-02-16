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
		System.out.println("첨부파일 서비스1 : " + mailDto);
		System.out.println("첨부파일 서비스2 : " + mailDto.getFile());

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true);
		// 메일 제목 설정
		helper.setSubject(mailDto.getMailSubject());
		System.out.println("메일 제목 설정");
		// 메일 수신자 설정
		helper.setTo(mailDto.getMailTo());
		// 참조자 설정 ... 필요없을듯?
//	        helper.setCc(mailDto.getMailCc());        
		// 메일 본문 설정
		helper.setText(mailDto.getMailContent(), false);
		// 메일 발신자 설정
		helper.setFrom("hjdo0211@naver.com");
		// 첨부 파일 설정
		String fileName = StringUtils.cleanPath(mailDto.getFile().getOriginalFilename());
		// 파일첨부
		helper.addAttachment(MimeUtility.encodeText(fileName, "UTF-8", "B"),
				new ByteArrayResource(IOUtils.toByteArray(mailDto.getFile().getInputStream())));
		
		System.out.println("여기까지는 오는지?");
		

		mailSender.send(message);
		System.out.println("mail multiple send complete.");

	}

}
