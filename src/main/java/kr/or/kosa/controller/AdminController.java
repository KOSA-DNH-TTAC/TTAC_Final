package kr.or.kosa.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.kosa.security.User;

@RequestMapping("/admin")
@Controller
public class AdminController {

	
	@GetMapping("/popular")
	public String admin(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryName = user.getDomitoryName();
		model.addAttribute("domitoryName", domitoryName);
		return "admin/adminPopular";
	}
	@GetMapping("/sleepOverHistory")
	public String adminSleepOverHistory(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryName = user.getDomitoryName();
		model.addAttribute("domitoryName", domitoryName);
		return "admin/adminSleepOverHistory";
	}
	
	@GetMapping("/analyze")
	public String adminAnalyze(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryName = user.getDomitoryName();
		model.addAttribute("domitoryName", domitoryName);
		return "admin/adminAnalyze";
	}
	@GetMapping("/RollCall")
	public String adminRollCall(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryName = user.getDomitoryName();
		model.addAttribute("domitoryName", domitoryName);
		return "admin/adminRollCall";
	}
	
	@GetMapping("/sail")
	public String adminSail(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryName = user.getDomitoryName();
		model.addAttribute("domitoryName", domitoryName);
		return "admin/adminSail";
	}
	
	@GetMapping("/coupon")
	public String adminCoupon(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryName = user.getDomitoryName();
		model.addAttribute("domitoryName", domitoryName);
		return "admin/adminMealCoupon";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/adminMember")
	public String adminMember(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryName = user.getDomitoryName();
		model.addAttribute("domitoryName", domitoryName);
		return "admin/adminMemberList";
	}
	
	@GetMapping("/calendar")
	public String adminCalendar(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryName = user.getDomitoryName();
		model.addAttribute("domitoryName", domitoryName);
		return "admin/adminCalendar";
	}
	
	@GetMapping("/enroll")
	public String adminEnroll(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryName = user.getDomitoryName();
		model.addAttribute("domitoryName", domitoryName);
		return "admin/adminEnroll";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/domitory")
	public String adminDomitory(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryName = user.getDomitoryName();
		model.addAttribute("domitoryName", domitoryName);
		return "admin/adminDomitory";
	}
	
	@GetMapping("/board")
	public String adminBoard(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryName = user.getDomitoryName();
		model.addAttribute("domitoryName", domitoryName);
		return "admin/adminBoard";
	}
	
	@GetMapping("/file")
	public String adminFile(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryName = user.getDomitoryName();
		model.addAttribute("domitoryName", domitoryName);
		return "admin/adminFile";
	}
	
	@GetMapping("/qr")
	public String adminQr(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryName = user.getDomitoryName();
		model.addAttribute("domitoryName", domitoryName);
		return "admin/adminQr";
	}
	
}
