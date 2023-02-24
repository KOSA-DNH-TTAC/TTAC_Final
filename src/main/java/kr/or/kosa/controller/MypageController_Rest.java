package kr.or.kosa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.DemeritHistory;
import kr.or.kosa.dto.PaymentHistory;
import kr.or.kosa.dto.Post;
import kr.or.kosa.dto.SleepOverHistory;
import kr.or.kosa.security.User;
import kr.or.kosa.service.AdminService;
import kr.or.kosa.service.MemberService;
import kr.or.kosa.service.PaymentService;
import kr.or.kosa.service.SleepOverService;

@RestController
@RequestMapping("/mypage")
public class MypageController_Rest {

	private MemberService memberservice;
	private PaymentService paymentservice;
	private SleepOverService sleepoverservice;
	private AdminService adminservice;

	@Autowired
	public void setAdminService(AdminService adminservice) {
		this.adminservice = adminservice;
	}

	@Autowired
	public void setMemberService(MemberService memberservice) {
		this.memberservice = memberservice;
	}

	@Autowired
	public void setPaymentService(PaymentService paymentservice) {
		this.paymentservice = paymentservice;
	}

	@Autowired
	public void setSleepOverService(SleepOverService sleepoverservice) {
		this.sleepoverservice = sleepoverservice;
	}

	// 내 정보 조회
	@GetMapping("/myinfo")
	public ResponseEntity<User> myinfo() {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return new ResponseEntity<>(user, HttpStatus.OK);
	}

	// 내 외박 내역 조회
	@GetMapping("/sleepover")
	public ResponseEntity<Map<String, Object>> mysleepover() {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<SleepOverHistory> list = new ArrayList<SleepOverHistory>();
		list = sleepoverservice.searchIntervalHistory("", "", user.getMemberId());

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	// 내 외박 기간별 조회
	@GetMapping("/sleepoverInterval")
	public ResponseEntity<Map<String, Object>> getIntervalSleepOverHistory(@RequestParam HashMap<String, Object> data) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String startdate = (String) data.get("startdate");
		String enddate = (String) data.get("enddate");
		String memberid = user.getMemberId();

		List<SleepOverHistory> list = sleepoverservice.searchIntervalHistory(startdate, enddate, memberid);
		map.put("list", list);

		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

	}

	// 내 벌점 조회
	@GetMapping("/demerit")
	public ResponseEntity<Map<String, Object>> getDemerit() {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Map<String, Object> map = new HashMap<String, Object>();

		List<DemeritHistory> list = adminservice.memberDemeritHistory(user.getMemberId());
		int total = 0;
		for (DemeritHistory d : list) {
			total += d.getDemerit();
		}

		map.put("list", list);
		map.put("total", total);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	// 내 결제내역 조회
	@GetMapping("/payments")
	public ResponseEntity<List<PaymentHistory>> mypayments() {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String memberid = user.getMemberId();
		List<PaymentHistory> list = paymentservice.getPaymentHistoryById(user.getMemberId());

		return new ResponseEntity<List<PaymentHistory>>(list, HttpStatus.OK);
	}

	// 내 커뮤니티 조회
	@GetMapping("/myboard")
	public ResponseEntity<List<Post>> mycommunity() {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Post> list = new ArrayList<Post>();
		list = memberservice.getPostings(user.getMemberId());

		return new ResponseEntity<>(list, HttpStatus.OK);
	}

}
