package kr.or.kosa.dao;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FrontController {
	
	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);

	@GetMapping("")
	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
		return "index";
	}
	
	@GetMapping("/mypage")
	public String myPage() {
		
		return "client/mypage";
	}
	
	@GetMapping("/community")
	public String community() {
		
		return "client/community";
	}
	
	@GetMapping("/mealticket")
	public String mealticket() {
		
		return "client/mealticket";
	}
	
	@GetMapping("/application")
	public String application() {
		
		return "client/application";
	}
	
}
