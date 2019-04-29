package com.books.controller.book;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.books.common.search.BookSearch;
import com.books.model.domain.member.Member;
import com.books.model.domain.member.Searchbook;
import com.books.model.service.member.SearchbookService;

@Controller
public class BookSearchController {
	BookSearch bookSearch = new BookSearch();
	
	@Autowired
	SearchbookService searchbookService;
	
	
	@RequestMapping(value="/book/search", method=RequestMethod.GET)
	public ModelAndView searchResult() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("books/bookSearchList");
		mav.addObject("searchResult", null);
		return mav;
	}
	
	@RequestMapping(value="/book/search/insert", method=RequestMethod.GET)
	@ResponseBody
	public void insertSearch(HttpServletRequest request, String isbn) {
		Searchbook searchbook = new Searchbook();
		searchbook.setIsbn(isbn);
		searchbook.setMember((Member)request.getSession().getAttribute("member"));
		Searchbook result = searchbookService.check(searchbook);
		if(result != null) { // 중복된 값 있으면 지웠다가 다시 등록
			searchbookService.delete(result.getSearchbook_id());
		}
		searchbookService.insert(searchbook);
	}
	
	
}
