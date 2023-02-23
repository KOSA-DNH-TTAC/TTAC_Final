package kr.or.kosa.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Component
@Log4j
public class LoginAspect {
	
//    @Around("execution(* kr.or.kosa.security.CustomUserDetailService.loadUserByUsername(..))")
//    @Around("execution(* kr.or.kosa.security..*.*(..))")
//	@Pointcut("execution(* kr.or.kosa.security..*.*(..))")
//	@Pointcut("execution(* kr.or.kosa..*(..))")
//	@Pointcut("execution(* kr.or.kosa.security..*.*(..))")
//	 @Pointcut("execution(* kr.or.kosa.security.CustomUserDetailService.loadUserByUsername(String))")
	@Pointcut("execution(* kr.or.kosa.utils.VisitorInfo.*(..))")
	public void logMe() {}
    
	@AfterReturning(value = "logMe()", returning = "returnValue")
    public void aroundLoadUserByUsername(JoinPoint joinPoint, Object returnValue) throws Throwable {

    	log.info("==================================== AOP : 로그인 ======================================");
		log.info(returnValue);
		log.info("=========================================================================================");
    }

	/*
	  public Object aroundLoadUserByUsername(ProceedingJoinPoint joinPoint) throws Throwable {

//	        log.info("Called method : {}", joinPoint.getSignature().getName());
	        log.info("???");
	        log.info("파라미터 : " + joinPoint.getArgs());
//	        log.info("With arguments : {}", joinPoint.getArgs());

	        System.out.println("제발 ㅠㅠ");
	        Object result = joinPoint.proceed();

	        log.info("리턴 : " + result);
//	        log.info("Returned value : {}", result);

	        return result;
	    }
	    */
/*	
	@Pointcut("execution(* kr.or.kosa.security.CustomUserDetailService.loadUserByUsername(..))")
	public void advicePoint() {}

	@Around("advicePoint()")
	public Object aroundLoadUserByUsername(ProceedingJoinPoint pjp) {
		System.out.println("제발 !!!");
		System.out.println("pjp...?" + pjp.getSignature());
		log.info("==================Around==============");
		log.info("로그인 시도에 이용된 유저 정보 : " + pjp.getArgs());
		
		Object result = null;
		
		try {
			result = pjp.proceed();
		}catch (Throwable e) {
			log.info("에러! " + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	//리턴 객체가 있는 경우
	@AfterReturning(value = "advicePoint()", returning = "returnValue")
	public void logAfter(JoinPoint joinPoint, Object returnValue) {
		System.out.println("ㅈ발 !!");
		 log.info("=============AfterReturning================");
		 log.info("리턴값 : " + returnValue);
	}
	*/
}
