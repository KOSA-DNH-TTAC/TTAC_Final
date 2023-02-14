package kr.or.kosa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.DemeritHistory;
import kr.or.kosa.dto.Member;
import kr.or.kosa.security.User;
import kr.or.kosa.service.AdminService;
import kr.or.kosa.service.MemberService;

@RestController
public class AdminMemberController_Rest {

	private MemberService memberservice;

	@Autowired
	public void setMemberService(MemberService memberservice) {
		this.memberservice = memberservice;
	}
	
	private AdminService adminService;
	
	@Autowired
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	// 관리자 회원 관리...?용
	// 관리자 전체 회원 조회
	@GetMapping("/admin/allmember")
	public ResponseEntity<Map<String, Object>> getAllMember() {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Member> list = memberservice.getAllMember(user.getUniversityCode());
		map.put("list", list);
		return new ResponseEntity<>(map, HttpStatus.OK);
	}

	// 특정 회원 조회
	@RequestMapping("/admin/memberInfo/{memberId}")
	public ResponseEntity<List<Member>> getMemberById(@PathVariable("memberId") String memberId) {
		List<Member> memberInfoById = adminService.memberInfo(memberId);
		return new ResponseEntity<List<Member>>(memberInfoById, HttpStatus.OK);
	}
	
	// 검색 조회
	@RequestMapping("/admin/memberInfo/search/{param}/{search}")
	public ResponseEntity<List<Member>> searchMember(@PathVariable("param") String param,
			@PathVariable("search") String search) {
		System.out.println("뭐해.");
		
		List<Member> memberSearchInfo = adminService.searchMember(param, search);
		return new ResponseEntity<List<Member>>(memberSearchInfo, HttpStatus.OK);
	}
	
	// 벌점 이력 조회
	@RequestMapping("/admin/memberInfo/demerit/{memberId}")
	public ResponseEntity<List<DemeritHistory>> memberDemeritHistory(@PathVariable("memberId") String memberId) {
		
		System.out.println("컨트롤러 타는 중 !!!!!!!!!!!!!!!!!!!");
		List<DemeritHistory> list = adminService.memberDemeritHistory(memberId);
		
		return new ResponseEntity<List<DemeritHistory>>(list, HttpStatus.OK);
	}

}
