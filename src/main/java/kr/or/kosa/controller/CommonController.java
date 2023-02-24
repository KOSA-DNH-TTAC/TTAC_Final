package kr.or.kosa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.Message;
import kr.or.kosa.security.User;
import kr.or.kosa.service.CommonService;
import kr.or.kosa.service.MessageService;

@Controller
public class CommonController {
	String key;
	int checkNum;
	CommonService commonService;

	@Autowired
	public void setcommonService(CommonService commonService) {
		this.commonService = commonService;
	}

	@Autowired
	MessageService messageservice;

	@Autowired
	private JavaMailSender mailSender;

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/chat")
	public String chat(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("userid", user.getUsername());
		return "chat";
	}

	@GetMapping("/forgot")
	public String findPw() {
		return "common/forgotPw";
	}

	// 인증 메일 발송
	@GetMapping("/forgotMail")
	public String email() {
		return null;
	}

	// 헤더에서 쪽지함에 안 읽은 쪽지 있는지...
	@ResponseBody
	@GetMapping("/top/notebox")
	public String getMsgCount() {
		User user;
		String result = "N";
		try {
			user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			List<Message> list = messageservice.getReceivedMsg(user.getMemberId());
			loop: for (Message m : list) {
				if (m.getStatus().equals("N")) {
					result = "Y";
					break loop;
				}
			}
		} catch (Exception e) {
			result = "N";
		}

		return result;
	}

	// 개인 or 단체 메일 보내기
	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	public String emailAuth(@RequestParam(value = "email") String email) {

		Random random = new Random();
		checkNum = random.nextInt(888888) + 111111; // 6자리 난수 생성
		key = Integer.toString(checkNum);

		// 메일 본문 템플릿
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 <" + checkNum + "> 입니다." + "<br>"
				+ "홈페이지로 돌아가서 해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		MimeMessage message = mailSender.createMimeMessage(); // MimeMessage 객체를 이용해서 메시지를 구성한 뒤 메일 발송

		try {

			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8"); // true는 멀티파트 메세지를 사용하겠다는 의미

			helper.setFrom("hjdo0211@naver.com"); // 보내는 사람 이메일

			helper.setTo(email); // 수신자 이메일
			helper.setSubject("DOTO :: 개인정보 찾기 인증메일"); // 제목
			helper.setText(content, true); // 내용. true는 html을 사용하겠다는 의미

			mailSender.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return Integer.toString(checkNum);
	}

	// 인증번호 대조하기
	@RequestMapping("/personalNum")
	public ResponseEntity<Member> insertmenu(@RequestParam String personalNum, String email) {

		Map<String, String> memberNuM = new HashMap<String, String>();
		memberNuM.put(email, personalNum);

		// 들어갔는지 row 수 반환
		Member result = commonService.compareNum(memberNuM, checkNum, email);

		try {
			return new ResponseEntity<Member>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Member>(result, HttpStatus.BAD_REQUEST);
		}
	}

}