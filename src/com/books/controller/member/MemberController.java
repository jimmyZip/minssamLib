package com.books.controller.member;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.books.common.SecurityBean;
import com.books.exception.RegistFailException;
import com.books.model.domain.member.Member;
import com.books.model.service.member.MemberService;


@Controller
//@RequestMapping("/rest")//공통
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	SecurityBean security;
	
	@RequestMapping(value="/member/regist",method=RequestMethod.POST)
	public String regist(Member member) {
		
		member.setPass(security.textToHash(member.getPass()));
		System.out.println(member.getPass());
		memberService.insert(member);

		return "redirect:/index.jsp";
	}
	@RequestMapping(value="/member/edit",method=RequestMethod.POST)
	public String edit(Member member) {
		member.setPass(security.textToHash(member.getPass()));
		memberService.update(member);

		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="/member/login", method = RequestMethod.POST)
	public String login(Member member, HttpServletRequest request) {

		member.setPass(security.textToHash(member.getPass()));
		Member obj = memberService.loginCheck(member);
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
	
	@RequestMapping(value="/rest/member/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(String id) {
		//회원가입할때 중복을 체크하자
		String result;
		Member member = memberService.idCheck(id);
		//System.out.println("멤버아이디"+member.getId());
		if(member==null) {
			result="중복없음";
			System.out.println(result);
		}else {
			result="중복있음";
			System.out.println(result);
		}
		//System.out.println("id="+id);
		//System.out.println("member="+member);
		System.out.println("보내는거"+result);
		return result;
	}
	
	@RequestMapping(value="/rest/member/emailCheck", method = RequestMethod.POST)
	@ResponseBody
	public String emailCheck(String email) {
		//회원가입할때 중복을 체크하자
		String result;
		System.out.println("이메일:"+email);
		Member member = memberService.emailCheck(email);
		//System.out.println("멤버아이디"+member.getId());
		if(member==null) {
			result="중복없음";
			//System.out.println(result);
		}else {
			result="중복있음";
			//System.out.println(result);
		}
		//System.out.println("id="+id);
		//System.out.println("member="+member);
		//System.out.println("보내는거"+result);
		return result;
	}	
	
	@RequestMapping(value="/rest/member/passCheck", method = RequestMethod.POST)
	@ResponseBody
	public String passCheck(String pass) {
		//회원가입할때 중복을 체크하자
		String result;
		pass = security.textToHash(pass);
		Member member = memberService.passCheck(pass);
		if(member==null) {
			result="일치하지않음";
		}else {
			result="일치함";
		}
		return result;
	}	
	
}



