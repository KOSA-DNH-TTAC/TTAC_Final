package kr.or.kosa.security;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AuthInterceptor implements HandlerInterceptor {
	// preHandle : 컨트롤러 실행 전, 즉 컨트롤러로 request 들어가기 전에 수행한다.
	// 그리고 리턴할 때 true이면 컨트롤러 uri로 가고, false이면 컨트롤러 요청을 하지 않는다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws IOException {
		HttpSession session = request.getSession();
		String id = session.getId();

		if (id == null) {
			response.sendRedirect(request.getContextPath() + "/userlogin");
			return false;
		}
		return true;
	}
}
