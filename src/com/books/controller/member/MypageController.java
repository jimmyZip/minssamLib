package com.books.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.books.common.Pager;
import com.books.common.member.Admin;
import com.books.common.search.BookSerachMapping;
import com.books.model.domain.member.Bookmark;
import com.books.model.domain.member.Member;
import com.books.model.service.member.BookmarkService;
import com.books.model.service.member.MemberService;

@Controller
public class MypageController {

	@Autowired
	private BookmarkService bookmarkService;
	
	@Autowired 
	private MemberService memberService;
	
	@Autowired
	private Admin commonAdmin;
	
	
	//Member member;
	Pager pager=new Pager();
	//{currentPage}
	//, @PathVariable("currentPage") String currentPage
	@RequestMapping(value="/member/mypage/{currentPage}",method=RequestMethod.GET)
	public ModelAndView markAll(HttpServletRequest request, @PathVariable("currentPage") String currentPage) {
		List<Bookmark> userList;
		List markList;
		Member member = (Member) request.getSession().getAttribute("member");
		
		ModelAndView mav = new ModelAndView();
		try {
			userList = bookmarkService.selectByMember(member.getMember_id());
			pager.init(request, userList.size());
			if(userList.size()>0) {
				
			}
			System.out.println(userList);
		} catch (NullPointerException e) {
			e.printStackTrace();
			mav.setViewName("member/login/error");
			return mav;
		}
		
		mav.setViewName("member/mypage");
		mav.addObject("userList", userList);
		return mav;
	}
	
	// 어드민 페이지 이동 용도
	@RequestMapping(value = "/admin/main", method = RequestMethod.GET)
	public ModelAndView adminMain(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member member = (Member) request.getSession().getAttribute("member");
		request.getSession().setAttribute("auth", member.getAuth());
		if(commonAdmin.adminCheck(member.getAuth())) { // 어드민인지 한번 더 확인해서
			mav.setViewName("admin/adminMain"); // 어드민이면 관리자 메인 페이지로
		}else {
			mav.setViewName("/"); // 아니면 인덱스로 이동
		}
		return mav;		
	}
}





