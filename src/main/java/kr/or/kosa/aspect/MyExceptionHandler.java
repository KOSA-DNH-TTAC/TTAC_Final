package kr.or.kosa.aspect;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

//@RestControllerAdvice
public class MyExceptionHandler {
	
	@ExceptionHandler(Exception.class)
    public void handleMyException(Exception ex) {
        // 예외 처리 로직 수행
        
		
		System.out.println("From RectControllerAdvice... : " + ex.getMessage());
    }

	/*
	@ExceptionHandler(Exception.class)
    public ResponseEntity<String> handleMyException(Exception ex) {
        // 예외 처리 로직 수행
        // ...
		System.out.println("From RestControllerAdvice..." + ex.getMessage());
        // ResponseEntity 반환
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("예외 발생");
    }
    */
}
