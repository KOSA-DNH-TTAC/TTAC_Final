package kr.or.kosa.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Cafeteria;
import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.Report;
import kr.or.kosa.dto.RollCall;
import kr.or.kosa.dto.Schedule;
import kr.or.kosa.security.User;
import kr.or.kosa.service.AdminService;
import kr.or.kosa.service.BoardService;
import kr.or.kosa.service.CafeteriaService;
import kr.or.kosa.service.FacilityService;
import kr.or.kosa.service.calendarService;

@RestController
public class AdminController_Rest {

	BoardService boardService;
	FacilityService facilityService;
	calendarService calendarService;
	CafeteriaService cafeteriaService;
	AdminService adminService;
	
	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	@Autowired
	public void setFacilityService(FacilityService facilityService) {
		this.facilityService = facilityService;
	}

	@Autowired
	public void setcalendarService(calendarService calendarService) {
		this.calendarService = calendarService;
	}

	@Autowired
	public void setcafeteriaService(CafeteriaService cafeteriaService) {
		this.cafeteriaService = cafeteriaService;
	}
	@Autowired
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	// 기숙사 건물 DB 인서트
	@RequestMapping("/adminAnalyze/insertDomitory")
	public ResponseEntity<List<Domitory>> insertDomitory(@RequestParam(value = "domitory[]") String[] domitory) {
		List<Domitory> domitorylist = new ArrayList<Domitory>();
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String unicode = user.getUniversityCode();
		String domitoryname = domitory[0];
		String domitoryfloor = domitory[1];

		// 들어갔는지 row 수 반환
		Integer result = facilityService.insertDomitory(unicode, domitoryname, domitoryfloor);
		String result1 = "기숙사 건물 입력성공";
		try {
			domitorylist = facilityService.selectAllDomitory();
			return new ResponseEntity<List<Domitory>>(domitorylist, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Domitory>>(domitorylist, HttpStatus.BAD_REQUEST);
		}
	}

	// 건물(동) DB 테이블만 출력
	@RequestMapping("/adminAnalyze/domitoryPrint")
	public ResponseEntity<List<Domitory>> domitoryPrint() {
		List<Domitory> dolist = new ArrayList<Domitory>();
		try {
			dolist = facilityService.selectAllDomitory();
			return new ResponseEntity<List<Domitory>>(dolist, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Domitory>>(dolist, HttpStatus.BAD_REQUEST);
		}
	}

	// 날짜별 검색 데이터 출력
	@RequestMapping("/adminAnalyze/searchDate")
	public ResponseEntity<List<Report>> searchDate(@RequestParam(value = "data[]") String[] searchData) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryname = user.getDomitoryName(); // 회원의 기숙사 명
		String startdate = searchData[0];
		String enddate = searchData[1];
		List<Report> reportlist = new ArrayList<Report>();

		// 현재 날짜/시간
		Date now = new Date();
		// 포맷팅 정의
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// 포맷팅 적용
		String date = formatter.format(now);
		try {
			// 전체보기인지 날짜별보기인지 판별
			if (startdate.equals("today")) {
				reportlist = facilityService.searchDate(domitoryname, date, date);
			} else if (!(searchData.equals("전체보기"))) {
				reportlist = facilityService.searchDate(domitoryname, startdate, enddate);
			}
			return new ResponseEntity<List<Report>>(reportlist, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Report>>(reportlist, HttpStatus.BAD_REQUEST);
		}
	}

	// 층별 검색 데이터 출력
	@RequestMapping("/adminAnalyze/likesearch")
	public ResponseEntity<List<Report>> likeSearch(@RequestParam(value = "data") String item) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryname = user.getDomitoryName(); // 회원의 기숙사 명
		List<Report> reportlist = new ArrayList<Report>();

		try {
			// 전체보기인지 층별보기인지 판별
			if (item.equals("")) {
				reportlist = facilityService.selectReport(domitoryname);
			} else if (!(item.equals(""))) {
				reportlist = facilityService.likeSearch(domitoryname, item);
			}
			return new ResponseEntity<List<Report>>(reportlist, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Report>>(reportlist, HttpStatus.BAD_REQUEST);
		}
	}

	// 연간일정 DB 인서트
	@RequestMapping("/calendar/insert")
	public ResponseEntity<List<Schedule>> insertcalendar(@RequestParam(value = "plan[]") String[] plan) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String unicode = user.getUniversityCode();
		String domitoryname = user.getDomitoryName();
		String date = plan[0];
		String title = plan[1];
		String content = plan[2];

		// 들어갔는지 row 수 반환
		List<Schedule> result = calendarService.insertcalendar(unicode, date, title, content, domitoryname);
		try {
			return new ResponseEntity<List<Schedule>>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Schedule>>(result, HttpStatus.BAD_REQUEST);
		}
	}

	// 일정 리스트만 출력
	@RequestMapping("/calendar/print")
	public ResponseEntity<List<Schedule>> calendarPrint() {
		List<Schedule> list = new ArrayList<Schedule>();
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String unicode = user.getUniversityCode();
		String domitoryname = user.getDomitoryName();

		try {
			list = calendarService.selectCalendar(unicode, domitoryname);
			return new ResponseEntity<List<Schedule>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Schedule>>(list, HttpStatus.BAD_REQUEST);
		}
	}

	// 일정 삭제
	@GetMapping("/calendar/update")
	public ResponseEntity<Map<String, Object>> updateCalecdar(int idx) {
		int result = calendarService.updateCalecdar(idx);
		Map<String, Object> map = new HashMap<String, Object>();
		if (result > 0) {
			map.put("결과", "승인완료");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("결과", "문제발생");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.BAD_REQUEST);
		}
	}

	// 일정 리스트만 출력
	@RequestMapping("/calendar/monthPrint")
	public ResponseEntity<List<Schedule>> monthPrint(@RequestParam HashMap<String, String> monthdata) {
		Map<String, Object> map = new HashMap<String, Object>();
		String data = (String) monthdata.get("data");
		List<Schedule> list = new ArrayList<Schedule>();
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String unicode = user.getUniversityCode();
		String domitoryname = user.getDomitoryName();
		String Start = "";
		String End = "";

		// 월별 날짜 계산
		if (data.equals("2023-01") || data.equals("2023-03") || data.equals("2023-05") || data.equals("2023-07")
				|| data.equals("2023-08") || data.equals("2023-10") || data.equals("2023-12")) {
			Start = data + "-01";
			End = data + "-31";
			System.out.println("Strat : " + Start + "/" + "End : " + End);
		} else if (data.equals("2023-01") || data.equals("2023-04") || data.equals("2023-06") || data.equals("2023-09")
				|| data.equals("2023-11")) {
			Start = data + "-01";
			End = data + "-30";
			System.out.println("Strat : " + Start + "/" + "End : " + End);
		} else if (data.equals("2023-02")) {
			Start = data + "-01";
			End = data + "-28";
			System.out.println("Strat : " + Start + "/" + "End : " + End);
		}

		try {
			list = calendarService.monthPrint(unicode, domitoryname, Start, End);
			return new ResponseEntity<List<Schedule>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Schedule>>(list, HttpStatus.BAD_REQUEST);
		}
	}

	// 메뉴 리스트 출력
	@RequestMapping("/coupon/list")
	public ResponseEntity<List<Cafeteria>> cafeteriaPrint() {

		List<Cafeteria> menulist = new ArrayList<Cafeteria>();
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String universitycode = user.getUniversityCode();
		String domitoryName = user.getDomitoryName();

		try {
			menulist = cafeteriaService.selectCafeteria(universitycode, domitoryName);
			return new ResponseEntity<List<Cafeteria>>(menulist, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Cafeteria>>(menulist, HttpStatus.BAD_REQUEST);
		}
	}

	// 메뉴 추가
	@RequestMapping("/coupon/insert")
	public void insertmenu(@RequestParam("name") String menu, @RequestParam("price") String price) {
	    cafeteriaService.insertMenu(menu, price);
	}

	// 메뉴 수정
	@RequestMapping("/coupon/update")
	public void updateMenu(@RequestParam("idx") String idx, @RequestParam("domitory") String domitory,
			@RequestParam("name") String name, @RequestParam("price") String price) {
		int menuidx = Integer.parseInt(idx);
		int menuPrice = Integer.parseInt(price);
		Cafeteria cafeteria = new Cafeteria();
		cafeteria.setMenuidx(menuidx);
		cafeteria.setDomitoryName(domitory);
		cafeteria.setMenu(name);
		cafeteria.setMenuPrice(menuPrice);

		cafeteriaService.updateMenu(cafeteria);
	}

	// 메뉴 삭제
	@GetMapping("/coupon/delete")
	public void deleteMenu(@RequestParam("idx") String idx) {
		int menuidx = Integer.parseInt(idx);
		cafeteriaService.deleteMenu(menuidx);
	}
	
	// 관리자 점호 회원  조회
		@RequestMapping("/admin/allRollCallMember")
		public ResponseEntity<List<RollCall>> getAllRollCallMember(@RequestParam String date) {
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String universitycode = user.getUniversityCode();
			String domitoryName = user.getDomitoryName();
			List<RollCall> list = adminService.getAllRollCallMember(universitycode,domitoryName,date);
			try {
				return new ResponseEntity<List<RollCall>>(list, HttpStatus.OK);
			} catch (Exception e) {
				return new ResponseEntity<List<RollCall>>(list, HttpStatus.BAD_REQUEST);
			}
		}
}
