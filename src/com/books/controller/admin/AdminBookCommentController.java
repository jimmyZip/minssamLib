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
import com.books.model.domain.book.BookComment;
import com.books.model.domain.member.Auth;
import com.books.model.domain.member.Member;
import com.books.model.service.book.BookCommentService;

@Controller
public class AdminBookCommentController {
	@Autowired
	BookCommentService bookCommentService;
	
	Pager pager = new Pager();
	
	@RequestMapping(value = "/admin/book_comment/page", method = RequestMethod.GET)
	public ModelAndView showBookComment(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_book_comment");
		List<BookComment> bookCommentList = bookCommentService.selectAll();
		pager.init(request, bookCommentList.size());
		
		mav.addObject("bookCommentList", bookCommentList);
		mav.addObject("pager", pager);
		return mav;
	}
	
	@RequestMapping(value="/admin/book_comment/{book_comment_id}", method = RequestMethod.PUT)
	@ResponseBody
	public String deleteMember(@PathVariable("book_comment_id") int book_comment_id) {
		bookCommentService.delete(book_comment_id);
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
