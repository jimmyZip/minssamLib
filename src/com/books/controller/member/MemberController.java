package com.books.controller.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.books.exception.RegistFailException;
import com.books.model.domain.member.Member;
import com.books.model.service.member.MemberService;


@Controller
//@RequestMapping("/rest")//공통
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/rest/members",method=RequestMethod.POST)
	@ResponseBody//응답시 ViewResolver가 관여되지 않음... 따라서 jsp로 조합되는일은 없다.. 반환값 자체가 곧 응답데이터이다
	public String regist(Member member) {
		memberService.insert(member);
		return "{\"resultCode\":1,\"msg\":\"등록성공\"}";
	}
	
	@RequestMapping(value="/member/login", method = RequestMethod.POST)
	public String login(Member member, HttpServletRequest request) {

		Member obj = memberService.loginCheck(member);
		// 세션에 담기!
		request.getSession().setAttribute("member", obj);

		return "redirect:/index.jsp";
	}
	
	
	@ExceptionHandler(RegistFailException.class)
	@ResponseBody
	public String handleRegistFail(RegistFailException e) {
		
		return "{\"resultCode\":0,\"msg\":\""+e+"\"}";
	}
	

}
