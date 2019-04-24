package com.books.controller.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	@RequestMapping(value="/book/search", method=RequestMethod.GET)
	public ModelAndView search() {
		System.out.println("¼­Ä¡");
		ModelAndView mav = new ModelAndView("books/bookSearchList");
		mav.addObject("searchResult", null);
		return mav;	
	}
}
