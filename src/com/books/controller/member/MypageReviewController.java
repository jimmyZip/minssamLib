package com.books.controller.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.books.common.Pager;
import com.books.common.search.BookSearch;
import com.books.common.search.BookSerachMapping;
import com.books.model.domain.book.Review;
import com.books.model.domain.member.Member;
import com.books.model.domain.member.Searchbook;
import com.books.model.service.book.ReviewService;

@Controller
public class MypageReviewController {
	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private BookSerachMapping mapping;
	@Autowired
	private BookSearch bookSearch;
	
	Pager pager= new Pager();
	
	@RequestMapping(value="/member/review",method=RequestMethod.GET)
	public ModelAndView reviewAll(HttpServletRequest request) { 
		Member member=(Member)request.getSession().getAttribute("member"); 
		ArrayList review;
		//String currentPage =	(String)request.getAttribute("currentPage"); 
		ModelAndView mav = new ModelAndView();
		try {	 
			review=(ArrayList) reviewService.selectByMember(member.getMember_id());
			
		}catch (NullPointerException e) { 
			mav.setViewName("member/login/error");
			e.printStackTrace();
			return mav;
	}
		
		mav.setViewName("member/review");
		mav.addObject("review",review);
		return mav; 
	}
	
	@RequestMapping(value="/member/mypage/review", method=RequestMethod.GET)
	@ResponseBody																			// @PathVariable("currentPage") int currentPage
	public List<Review> reviewList(HttpServletRequest request){
		Member member = (Member)request.getSession().getAttribute("member");
		List<Review> reviewAllList;
		pager.getCurrentPage();
		reviewAllList = reviewService.selectByMember(member.getMember_id());
		List<Review> reviewsList = new ArrayList();
		pager.init(request, reviewAllList.size());
		
		//int curPos = pager.getCurPos();
		//int num = pager.getNum();
//		for(int i=0; i<pager.getPageSize(); i++) {
//			if(num<1) break;
//			reviewsList.add(reviewAllList.get(curPos++));
//			num--;	
//		}
		
		for(int i=0; i<reviewAllList.size(); i++) {
			String isbn = reviewAllList.get(i).getIsbn();//searchList.get(i).getIsbn();
			reviewAllList.get(i).setBook(mapping.mapping(bookSearch.search(isbn)).get(0));//setBook(mapping.mapping(bookSearch.search(isbn)).get(0));
		}
		System.out.println("ÀÛµ¿2");
		return reviewAllList;
	}
	@RequestMapping(value="/member/mypage/review/{review_id}", method=RequestMethod.DELETE)
	@ResponseBody
	public String deleteBookmark(@PathVariable("review_id") int review_id) {
		reviewService.delete(review_id);
		
		return null;
	}
	
	
	
}
