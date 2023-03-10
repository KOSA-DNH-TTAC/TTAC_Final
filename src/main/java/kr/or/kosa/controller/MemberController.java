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
	public String nightOver(SleepOver over, Model model) {
		int result = 0;
		try {
			result = sleepoverService.insertSleepOver(over);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		String msg = "";
		String url = "/";
		String icon = "";
		if (result == 400) {
			icon = "error";
			msg = "?????? ?????? ?????? ????????? ????????????.";
		} else if (result == 1) {
			icon = "success";
			msg = "?????? ?????? ??????!";
		} else {
			icon = "error";
			msg = "????????? ???????????????";
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
		model.addAttribute("mealList", mealList);
		return "member/mealticket";
	}

	// ????????????
	@RequestMapping("/payments")
	public String mealticketPayment(@RequestParam("memberid") String memberid, @RequestParam("amount") String amount,
			Model model) {
		String kind = "??????";
		int result = 0;
		result = paymentService.insertPayment(memberid, amount, kind);

		String msg = "";
		String url = "";
		String icon = "";
		if (result > 0) {
			// ???????????? ???????????? ?????? ?????? ??????
			int newpoint = memberservice.getMemberById(memberid).getMemberPoint();
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			user.setMemberPoint(newpoint);

			icon = "success";
			msg = "????????? ?????? ??????!";
			url = "/";
		} else {
			icon = "error";
			msg = "????????? ???????????????";
			url = "/";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("icon", icon);
		return "/common/redirect";
	}

	// qr??? ????????????
	@RequestMapping("/payment/{price}")
	public String mealticketPayment(Principal principal, @PathVariable("price") int price, Model model)
			throws IOException {
		Member member = null;
		String memberid = principal.getName();
		member = memberservice.getMemberById(memberid);

		String msg = "";
		String url = "";
		String icon = "";
		int result = 0;

		// ?????? ???????????? 0?????? ?????????
		if (member.getMemberPoint() < 0) {

			icon = "error";
			msg = "????????? ???????????????.";
			url = "/";

			// ???????????? ????????????????????? ??????
		} else if (member.getMemberPoint() < price) {

			icon = "error";
			msg = "???????????? ??????????????????.";
			url = "/";

		} else {
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			int point = member.getMemberPoint() - price;

			result = memberservice.usePoint(member, price);
			user.setMemberPoint(point);
			if (result < 0) {
				icon = "error";
				msg = "????????????..";
				url = "/";
			} else {
				icon = "success";
				msg = "????????????! " + point + "??? ???????????????.";
				url = "/";
			}
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("icon", icon);
		return "/common/redirect";
	}

}