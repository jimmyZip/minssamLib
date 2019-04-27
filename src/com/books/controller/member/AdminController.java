package com.books.controller.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.books.model.domain.member.Member;

@Controller
public class AdminController {

	@RequestMapping(value = "/admin/main", method = RequestMethod.GET)
	public ModelAndView showMain(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/adminMain");
		Member member = (Member) request.getSession().getAttribute("member");
		request.getSession().setAttribute("auth", member.getAuth());
		return mav;		
	}
	
	@RequestMapping(value = "/admin/assign", method = RequestMethod.GET)
	public ModelAndView showAuth(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_assign");
		return mav;		
	}
	
	@RequestMapping(value = "/admin/member", method = RequestMethod.GET)
	public ModelAndView showMember(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_member");
		return mav;		
	}
	
	@RequestMapping(value = "/admin/review", method = RequestMethod.GET)
	public ModelAndView showReview(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_review");
		return mav;		
	}
	
	@RequestMapping(value = "/admin/review_comment", method = RequestMethod.GET)
	public ModelAndView showReviewComment(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_review_comment");
		return mav;		
	}
	
	@RequestMapping(value = "/admin/book_comment", method = RequestMethod.GET)
	public ModelAndView showBookComment(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_book_comment");
		return mav;		
	}
	
}
