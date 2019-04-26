package com.books.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.books.model.domain.member.Member;
import com.books.model.service.member.BookmarkService;
import com.books.model.service.member.MemberService;


 @Controller 
 public class MypageController {
	 
	
 	@Autowired
	private BookmarkService bookmarkService;
 
 	@Autowired 
 	private MemberService memberService;
 
 	@RequestMapping(value="/member/mypage",method=RequestMethod.GET)
 	public ModelAndView markAll(HttpServletRequest request) { 
 		Member member = (Member)request.getAttribute("member"); 
 		List markList=bookmarkService.selectByMember(member.getMember_id()); 
 		ModelAndView mav = new ModelAndView(); 
 		mav.setViewName("member/mypage");
 		mav.addObject("markList", markList); 
 		return mav; 
	}
 	
}





