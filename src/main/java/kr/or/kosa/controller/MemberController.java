package kr.or.kosa.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.kosa.dto.Member;
import kr.or.kosa.security.CustomUser;
import kr.or.kosa.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;

	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);
	
	@GetMapping("/nightOver")
	public String application() {
		
		return "member/nightOver";
	}
	
	@GetMapping("/mealticket")
	public String mealticket() {
		
		return "member/mealticket";
	}
	
	
	
	//테스트용....
	@GetMapping("/testmember")
	public String test() {
		List<Member> list = new ArrayList<Member>();
		list = service.getAllMember("kosa");
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
		Member member = service.getMemberById(principal.getName());
		List<Member> list = new ArrayList<Member>();
//		list = service.getMemberByName("도현정", "kosa");
		list = service.getMemberByName(member.getName(), member.getUniversityCode());
		System.out.println(list);
		return null;
	}
}