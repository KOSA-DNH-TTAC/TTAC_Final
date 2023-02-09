package kr.or.kosa.controller;

import java.security.Principal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.SleepOver;
import kr.or.kosa.security.CustomUser;
import kr.or.kosa.service.MemberService;
import kr.or.kosa.service.PaymentService;
import kr.or.kosa.service.SleepOverService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberservice;
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	SleepOverService sleepoverService;
	
	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);
	
	@GetMapping("/nightOver")
	public String application() {
		
		return "member/nightOver";
	}
	
	@PostMapping("/nightOver")
	public String nightOver(SleepOver over, MultipartFile file) {
		System.out.println("외박신청 들어옴");
		System.out.println(over);
		System.out.println(file);
		try {
			sleepoverService.insertSleepOver(over, file);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/";
	}
	
	@GetMapping("/mealticket")
	public String mealticket() {
		
		return "member/mealticket";
	}
	
	@RequestMapping("/payments")
	public String mealticketPayment(@RequestParam("memberid") String memberid, @RequestParam("amount")String amount, Model model) {
		System.out.println("파라미터로 들어온 ... : " + memberid + " " + amount);
		String kind = "충전";
		int result = 0;
		result = paymentService.insertPayment(memberid, amount, kind);
		
		String msg = "";
		String url = "";
		String icon = "";
		if (result > 0) {
			icon = "success";
			msg = "포인트 충전 완료!";
			url = "/";
		} else {
			icon = "error";
			msg = "문제가 발생했어요";
			url = "/";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("icon", icon);
		return "/common/redirect";
	}
	
	
	
	//테스트용....
	@GetMapping("/testmember")
	public String test() {
		List<Member> list = new ArrayList<Member>();
		list = memberservice.getAllMember("kosa");
		for(Member m : list) {
			System.out.println(m);
		}
		return null;
	}
	
	@GetMapping("/testgetmemberid")
	public String testSearchById(@AuthenticationPrincipal Object principal) {
		System.out.println(principal.toString());
//		Member member = new Member();
//		member = service.getMemberById("2017109210");
//		System.out.println(member);
		return null;
	}
	@GetMapping("/testgetmember")
	public String testSearchByName(Principal principal) {
		Member member = memberservice.getMemberById(principal.getName());
		List<Member> list = new ArrayList<Member>();
//		list = service.getMemberByName("도현정", "kosa");
		list = memberservice.getMemberByName(member.getName(), member.getUniversityCode());
		System.out.println(list);
		return null;
	}
}