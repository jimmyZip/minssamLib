package com.books.controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.books.common.search.BookSearch;
import com.books.common.search.BookSerachMapping;
import com.books.model.domain.book.Book;
import com.books.model.domain.book.Review;
import com.books.model.domain.book.Score;
import com.books.model.domain.member.Member;
import com.books.model.domain.member.Searchbook;
import com.books.model.service.book.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	BookSerachMapping mapping;
	@Autowired
	BookSearch bookSearch;
	@Autowired
	private ReviewService reviewService;
	
	//리뷰 쓰기 페이지로 이동
	//@RequestMapping(value="/book/reviews/{isbn}",method=RequestMethod.GET)
	//public String insertPage(HttpServletRequest request,@PathVariable("isbn") String isbn) {
	//	Review review = new Review();
	//	review.setIsbn(isbn);
	//	review.setMember((Member)request.getSession().getAttribute("member"));
	//	return "/review/review_write.jsp?isbn="+isbn;		
	//}
	@RequestMapping(value="/book/reviews/{isbn}",method=RequestMethod.GET)
	public ModelAndView insertPage(HttpServletRequest request,@PathVariable("isbn") String isbn) {
		System.out.println("리뷰 작성페이지로 이동 요청, isbn은"+isbn);
		List<Book> detailList = mapping.mapping((bookSearch.search(isbn)));	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/review_write");
		mav.addObject("isbn", isbn);
		mav.addObject("detailList",detailList);
		return mav;	
	}
	//리뷰 1건 등록
	@RequestMapping(value="/review/write",method=RequestMethod.POST)
	public String insert(Review review) {
		//System.out.println("리뷰를 작성하는 멤버"+member.getMember_id());
		reviewService.insert(review);
		//http://localhost:8080/book/search/detail/9788932030050, 여기로 다시 가야함
		//return "redirect:/books/bookDetail.jsp";
		String isbn = review.getIsbn();
		return "redirect:/book/search/detail/"+isbn;
	}
	
	//리뷰 목록보기요청
	@RequestMapping(value="/review/list",method=RequestMethod.GET)
	public ModelAndView selectAll() {
		System.out.println("리뷰 컨트롤러 목록보기 요청");
		List<Review> reviewList = reviewService.selectAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/reviewlist");
		return mav;
	}
}
