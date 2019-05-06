package com.books.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.books.common.Pager;
import com.books.exception.DeleteFailException;
import com.books.model.domain.book.ReviewComment;
import com.books.model.service.book.ReviewCommentService;

@Controller
public class AdminReviewCommentController {
	@Autowired
	ReviewCommentService reviewCommentService;
	
	Pager pager = new Pager();
	
	@RequestMapping(value = "/admin/review_comment/page", method = RequestMethod.GET)
	public ModelAndView showReviewComment(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_review_comment");
		List<ReviewComment> reviewCommentList = reviewCommentService.selectAll();
		pager.init(request, reviewCommentList.size());
		
		mav.addObject("reviewCommentList", reviewCommentList);
		mav.addObject("pager", pager);
		return mav;
	}
	
	@RequestMapping(value="/admin/review_comment/{review_comment_id}", method = RequestMethod.DELETE)
	@ResponseBody
	public String deleteMember(@PathVariable("review_comment_id") int review_comment_id) {
		reviewCommentService.delete(review_comment_id);
		
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"resultCode\":1");
		sb.append("}");
		return sb.toString();
	}
	
	@ExceptionHandler(DeleteFailException.class)
	@ResponseBody
	public String deleteFail(DeleteFailException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"resultCode\":0,");
		sb.append("\"msg\":\""+e.getMessage()+"\"");
		sb.append("}");
		
		return sb.toString();
	}
}
