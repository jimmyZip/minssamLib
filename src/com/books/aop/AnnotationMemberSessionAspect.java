package com.books.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class AnnotationMemberSessionAspect {
	//xml이 없기때문에 위치(pointcut)와 때(advice)를 자바코드에 지정
	@Pointcut("execution(public * com.books.controller.member.MemberController..*(..))")
	public void checkMember() {}//아이디 역할
	/*
	 * @Pointcut("execution(public * com.books.controller.BoardController..*(..))")
	 * public void checkBoard() {}//
	 * 
	 * @Pointcut("execution(public * com.books.controller.ProductController..*(..))"
	 * ) public void checkProduct() {}//
	 */	//아래의 배열에 들어있는 요청 URL에 대해서는 세션체크를 피해가자
	String[] exceptList= {
		"/member/login",
		"/member/contact",//고객센터
	};
	
	//공통 로직코드
	//로그인이 필요한 세션을보유한 호출만 처리해야한다
	@Around("checkMember()")
	public String loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		//모두체크하지말고세션의 존재를 체크하는 경우에만 한정
		//판단기준?? 결국 HttpServletRequest가 넘어오는지 여부
		String viewName=null;
		HttpServletRequest request=null;
		int count=0;//명단에 존재할 경우 증가시키자!
		Object[] objArray = joinPoint.getArgs();//메서드 호출시 전달된 매개변수를 반환
		String requestURL=null;
		for(Object obj :objArray) {//모든 매개변수 조사(리퀘스트 객체인지 여부)
			 if(obj instanceof HttpServletRequest) {
				 request=(HttpServletRequest)obj;
				 requestURL=request.getRequestURL().toString();
				 System.out.println("지금 들어온 요청"+requestURL);
				 requestURL.endsWith("/member/login");
				for(int i=0;i<exceptList.length;i++) {
					if(requestURL.endsWith(exceptList[i])) {
						count++;//제외명단 발견
					}
				}
			}
		}
		

		
		//로그인이 필요한 메서드 호출시만 세션 체크
		if(request!=null&& count==0) {
			if(request.getSession().getAttribute("member")==null) {
				viewName="member/login/error";
				String methodName = joinPoint.getSignature().getName();
				System.out.println("로그인 필요:호출된 원래 메서드는"+methodName+",메서드의 반환 값은 "+viewName);
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

