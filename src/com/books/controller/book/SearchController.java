package com.books.controller.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.books.common.search.BookSearch;
import com.books.common.search.BookSerachMapping;
import com.books.model.domain.book.Book;

@Controller
public class SearchController {
	@Autowired
	BookSerachMapping mapping;
	@Autowired
	BookSearch bookSearch;

	@RequestMapping(value = "/book/search/{searchWord}", method = RequestMethod.GET)
	public ModelAndView search(@PathVariable("searchWord") String searchWord) {
		System.out.println("¼­Ä¡" + searchWord);
		ModelAndView mav = new ModelAndView("books/bookSearchList");
		List<Book> searchList = mapping.mapping((bookSearch.search(searchWord)));
		mav.addObject("searchList", searchList);
		mav.addObject("searchWord", searchWord);
		return mav;
	}
}
