package com.books.controller.book;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.books.common.Pager;
import com.books.common.search.BookSearch;
import com.books.common.search.BookSerachMapping;
import com.books.model.domain.book.Book;

@Controller
public class SearchController {
	@Autowired
	BookSerachMapping mapping;
	@Autowired
	BookSearch bookSearch;
	Logger logger = Logger.getLogger(this.getClass().getName());
	Pager pager = new Pager();
	
	@RequestMapping(value = "/book/search/{searchWord}/{currentPage}", method = RequestMethod.GET)
	public ModelAndView searchPage(@PathVariable("searchWord") String searchWord, @PathVariable("currentPage") String currentPage) {
		logger.trace("검색 단어 : " + searchWord);
		
		ModelAndView mav = new ModelAndView("books/bookSearchList");
		List<Book> searchList = mapping.mapping((bookSearch.search(searchWord, 10, Integer.parseInt(currentPage)*10)));
		if(searchList.size()>0){ // 페이징 처리
			pager.searchInit(Integer.parseInt(currentPage), searchList.get(0).getTotal());
		}else{	// 검색 결과 없으면 그냥 하나만 있는것처럼 간주
			pager.searchInit(1,1);
		}
		mav.addObject("searchList", searchList);
		mav.addObject("searchWord", searchWord);
		mav.addObject("pager", pager);
		return mav;
	}
}
