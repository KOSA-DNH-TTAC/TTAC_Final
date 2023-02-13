package kr.or.kosa.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.support.incrementer.AbstractColumnMaxValueIncrementer;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.Report;
import kr.or.kosa.security.User;
import kr.or.kosa.service.BoardService;
import kr.or.kosa.service.FacilityService;

@RestController
@RequestMapping("/adminAnalyze")
public class AdminController_Rest {

	BoardService boardService;
	FacilityService facilityService;

	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	@Autowired
	public void setFacilityService(FacilityService facilityService) {
		this.facilityService = facilityService;
	}

		 
			//기숙사 건물  DB 인서트
			@RequestMapping("/insertDomitory")
			public ResponseEntity<List<Domitory>> insertDomitory(@RequestParam(value = "domitory[]") String[] domitory) {
				List<Domitory> domitorylist = new ArrayList<Domitory>();
				 System.out.println("domitory : "+ domitory);
				 User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				 String unicode = user.getUniversityCode();
				 System.out.println("unicode : "+unicode);
				 
				 String domitoryname = domitory[0];
				 String domitoryfloor = domitory[1];
				 
				 //들어갔는지 row 수 반환
				 Integer result = facilityService.insertDomitory(unicode, domitoryname, domitoryfloor);
				 System.out.println("인서트 결과 추가된 ROW : "+result);
				 String result1 = "기숙사 건물 입력성공";
				try {
					domitorylist = facilityService.selectAllDomitory();
					return new ResponseEntity<List<Domitory>>(domitorylist, HttpStatus.OK);
				} catch (Exception e) {
					return new ResponseEntity<List<Domitory>>(domitorylist, HttpStatus.BAD_REQUEST);
				}
			}
			
			//건물(동) DB 테이블만 출력
			@RequestMapping("/domitoryPrint")
			public ResponseEntity<List<Domitory>> domitoryPrint() {
				System.out.println("나오나?");
				List<Domitory> dolist = new ArrayList<Domitory>();
				System.out.println(dolist);
				try {
					dolist = facilityService.selectAllDomitory();
					System.out.println("dolist : "+dolist);
					int maxValue = max(dolist);
					return new ResponseEntity<List<Domitory>>(dolist, HttpStatus.OK);
				} catch (Exception e) {
					return new ResponseEntity<List<Domitory>>(dolist, HttpStatus.BAD_REQUEST);
				}
			}
			
			//날짜별 검색 데이터 출력
			@RequestMapping("/searchDate")
			public ResponseEntity<List<Report>> searchDate(@RequestParam(value = "searchData") String searchData) {
				System.out.println(searchData);
				 User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				 String domitoryname = user.getDomitoryName(); //회원의 기숙사 명
				 //String unicode = user.getUniversityCode();	   //회원의 대학코드
				 List<Report> reportlist = new ArrayList<Report>();
				 
				try {
					//전체보기인지 층별보기인지 판별
					if(searchData.equals("전체보기")) {
						 reportlist = facilityService.selectReport(domitoryname);
						 System.out.println("전체 reportlist : "+reportlist);
					 } else if(!(searchData.equals("전체 보기"))) {
						 reportlist = facilityService.search(domitoryname, searchData);
						 System.out.println("층별 reportlist : "+reportlist);
					 }
					
					return new ResponseEntity<List<Report>>(reportlist, HttpStatus.OK);
				} catch (Exception e) {
					return new ResponseEntity<List<Report>>(reportlist, HttpStatus.BAD_REQUEST);
				}
			}
			
			
			
			
			
			
			
			
			public int max(List<Domitory> dolist) {
						    Iterator<Domitory> iterator = dolist.iterator();
						    String domitoryFloor = "";
						    while (iterator.hasNext()) {
						    	Domitory domitory = iterator.next();
						    	domitoryFloor = domitory.getDomitoryFloor();
						    }
						int tmp = Integer.parseInt(domitoryFloor); //7
						int max = 0;
						 for(int i = 0 ; i < tmp ; i++) {
							 if(i==0)
								 max=i;
							 if(max < tmp) {
								 max = i;
							 }
						 }
						 return max;
				
			}
}
