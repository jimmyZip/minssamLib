package com.books.controller.book;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.books.model.domain.book.Review;
import com.books.model.domain.member.Member;

@Controller
public class ReviewController {
	//리뷰 쓰기 페이지로 이동
	@RequestMapping(value="/book/reviews/{isbn}",method=RequestMethod.GET)
	public String insertPage(HttpServletRequest request,@PathVariable("isbn") String isbn) {
		Review review = new Review();
		review.setIsbn(isbn);
		review.setMember((Member)request.getSession().getAttribute("member"));
		return "/review/review_write.jsp?isbn="+isbn;		
	}
	
}
