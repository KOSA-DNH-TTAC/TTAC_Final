package kr.or.kosa.aspect;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

//@ControllerAdvice
public class MyControllerAdvice {
	
	@ExceptionHandler(Exception.class)
	public String handleException(Exception e) {
		System.out.println("From controllerAdvice : " + e.getMessage());
		e.printStackTrace();
		//왜 리턴이 안될까??....
		return "common/errorPage";
	}	
}
