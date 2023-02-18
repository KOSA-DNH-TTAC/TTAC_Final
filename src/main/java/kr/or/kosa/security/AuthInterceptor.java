package kr.or.kosa.security;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AuthInterceptor implements HandlerInterceptor{
	//preHandle : 컨트롤러 실행 전, 즉 컨트롤러로 request 들어가기 전에 수행한다. 
	//그리고 리턴할 때 true이면 컨트롤러 uri로 가고, false이면 컨트롤러 요청을 하지 않는다. 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		HttpSession session = request.getSession();
		String id = session.getId();
		
		if(id == null) {
			response.sendRedirect(request.getContextPath() + "/userlogin");
			return false;
		}
		return true;
	}

	//postHandle : 컨트롤러(핸들러) 실행 하고 나서 뷰 실행 전, 즉 컨트롤러의 핸들러 처리가 끝나 return 되고, 뷰 화면을 response 되기 직전에 postHandle 메서드를 수행한다.
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
//		
//	}
	 

	//afterCompletion 뷰 화면을 response 끝난 뒤에 수행한다. 
}
