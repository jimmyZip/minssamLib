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
	public String showMain(HttpServletRequest request) {
		Member member = (Member) request.getSession().getAttribute("member");
		request.getSession().setAttribute("auth", member.getAuth());
		return "admin/adminMain";		
	}
}
