package com.books.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AdviceName;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.web.servlet.mvc.method.annotation.ViewNameMethodReturnValueHandler;

/*xml과 어노테이션기반 aop는 처리기능이 동일하며 단지, 선호도에 따라 개발자가 원하는 방법을 선택하면 된다.
 * 
 */
@Aspect
public class AnnotationAdminSessionAspect {
	//xml이 없기때문에 위치(pointcut)와 때(advice)를 자바코드에 지정
	@Pointcut("execution(public * com.itbank.controller..*(..))")
	public void checkMember() {}//아이디 역할
	//public void checkBoard() {}//아이디 역할
	//public void checkProduct() {}//아이디 역할
	//공통 로직코드
	//로그인이 필요한 세션을보유한 호출만 처리해야한다
	@Around("checkMember()")
	public String loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		//모두체크하지말고세션의 존재를 체크하는 경우에만 한정
		//판단기준?? 결국 HttpServletRequest가 넘어오는지 여부
		String viewName=null;
		HttpServletRequest request=null;
		Object[] objArray = joinPoint.getArgs();//메서드 호출시 전달된 매개변수를 반환
		for(Object obj :objArray) {//모든 매개변수 조사(리퀘스트 객체인지 여부)
			 if(obj instanceof HttpServletRequest) {
				 request=(HttpServletRequest)obj;
			 }
		}
		//로그인이 필요한 메서드 호출시만 세션 체크
		if(request!=null) {
			if(request.getSession().getAttribute("admin")==null) {
				viewName="admin/login/error";
			}else {
				viewName=(String)joinPoint.proceed();
				String methodName = joinPoint.getSignature().getName();
				System.out.println("로그인 필요:호출된 원래 메서드는"+methodName+",메서드의 반환 값은 "+viewName);
			}
		}else {
			viewName=(String) joinPoint.proceed();
			String methodName = joinPoint.getSignature().getName();
			System.out.println("로그인 불필요:호출된 원래 메서드는"+methodName+",메서드의 반환 값은 "+viewName);
		}
		
		
		return viewName;		
	}
}







