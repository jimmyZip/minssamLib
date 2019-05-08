package com.books.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.web.servlet.ModelAndView;

import com.books.model.domain.member.Auth;
import com.books.model.domain.member.Member;

@Aspect
public class AnnotationAdminAspect {
	@Pointcut("execution(public * com.books.controller.admin.AdminAssign*.showAuth(..))")
	public void checkAssign() {
	}

	@Pointcut("execution(public * com.books.controller.admin.AdminMember*.show*(..))")
	public void checkMember() {
	}

	@Pointcut("execution(public * com.books.controller.admin.AdminReviewCon*.show*(..))")
	public void checkReview() {
	}

	@Pointcut("execution(public * com.books.controller.admin.AdminReviewCom*.show*(..))")
	public void checkComment() {
	}

	@Around("checkAssign()")
	public ModelAndView assignCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		ModelAndView mav = null;
		HttpServletRequest request = null;

		Object[] objArray = joinPoint.getArgs();

		for (Object obj : objArray) {
			if (obj instanceof HttpServletRequest) {
				request = (HttpServletRequest) obj;
			}
		}
		Member member = (Member) request.getSession().getAttribute("member");
		if (member != null) {
			Auth auth = member.getAuth();
			if (auth.isAdmin_assign()) {
				mav = (ModelAndView) joinPoint.proceed();
			} else {
				mav = new ModelAndView(getIndex());
			}
		} else {
			mav = new ModelAndView(getIndex());
		}

		return mav;
	}

	@Around("checkMember()")
	public ModelAndView memberCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		ModelAndView mav = null;
		HttpServletRequest request = null;

		Object[] objArray = joinPoint.getArgs();

		for (Object obj : objArray) {
			if (obj instanceof HttpServletRequest) {
				request = (HttpServletRequest) obj;
			}
		}
		Member member = (Member) request.getSession().getAttribute("member");
		if (member != null) {
			Auth auth = member.getAuth();
			if (auth.isMember_del()) {
				mav = (ModelAndView) joinPoint.proceed();
			} else {
				mav = new ModelAndView(getIndex());
			}
		} else {
			mav = new ModelAndView(getIndex());
		}

		return mav;
	}

	@Around("checkReview()")
	public ModelAndView reviewCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		ModelAndView mav = null;
		HttpServletRequest request = null;

		Object[] objArray = joinPoint.getArgs();

		for (Object obj : objArray) {
			if (obj instanceof HttpServletRequest) {
				request = (HttpServletRequest) obj;
			}
		}
		Member member = (Member) request.getSession().getAttribute("member");
		if (member != null) {
			Auth auth = member.getAuth();
			if (auth.isReview_del()) {
				mav = (ModelAndView) joinPoint.proceed();
			} else {
				mav = new ModelAndView(getIndex());
			}
		} else {
			mav = new ModelAndView(getIndex());
		}

		return mav;
	}

	@Around("checkComment()")
	public ModelAndView commentCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		ModelAndView mav = null;
		HttpServletRequest request = null;

		Object[] objArray = joinPoint.getArgs();

		for (Object obj : objArray) {
			if (obj instanceof HttpServletRequest) {
				request = (HttpServletRequest) obj;
			}
		}
		Member member = (Member) request.getSession().getAttribute("member");
		if (member != null) {
			Auth auth = member.getAuth();
			if (auth.isReview_comment_del()) {
				mav = (ModelAndView) joinPoint.proceed();
			} else {
				mav = new ModelAndView(getIndex());
			}
		} else {
			mav = new ModelAndView(getIndex());
		}

		return mav;
	}
	
	private String getIndex() {
		return "admin/login_error";
	}

}
