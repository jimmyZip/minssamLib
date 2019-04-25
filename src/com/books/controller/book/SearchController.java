package com.books.controller.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	@RequestMapping(value="/book/search/{searchWord}", method=RequestMethod.GET)
	public ModelAndView search(@PathVariable("searchWord") String searchWord) {
		System.out.println("¼­Ä¡" + searchWord);
		ModelAndView mav = new ModelAndView("books/bookSearchList");
		mav.addObject("searchResult", null);
		return mav;	
	}
}
