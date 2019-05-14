package com.books.controller.book;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.books.common.Pager;
import com.books.model.domain.book.Review;
import com.books.model.domain.book.ReviewComment;
import com.books.model.domain.member.Member;
import com.books.model.service.book.ReviewCommentService;
import com.books.model.service.book.ReviewService;

@Controller
public class ReviewCommentController {
	@Autowired
	ReviewService reviewService;
	@Autowired
	ReviewCommentService reviewCommentService;
	
	Pager pager = new Pager();
	
	@RequestMapping(value="/review/comment/{review_id}",method=RequestMethod.POST)
	@ResponseBody
	public String insert(HttpServletRequest request,ReviewComment reviewComment,@PathVariable("review_id") int review_id) {
		Member member = (Member)request.getSession().getAttribute("member");
		Review review = reviewService.select(review_id);
		reviewComment.setMember(member);
		reviewComment.setReview(review);
		reviewCommentService.insert(reviewComment);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"result\":1");
		sb.append("}");
		return sb.toString();
	}
}
