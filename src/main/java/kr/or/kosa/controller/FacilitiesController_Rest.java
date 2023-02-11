package kr.or.kosa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.Facility;
import kr.or.kosa.security.User;
import kr.or.kosa.service.FacilityService;

@RestController
@RequestMapping("/facility")
public class FacilitiesController_Rest {

	FacilityService facilityService;

	@Autowired
	public void setFacilityService(FacilityService facilityService) {
		this.facilityService = facilityService;
	}

		 
			//기숙사 건물  DB 인서트
			@RequestMapping(value = "/report", method = RequestMethod.POST, produces = "application/text; charset=utf8")
			public ResponseEntity<String> insertDomitory(@RequestParam(value = "formdata[]") String[] formdata) {
				String floor = formdata[0];
				String item = formdata[1];
				String reason = formdata[2];
				System.out.println("신고해서 넘어온 데이터 -- floor : "+floor+"/"+"item : "+item);
				
				 User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				 String domitoryname = user.getDomitoryName(); //회원의 기숙사 명
				 String unicode = user.getUniversityCode(); //회원의 대학코드
				 String memberid = user.getMemberId(); //회원의 아이디
				 System.out.println("unicode : "+domitoryname);
				 Facility faclist = facilityService.selectReportItem(unicode,item);
				 int facidx = faclist.getFacilityIdx();
				 System.out.println("faclist : "+faclist);
				 System.out.println("facidx : "+facidx);
				 
				 int result = facilityService.insertReport(facidx, domitoryname, floor, item, reason, memberid);
				 //들어갔는지 row 수 반환
				 System.out.println("인서트 결과 추가된 ROW : "+result);
				 String result1 = "시설물 신고 데이터 입력 성공";
				 String result2 = "시설물 신고 데이터 입력 실패";
				try {
					return new ResponseEntity<String>(result1, HttpStatus.OK);
				} catch (Exception e) {
					return new ResponseEntity<String>(result2, HttpStatus.BAD_REQUEST);
				}
			}
			
			//건물(동) DB 테이블만 출력
			@RequestMapping("/print")
			public ResponseEntity<List<Domitory>> domitoryPrint() {
				System.out.println("나오나?");
				List<Domitory> dolist = new ArrayList<Domitory>();
				System.out.println(dolist);
				try {
					dolist = facilityService.selectDomitory();
					System.out.println("dolist : "+dolist);
					return new ResponseEntity<List<Domitory>>(dolist, HttpStatus.OK);
				} catch (Exception e) {
					return new ResponseEntity<List<Domitory>>(dolist, HttpStatus.BAD_REQUEST);
				}
			}
}
