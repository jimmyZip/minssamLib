package com.books.controller.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PopularBookController {
	
	@RequestMapping(value="/book/popular",method=RequestMethod.GET)
	public ModelAndView searchResult() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("books/popular");
		mav.addObject("apiSearchResult", null);
		return mav;
	}
}
