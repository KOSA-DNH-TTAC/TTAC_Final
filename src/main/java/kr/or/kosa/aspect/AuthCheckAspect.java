package kr.or.kosa.aspect;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import kr.or.kosa.security.User;

//@Aspect
//@Component
public class AuthCheckAspect {
	
//	@Pointcut("within(*kr.or.kosa..*)")
//	public void logBefore() {}
	
	@Pointcut("within(*kr.or.kosa.controller..*)")
	public void controller() {}
	
	@Around("controller()")
	public Object handleLoginRequired(ProceedingJoinPoint joinPoint) throws Throwable {
	   if (!isLoggedIn()) {
		  System.out.println("From aspect : 로그인이 안됐음");
	      return "common/login";
	   }
	   return joinPoint.proceed();
	}
	

//	@AfterThrowing(pointcut="within(*kr.or.kosa.controller..*)",throwing="ex")
//	public void afterThrowing(JoinPoint joinpoint, Throwable e) {
//		System.out.println(joinpoint.getSignature().getName() + "에서 발생한" + e);
//		
//	}
	
//	@Pointcut("within(*kr.or.kosa.service..*)")
//	public void serviceAround() {}
//	
//	@Around("serviceAround()")
//	public Object doServiceAround(ProceedingJoinPoint pjp, HttpServletRequest request, HttpServletResponse response) {
//		Object returnObj = null;
//		try {
//			returnObj = pjp.proceed();
//			if(!isLoggedIn()) {
//				myRedirect(request, response);
//				
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} catch (Throwable e2) {
//			e2.printStackTrace();
//		}
//		
//		return returnObj;
//	}
	
	//리다이렉트 함수
	public void myRedirect(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 response.sendRedirect(request.getContextPath() + "/userlogin");
	}

	    private boolean isLoggedIn() {
	        // 로그인 여부를 판별하는 로직
	    	Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	    	if(!loggedInUser.isAuthenticated()) {
	    		return false;
	    	}else {
	    		return true;
	    	}
	    }
	
	
//	@Around("logBefore()")
//	public Object Before(ProceedingJoinPoint pjp) {
//	    Object returnObj = null;
//
//		try {
//			returnObj = pjp.proceed();
//			System.out.println(returnObj);
//		} catch (ClassCastException e2) {
//			//시큐리티 유저 관련 문제이므로, 로그인 페이지로 이동
//			System.out.println("ClassCastException 발생 ~~ 로그인페이지로 이동합니다");
//			
//			//이 리턴은 근데...컨트롤러에서 났을 경우에만 이동이 됨
//			//서비스의 경우 responseEntity를 리턴하기 때문에 이동이 안됨...어캄?ㄷㄷ
//			return "common/login";
//		}catch (Throwable e1) {
//			System.out.println("from aspect : " + e1.getMessage());
//			e1.printStackTrace();
//		}
//		
//		return returnObj;
//	}
	
//	@Before("within(*kr.or.kosa..*)")
//	@Pointcut("execution(* kr.or.kosa..*(..))")
//	@Pointcut("within(*kr.or.kosa..*)")
//	public void logBefore() {}
//	
//	@Around("logBefore()")
////	public Object Before(JoinPoint joinPoint) {
//	public Object Before(ProceedingJoinPoint pjp) {
//	    Object returnObj = null;
//		try {
//			returnObj = pjp.proceed();
//		} catch (Throwable e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
////		System.out.println("aop!!!!!");
////		MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
////        Method method = methodSignature.getMethod();
////        System.out.println("@Before : " + method.getName() + " 메서드 실행");
//		try {
//			//흠 ㅜㅜ
////			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		} catch (Exception e) {
//			System.out.println("from aspect : " + e.getMessage());
//			return "common/login";
//		}
//		return returnObj;
//	}
}
