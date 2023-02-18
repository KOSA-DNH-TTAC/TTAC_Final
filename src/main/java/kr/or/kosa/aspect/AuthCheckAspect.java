package kr.or.kosa.aspect;

import java.lang.reflect.Method;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import kr.or.kosa.security.User;

@Aspect
@Component
public class AuthCheckAspect {
	
//	@Before("within(*kr.or.kosa..*)")
//	@Pointcut("execution(* kr.or.kosa..*(..))")
	@Pointcut("within(*kr.or.kosa..*)")
	public void logBefore() {}
	
	@Around("logBefore()")
//	public Object Before(JoinPoint joinPoint) {
	public Object Before(ProceedingJoinPoint pjp) {
	    Object returnObj = null;
		try {
			returnObj = pjp.proceed();
		} catch (Throwable e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
//		System.out.println("aop!!!!!");
//		MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
//        Method method = methodSignature.getMethod();
//        System.out.println("@Before : " + method.getName() + " 메서드 실행");
		try {
			//흠 ㅜㅜ
//			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		} catch (Exception e) {
			System.out.println("from aspect : " + e.getMessage());
			return "common/login";
		}
		return returnObj;
	}
	
}
