package kr.or.kosa.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.PaymentHistory;
import kr.or.kosa.dto.Post;
import kr.or.kosa.dto.SleepOverHistory;
import kr.or.kosa.security.User;
import kr.or.kosa.service.BoardService;
import kr.or.kosa.service.MemberService;
import kr.or.kosa.service.PaymentService;
import kr.or.kosa.service.SleepOverService;

@RestController
@RequestMapping("/mypage")
public class MypageController_Rest {
	
	private MemberService memberservice;
	private PaymentService paymentservice;
	private SleepOverService sleepoverservice;
	
	@Autowired
    public void setMemberService(MemberService memberservice) {
        this.memberservice = memberservice;
    }
	@Autowired
    public void setPaymentService(PaymentService paymentservice){
        this.paymentservice = paymentservice;
    }
	@Autowired
	public void setSleepOverService(SleepOverService sleepoverservice) {
		this.sleepoverservice = sleepoverservice;
	}
	
	//비동기를 위한 RestController임
	
	//내 정보 조회
	@GetMapping("/myinfo")
	public ResponseEntity<User> myinfo(){
//		Member member = null;
//		String memberid = principal.getName(); 우리가 기존에 쓰는건 이렇게 Principal로 로그인한 사람의 아이디를 받아오고
//		member = memberservice.getMemberById(memberid);//그 아이디로 DB에 조회작업을 또 하는 거였음
		//이걸 세션에 저장하고 쓸 수도 있는데
		//나는 스프링 시큐리티에서 분명히 로그인한 사람의 정보를 담고 있을테니까 그걸 쓰고 싶었음
		//CustomUserDetails는 스프링 시큐리티의 유저 객체를 확장해서 우리 MemberDto의 정보까지 담게 만든거임
		//그래서 앞으로 시큐리티를 쓰는 부분(로그인한 사람의 정보를 가져오는 곳)에서는
		//아래처럼 쓰면 DB작업 없이 시큐리티에서 가지고 있는 로그인 유저 정보를 MemberDto처럼 쓸 수 있음
		//근데 어려우면 걍 세션 쓰거나 DB조회하셈
		
		
		

//		맵.put("result","success")
//		맵.put("result","loginerror")
		//맵.put("data",user)
		/*
		{
			result : "success",
			data : {userdto }
		}
		*/
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return new ResponseEntity<>(user, HttpStatus.OK);
	}
	
	
	//내 정보 수정(POST)
	
	//내 외박 내역 조회
	@GetMapping("/sleepover")
	public ResponseEntity<Map<String, Object>> mysleepover(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<SleepOverHistory> list = new ArrayList<SleepOverHistory>();
		list = sleepoverservice.searchIntervalHistory("", "", user.getMemberId());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	//내 외박 기간별 조회
	@GetMapping("/sleepoverInterval")
	public ResponseEntity<Map<String, Object>> getIntervalSleepOverHistory(@RequestParam HashMap<String,Object> data){
		System.out.println(data);
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
        String startdate = (String)data.get("startdate");
        String enddate = (String)data.get("enddate");
        String memberid = user.getMemberId();

		List<SleepOverHistory> list = sleepoverservice.searchIntervalHistory(startdate, enddate, memberid);
		map.put("list", list);
		
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		
	}
	
	//내 벌점 조회
	
	//내 결제내역 조회
	@GetMapping("/payments")
	public ResponseEntity<List<PaymentHistory>> mypayments(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String memberid = user.getMemberId();
		List<PaymentHistory> list = paymentservice.getPaymentHistoryById("2017109210");
		System.out.println(list);
		return new ResponseEntity<List<PaymentHistory>>(list, HttpStatus.OK);
	}
	
	//내 커뮤니티 조회
	@GetMapping("/myboard")
	public ResponseEntity<List<Post>> mycommunity(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//아마 Post list와 댓글 개수만 모은 list를 함께 보내야 할듯 order by로 순서를 잘 맞춰서...
		//그래서 뷰단에서 자바스크립트로 for문을 돌려서 맞춰야할듯
		List<Post> list = new ArrayList<Post>();
		list = memberservice.getPostings(user.getMemberId());
//		System.out.println(list);
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

}
