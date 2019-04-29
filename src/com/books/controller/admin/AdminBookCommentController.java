package com.books.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminBookCommentController {
	
	@RequestMapping(value = "/admin/book_comment/page", method = RequestMethod.GET)
	public ModelAndView showBookComment(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_book_comment");
		return mav;
	}
}
