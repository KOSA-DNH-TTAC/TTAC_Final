package kr.or.kosa.aspect;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
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

	private static final Log LOG = LogFactory.getLog(LoginAspect.class);

	@Pointcut("execution(* kr.or.kosa.utils.VisitorInfo.*(..))")
	public void logMe() {
	}

	@AfterReturning(value = "logMe()", returning = "returnValue")
	public void aroundLoadUserByUsername(JoinPoint joinPoint, Object returnValue) throws Throwable {

		LOG.info("====== AOP : 로그인 ======");
		LOG.info(returnValue);

		// 콘솔출력용
		log.info("==================================== AOP : 로그인 ======================================");
		log.info(returnValue);
		log.info("=========================================================================================");
	}

}
