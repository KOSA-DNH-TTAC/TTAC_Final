package kr.or.kosa.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.Post;
import kr.or.kosa.security.User;
import kr.or.kosa.service.BoardService;
import kr.or.kosa.service.MemberService;

@RestController
@RequestMapping("/mypage")
public class MypageController {
	
	private MemberService memberservice;
	
	@Autowired
    public void setMemberService(MemberService memberservice) {
        this.memberservice = memberservice;
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
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("내 정보 확인 비동기");
//		Member member = memberservice.getMemberById(user.getMemberId());
		return new ResponseEntity<>(user, HttpStatus.OK);
	}
	
	
	//내 정보 수정
	
	//내 외박 내역 조회
	
	//내 벌점 조회
	
	//내 커뮤니티 조회
	@GetMapping("/myboard")
	public ResponseEntity<List<Post>> mycommunity(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		List<Post> list = new ArrayList<Post>();
		list = memberservice.getPostings(user.getMemberId());
//		System.out.println(list);
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

}
