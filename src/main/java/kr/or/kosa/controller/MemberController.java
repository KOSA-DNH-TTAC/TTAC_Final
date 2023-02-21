package kr.or.kosa.controller;

import java.io.IOException;
import java.security.Principal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosa.dao.CafeteriaDao;
import kr.or.kosa.dto.Cafeteria;
import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.PaymentHistory;
import kr.or.kosa.dto.SleepOver;
import kr.or.kosa.security.CustomUser;
import kr.or.kosa.security.CustomUserDetailService;
import kr.or.kosa.security.User;
import kr.or.kosa.service.CafeteriaService;
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
	
	@Autowired
	CafeteriaService service;
	
	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/nightOver")
	public String application() {
		
		return "member/nightOver";
	}
	
	@PostMapping("/nightOver")
	public String nightOver(SleepOver over, MultipartFile file, Model model) {
		int result = 0;
		try {
			result = sleepoverService.insertSleepOver(over, file);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String msg = "";
		String url = "/";
		String icon = "";
		if(result == 400) {
			icon = "error";
			msg = "외박 신청 가능 시간이 아닙니다.";
		} else if (result == 1) {
			icon = "success";
			msg = "외박 신청 완료!";
		} else{
			icon = "error";
			msg = "문제가 발생했어요";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("icon", icon);
		return "/common/redirect";
	}
	
	@GetMapping("/mealticket")
	public String mealticket(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String unicode = user.getUniversityCode();
		String domitoryname = user.getDomitoryName();
		List<Cafeteria> mealList = service.selectCafeteria(unicode, domitoryname);
		System.out.println("mealList : "+mealList);
		model.addAttribute("mealList", mealList);
		return "member/mealticket";
	}
	// 충전할때
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
			//로그인한 시큐리티 유저 정보 갱신
			int newpoint = memberservice.getMemberById(memberid).getMemberPoint();
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			user.setMemberPoint(newpoint);
			
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
	
	//qr로 결제할때
	@RequestMapping("/payment/{price}")
	public String mealticketPayment(Principal principal,@PathVariable("price") int price, Model model) throws IOException {
		Member member = null;
		String memberid = principal.getName();
		member = memberservice.getMemberById(memberid);
		
		String msg = "";
		String url = "";
		String icon = "";
		int result = 0;
		
		//회원 포인트가 0보다 작으면
		if(member.getMemberPoint() < 0) {
			
			icon = "error";
			msg = "포인트 오류입니다.";
			url = "/";
			
		//결제값이 회원포인트보다 크면
		}else if(member.getMemberPoint() < price) {
			
			icon = "error";
			msg = "포인트를 충전해주세요.";
			url = "/";
			
		}else {
			
			int point = member.getMemberPoint() - price;
			member.setMemberPoint(point);
			
			result = memberservice.updatePoint(member);
			
			if(result < 0) {
				icon = "error";
				msg = "결제실패..";
				url = "/";
			} else {
				icon = "success";
				msg = "사용완료! " + point + "원 남았습니다.";
				url = "/";
			}
		}
		
	
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("icon", icon);
		return "/common/redirect";
	}
	
}