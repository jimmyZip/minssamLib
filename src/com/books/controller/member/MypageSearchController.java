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
import com.books.model.domain.member.Member;
import com.books.model.domain.member.Searchbook;
import com.books.model.service.member.SearchbookService;

@Controller
public class MypageSearchController {

	@Autowired
	BookSerachMapping mapping;
	@Autowired
	BookSearch bookSearch;
	@Autowired
	SearchbookService searchbookService;
	Pager pager = new Pager();
	
	@RequestMapping(value="/member/searchHistory",method=RequestMethod.GET)
	public ModelAndView searchAll(HttpServletRequest request) { 
		Member member=(Member)request.getSession().getAttribute("member"); 
		ArrayList searchHistory;
		//String currentPage =	(String)request.getAttribute("currentPage"); 
		ModelAndView mav = new ModelAndView("member/searchHistory"); 
		try {	 
			searchHistory=(ArrayList) searchbookService.selectByMember(member.getMember_id());
			
		}catch (NullPointerException e) { 
			mav.setViewName("member/login/error");
			e.printStackTrace();
			return mav;
	}
		
		mav.setViewName("member/searchHistory");
		mav.addObject("searchHistory",searchHistory);
		return mav; 
	}
	
	@RequestMapping(value="/member/mypage/searchHistory", method=RequestMethod.GET)
	@ResponseBody																			// @PathVariable("currentPage") int currentPage
	public List<Searchbook> searchList(HttpServletRequest request){
		Member member = (Member)request.getSession().getAttribute("member");
		List<Searchbook> bookSearchList;
		pager.getCurrentPage();
		bookSearchList = searchbookService.selectByMember(member.getMember_id());
		List<Searchbook> searchList = new ArrayList();
		pager.init(request, bookSearchList.size());
		
		int curPos = pager.getCurPos();
		int num = pager.getNum();
		for(int i=0; i<pager.getPageSize(); i++) {
			if(num<1) break;
			searchList.add(bookSearchList.get(curPos++));
			num--;	
		}
		
		for(int i=0; i<searchList.size(); i++) {
			String isbn = searchList.get(i).getIsbn();
			searchList.get(i).setBook(mapping.mapping(bookSearch.search(isbn)).get(0));
		}//setBook(mapping.mapping(bookSearch.search(isbn)).get(0));
		
		System.out.println("ÀÛµ¿2");
		return searchList;
	}
	
	@RequestMapping(value="/member/mypage/searchHistory/{searchbook_id}", method=RequestMethod.DELETE)
	@ResponseBody
	public String deleteSearch(@PathVariable("searchbook_id") int searchbook_id) {
		searchbookService.delete(searchbook_id);
		
		return null;
	}
}
