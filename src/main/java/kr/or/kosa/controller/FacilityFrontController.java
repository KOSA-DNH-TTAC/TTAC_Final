package kr.or.kosa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.Facility;
import kr.or.kosa.security.User;
import kr.or.kosa.service.FacilityService;


@Controller
public class FacilityFrontController {
			
	FacilityService facilityService;

	@Autowired
	public void setFacilityService(FacilityService facilityService) {
		this.facilityService = facilityService;
	}

		//마이페이지
		@GetMapping("/facility")
		public ModelAndView facility() {
			ModelAndView mv = new ModelAndView();
			//시설물 정보 가져오기
			List<Facility> faclist = new ArrayList<Facility>();
			faclist = facilityService.selectItem();
			System.out.println("faclist : "+faclist);
			//건물 정보 가져오기
			List<Domitory> dolist = new ArrayList<Domitory>();
			dolist = facilityService.selectDomitory();
			System.out.println("dolist : "+dolist);
			
			mv.setViewName("member/facilityReport");
			mv.addObject("faclist", faclist);	
			mv.addObject("dolist", dolist);
			return mv;
		}
		
		//마이페이지 - 정보수정
		//@GetMapping("/mypage/modify")
		public String myPageModify() {
			return "member/mypage/modifyInfo";
		}
		

}
