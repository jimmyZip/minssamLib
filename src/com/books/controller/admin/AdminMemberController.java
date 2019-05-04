package com.books.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.books.common.Pager;
import com.books.model.domain.member.Auth;
import com.books.model.domain.member.Member;
import com.books.model.service.member.AuthService;
import com.books.model.service.member.MemberService;

@Controller
public class AdminMemberController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	AuthService authService;
	
	Pager pager = new Pager();
	
	@RequestMapping(value = "/admin/member/page", method = RequestMethod.GET)
	public ModelAndView showMember(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_member");
		List<Member> memberList = memberService.selectAll();
		List<Auth> authList = authService.selectAll();
		pager.init(request, memberList.size());
		
		mav.addObject("memberList", memberList);
		mav.addObject("pager", pager);
		mav.addObject("authList", authList);
		return mav;
	}
}
