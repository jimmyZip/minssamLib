/*
* 책 검색할 때 사용하는 컨트롤러
 * */
package com.books.controller.book;

import java.util.ArrayList;
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
import com.books.model.domain.book.Review;
import com.books.model.domain.book.ReviewComment;
import com.books.model.service.book.ReviewCommentService;
import com.books.model.service.book.ReviewService;

@Controller
public class SearchController {
	@Autowired
	BookSerachMapping mapping;
	@Autowired
	BookSearch bookSearch;
	@Autowired
	ReviewService reviewService;
	@Autowired
	ReviewCommentService reviewCommentService;
	
	Logger logger = Logger.getLogger(this.getClass().getName());
	Pager pager = new Pager();
	
	@RequestMapping(value = "/book/search/{searchWord}/{currentPage}", method = RequestMethod.GET)
	public ModelAndView searchPage(@PathVariable("searchWord") String searchWord, @PathVariable("currentPage") String currentPage) {
		logger.trace("검색 단어 : " + searchWord);
		
		ModelAndView mav = new ModelAndView("books/bookSearchList");
		List<Book> searchList = mapping.mapping((bookSearch.search(searchWord, 10, Integer.parseInt(currentPage)*10-9)));
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
	
	//bookDetail가기
	@RequestMapping(value = "/book/search/detail/{isbn}", method = RequestMethod.GET)
	public ModelAndView showDetail(@PathVariable("isbn") String isbn) {
		logger.trace("SearchController에서 bookDetail이동 요청");
		List<Book> detailList = mapping.mapping((bookSearch.search(isbn)));
		List<Review> reviewList = reviewService.selectByIsbn(isbn);
		ArrayList reviewId = new ArrayList();
		List<ReviewComment> rcList=null;
		for(int i=0;i<reviewList.size();i++) {
			reviewId.add(reviewList.get(i).getReview_id());
			rcList = (List)reviewCommentService.selectByReview((int)reviewId.get(i));
		}
		ModelAndView mav = new ModelAndView("books/bookDetail");
		mav.addObject("detailList", detailList);
		mav.addObject("reviewList", reviewList);
		mav.addObject("rcList", rcList);
		
		return mav;
	}
}
