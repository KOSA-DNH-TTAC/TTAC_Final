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
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.SleepOver;
import kr.or.kosa.security.User;
import kr.or.kosa.service.MemberService;
import kr.or.kosa.service.PaymentService;
import kr.or.kosa.service.SleepOverService;

@RestController
public class AdminMemberController_Rest {

	private MemberService memberservice;
	
	@Autowired
    public void setMemberService(MemberService memberservice) {
        this.memberservice = memberservice;
    }

	
	//관리자 회원 관리...?용
	//관리자 전체 회원 조회
	@GetMapping("/admin/allmember")
	public ResponseEntity<Map<String, Object>> getAllMember(){
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Member> list = memberservice.getAllMember(user.getUniversityCode());
		map.put("list", list);
		return new ResponseEntity<>(map, HttpStatus.OK);
	}

	
}
