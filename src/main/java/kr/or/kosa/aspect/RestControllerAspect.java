package kr.or.kosa.aspect;

import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class RestControllerAspect {

    /**
     * Controller 클래스 프록시
     * @param proceedingJoinPoint
     * @return
     * @throws Throwable
     */
	/*
	 * 
	 * https://sas-study.tistory.com/355
	 * 이 블로그는 응답을 200과 500과 같이 성공/예외로 나눠서
	 * response자체를 클래스로 따로 정의해뒀음
	 * 어케할지 고민해볼게~
    @Around("execution(* com.cowork.dutystem.controller.*.*(..))")
    public SuccessResponse<Object> restResponseHandler(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        return new SuccessResponse<>(HttpStatus.OK.value(), "request success", proceedingJoinPoint.proceed());
    }
    */
}
