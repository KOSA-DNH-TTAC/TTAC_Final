package kr.or.kosa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Facility;
import kr.or.kosa.dto.Report;
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

	// 시설물 DB 인서트
	@RequestMapping("/insertItem")
	public ResponseEntity<List<Facility>> insertItem(@RequestParam String item) {
		List<Facility> faclist = new ArrayList<Facility>();
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String unicode = user.getUniversityCode();

		Integer result = facilityService.insertItem(unicode, item);
		try {
			faclist = facilityService.selectItem();
			return new ResponseEntity<List<Facility>>(faclist, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Facility>>(faclist, HttpStatus.BAD_REQUEST);
		}
	}

	// 시설물 DB 테이블만 출력
	@RequestMapping("/itemPrint")
	public ResponseEntity<List<Facility>> itemPrint() {
		List<Facility> faclist = new ArrayList<Facility>();
		try {
			faclist = facilityService.selectItem();
			return new ResponseEntity<List<Facility>>(faclist, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Facility>>(faclist, HttpStatus.BAD_REQUEST);
		}
	}

	// 기숙사 건물 DB 인서트
	@RequestMapping(value = "/report")
	public ResponseEntity<List<Report>> insertDomitory(@RequestParam(value = "formdata[]") String[] formdata) {
		String floor = formdata[0];
		String item = formdata[1];
		String reason = formdata[2];

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryname = user.getDomitoryName(); // 회원의 기숙사 명
		String unicode = user.getUniversityCode(); // 회원의 대학코드
		String memberid = user.getMemberId(); // 회원의 아이디

		Facility faclist = facilityService.selectReportItem(unicode, item);
		int facidx = faclist.getFacilityIdx();

		int result = facilityService.insertReport(facidx, domitoryname, floor, item, reason, memberid);

		List<Report> reportlist = facilityService.selectReport(domitoryname);
		try {
			return new ResponseEntity<List<Report>>(reportlist, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Report>>(reportlist, HttpStatus.BAD_REQUEST);
		}
	}

	// 신고 데이터 DB 테이블만 출력
	@RequestMapping("/print")
	public ResponseEntity<List<Report>> reportPrint() {
		List<Report> reportlist = new ArrayList<Report>();

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryname = user.getDomitoryName(); // 회원의 기숙사 명
		try {
			reportlist = facilityService.selectReport(domitoryname);

			return new ResponseEntity<List<Report>>(reportlist, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Report>>(reportlist, HttpStatus.BAD_REQUEST);
		}
	}

	// 층별 검색 데이터 출력
	@RequestMapping("/search")
	public ResponseEntity<List<Report>> search(@RequestParam(value = "searchData") String searchData) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryname = user.getDomitoryName(); // 회원의 기숙사 명
		List<Report> reportlist = new ArrayList<Report>();

		try {
			// 전체보기인지 층별보기인지 판별
			if (searchData.equals("전체보기")) {
				reportlist = facilityService.selectReport(domitoryname);

			} else if (!(searchData.equals("전체 보기"))) {
				reportlist = facilityService.search(domitoryname, searchData);

			}

			return new ResponseEntity<List<Report>>(reportlist, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Report>>(reportlist, HttpStatus.BAD_REQUEST);
		}
	}

}
