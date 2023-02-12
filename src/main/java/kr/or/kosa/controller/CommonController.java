package kr.or.kosa.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.kosa.dto.Message;
import kr.or.kosa.security.User;

@Controller
public class CommonController {
	
//	@PostMapping("/payments")
//	public String mealticketPayment(Model model) {
//		
//		User member = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		
//		
//		int result = 0;
//		String msg = "";
//		String url = "";
//		if (result < 1) {
//			msg = "쪽지 전송 성공";
//			url = "/message";
//		} else {
//			msg = "쪽지 보내기 실패";
//			url = "/message/writing";
//		}
//		model.addAttribute("msg", msg);
//		model.addAttribute("url", url);
//		return "/common/redirect";
//	}
}