package com.books.controller.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.books.common.search.BookSearch;

@Controller
public class BookSearchController {
	BookSearch bookSearch = new BookSearch();
	
	@RequestMapping(value="/book/search", method=RequestMethod.GET)
	public ModelAndView searchResult() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("books/bookSearchList");
		mav.addObject("searchResult", null);
		return mav;
	}
	
}
