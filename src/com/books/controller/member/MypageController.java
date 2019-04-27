package com.books.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value="/member/mypage/{member_id}",method=RequestMethod.GET)
	public ModelAndView markAll(HttpServletRequest request, @PathVariable("member_id") String member_id) {
		System.out.println("markAll 호출했다개");
		Member member = (Member) request.getAttribute("member");
		System.out.println(member+"받았다개");
		List markList=bookmarkService.selectByMember(Integer.parseInt(member_id));
		System.out.println(markList.size()+"리스트랭스\n"+member_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/mypage");
		mav.addObject("markList", markList);
		return mav;
	}
	
}





