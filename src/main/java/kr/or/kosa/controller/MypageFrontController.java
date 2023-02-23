package kr.or.kosa.controller;

import java.io.IOException;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kosa.aws.AwsS3;
import kr.or.kosa.dto.Member;
import kr.or.kosa.security.User;
import kr.or.kosa.service.MemberService;


@Controller
public class MypageFrontController {
			
		private MemberService memberservice;
			
		@Autowired
	    public void setMemberService(MemberService memberservice) {
	        this.memberservice = memberservice;
	    }

		//마이페이지
		@GetMapping("/mypage")
		public ModelAndView myPage() {
			User member = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			AwsS3 awsS3 = AwsS3.getInstance();
			ModelAndView mv = new ModelAndView();
			
			String key = member.getUniversityCode()+"/user/"+member.getMemberId()+"/"+member.getMemberId() + ".jpg";
			//여기서 내 정보 조회까지 작업해서 뷰에 올린다
//			Member member = null;
//			String memberid = principal.getName();
//			member = memberservice.getMemberById(memberid);
			
			String fileUrl = "https://d37qu1avlirbuh.cloudfront.net/" + key;
			mv.setViewName("member/mypage/mypageHome");
			mv.addObject("member", member);	
			mv.addObject("url",fileUrl);
			return mv;
		}
		
		//마이페이지 - 정보수정
		@GetMapping("/mypage/modify")
		public String myPageModify() {
			return "member/mypage/modifyInfo";
		}
		
		//마이페이지 - 정보수정 (제출 시)
		@PostMapping("/mypage/modify")
		public String myPageModifySubmit(Model model, Principal principal,
										@RequestParam("password") String password, 
										@RequestParam("email") String email,
										@RequestParam("phone") String phone,
										@RequestParam("parentsPhone") String parentsPhone,
										@RequestParam("file") MultipartFile multipartfile) throws IOException {
			
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Member m = new Member(user);
			m.setPassword(password);
			m.setEmail(email);
			m.setPhone(phone);
			m.setParentsPhone(parentsPhone);
			System.out.println("정보제출 컨트롤러 : " + m);
			int result = memberservice.editMember(m, multipartfile);
			
			
			String msg = "";
			String url = "";
			String icon = "";
			if (result > 0) {
				icon = "success";
				msg = "정보 수정 완료";
				url = "/mypage";
			} else {
				icon = "error";
				msg = "문제가 발생했어요";
				url = "/mypage/modify";
			}
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			model.addAttribute("icon", icon);
			return "/common/redirect";
		}
		
		@PreAuthorize("isAuthenticated()")
		@GetMapping("/mypage/mychart")
		public String mychart(Model model) {
			return "member/mypage/myChart";
		}
}
