package kr.or.kosa.controller;

import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
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

import kr.or.kosa.dto.Message;
import kr.or.kosa.security.User;
import kr.or.kosa.service.MessageService;


@Controller
public class CommonController {
	String key;
	
	@Autowired
	MessageService messageservice;
	
   @Autowired
   private JavaMailSender mailSender;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/chat")
	public String chat(Model model) {
		
		System.out.println("채팅 컨트롤러");
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		System.out.println("========================");
		System.out.println("@ChatController  GET chat / Username : " + user.getName());
		model.addAttribute("userid", user.getUsername());
		return "chat";
	}
	
	@GetMapping("/forgot")
	public String findPw() {
		return "common/forgotPw";
	}
	
	//인증 메일 발송
	@GetMapping("/forgotMail")
	public String email() {
		return null;
	}
	//헤더에서 쪽지함에 안 읽은 쪽지 있는지...
	@ResponseBody
	@GetMapping("/top/notebox")
	public String getMsgCount() {
		User user;
		String result = "N";
		try {
			user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			List<Message> list = messageservice.getReceivedMsg(user.getMemberId());
			loop : for(Message m : list) {
				if(m.getStatus().equals("N")) {
					result = "Y";
					break loop;
				}
			}
		} catch (Exception e) {
//			System.out.println("헤더 ajax에서 나는 에러...추후에 잡을 예정 : " + e.getMessage() );
			//여기서 나는 예외는 로그인 되어있지 않은데 헤더에서 ajax로 유저 정보를 호출하기 때문에
			//user 가져오는데서 나는 예외임
			//따라서 로그인돼있지 않으므로, 받은 쪽지도 없으므로 'N'을 리턴함
			result="N";
		}
		
		return result;
	}
	
   // 개인 or 단체 메일 보내기
   @RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
   public String emailAuth(@RequestParam(value = "email") String email) {
      System.out.println("컨트롤러로 넘어온 이메일 파라미터 : " + email.toString());

      Random random = new Random();
      int checkNum = random.nextInt(888888) + 111111; // 6자리 난수 생성
      key = Integer.toString(checkNum);

      // 메일 본문 템플릿
      String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 <" + checkNum + "> 입니다." + "<br>"
            + "홈페이지로 돌아가서 해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
      // MimeMessage 대신 SimpleMailMessage를 사용할 수도 있습니다.
      // 둘의 차이점은 MimeMessage의 경우 멀티파트 데이터를 처리 할 수 있고 SimpleMailMessage는 단순한 텍스트 데이터만
      // 전송이 가능합니다.

      MimeMessage message = mailSender.createMimeMessage(); // MimeMessage 객체를 이용해서 메시지를 구성한 뒤 메일 발송

      try {
         // MimeMessag를 이용해서 파일첨부가 가능하지만 복잡하고 힘들기에 MimeMessageHelper 도움받아 파일 첨부
         MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");// true는 멀티파트 메세지를 사용하겠다는 의미

         helper.setFrom("hjdo0211@naver.com"); // 보내는 사람 이메일
         // bean에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
         // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
         // mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");

         helper.setTo(email); // 수신자 이메일
         helper.setSubject("DOTO :: 개인정보 찾기 인증메일"); // 제목
         helper.setText(content, true); // 내용. true는 html을 사용하겠다는 의미

         // 아래는 helper안쓰고 그냥 했을 때 ...
         // message.setSubject("스프링으로 메일보내기");
         // message.setText("메일본문 : " + checkNum);
         // message.setRecipients(MimeMessage.RecipientType.TO,
         // InternetAddress.parse(email));
         // message.setRecipients(MimeMessage.RecipientType.TO, email);
         // message.setFrom("hjdo0211@naver.com");

         mailSender.send(message);
         System.out.println("메일 보내기 성공");
      } catch (MessagingException e) {
         e.printStackTrace();
      }

      return Integer.toString(checkNum);
   }
}