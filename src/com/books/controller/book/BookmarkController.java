package com.books.controller.book;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.books.exception.RegistFailException;
import com.books.model.domain.member.Bookmark;
import com.books.model.domain.member.Member;
import com.books.model.service.member.BookmarkService;

@Controller
public class BookmarkController {
	@Autowired
	BookmarkService bookmarkService;
	
	@RequestMapping(value="/bookmark/insert/{isbn}", method=RequestMethod.GET)
	@ResponseBody	
	public String insert(HttpServletRequest request, @PathVariable("isbn") String isbn) {
		Bookmark bookmark = new Bookmark();
		bookmark.setMember((Member) request.getSession().getAttribute("member"));
		bookmark.setIsbn(isbn);
		bookmarkService.insert(bookmark);
		return "{\"resultCode\":1, \"msg\":\"북마크 등록 성공\"}";
	}
	
	@ExceptionHandler(RegistFailException.class)
	@ResponseBody
	public String insertFail(RegistFailException e) {
		return "{\"resultCode\":0, \"msg\":\"" + e.getMessage() + "\"}";
	}
}
