package kr.or.kosa.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.security.User;
import kr.or.kosa.service.CommonService;

@RestController
public class MemberController_Rest {
	
	CommonService commonservice;
	
	@Autowired
	public void setCommonservice(CommonService commonservice) {
		this.commonservice = commonservice;
	}



	// 저녁점호 위치비교 + 중복체크 + 데이터 인서트
	@RequestMapping(value = "/eveningCall", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String eveningCall(@RequestParam(value = "report[]") double[] report) {
		System.out.println("lat : " + report[0]);
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = user.getMemberId();
		String unicode = user.getUniversityCode();
		String domitoryName = user.getDomitoryName();

		double lat = report[0];
		double lon = report[1];
		String result = commonservice.eveningCall(lat, lon);

		// 현재 날짜/시간
		Date now = new Date();
		// 포맷팅 정의
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// 포맷팅 적용
		String date = formatter.format(now);

		// 점호한 인원 정보 데이터 인서트
		String result2 = commonservice.eveningCallCompare(memberId, unicode, date);
		String result3 = "ALREADY";
		if (result2.equals("SUCCESS")) {
			commonservice.eveningCallInsert(memberId, unicode,domitoryName);
			result3 = "SUCCESS";
		}
		return result3;
	}

}
