package com.books.controller.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.books.exception.RegistFailException;
import com.books.model.domain.member.Member;
import com.books.model.service.member.MemberService;


@Controller
//@RequestMapping("/rest")//공통
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/member/regist",method=RequestMethod.POST)
	public String regist(Member member) {
		
		memberService.insert(member);

		return "redirect:/index.jsp";
	}
	@RequestMapping(value="/member/edit",method=RequestMethod.POST)
	public String edit(Member member) {
		
		memberService.update(member);

		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="/member/login", method = RequestMethod.POST)
	public String login(Member member, HttpServletRequest request) {

		Member obj = memberService.loginCheck(member);
		System.out.println("obj : "+obj.getName());
		// 세션에 담기!
		request.getSession().setAttribute("member", obj);
		
	
		return "redirect:/index.jsp";
	}
	@RequestMapping(value="/member/modify",method=RequestMethod.GET)
	public ModelAndView select(int member_id) {
		System.out.println("넘어온 member_id:" + member_id);
		Member member = memberService.select(member_id);
		ModelAndView mav = new ModelAndView("member/detail");
		mav.addObject("board",member);
		return mav;
	}
}
