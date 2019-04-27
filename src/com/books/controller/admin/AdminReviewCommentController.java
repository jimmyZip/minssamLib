package com.books.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminReviewCommentController {
	
	@RequestMapping(value = "/admin/review_comment", method = RequestMethod.GET)
	public ModelAndView showReviewComment(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_review_comment");
		return mav;
	}
}
