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
import com.books.model.domain.member.Member;
import com.books.model.domain.member.Orderbook;
import com.books.model.service.member.OrderbookService;

@Controller
public class OrderbookController {
	@Autowired
	OrderbookService orderbookService;
	
	@RequestMapping(value="/orderbook/insert/{isbn}", method=RequestMethod.GET)
	@ResponseBody	
	public String insert(HttpServletRequest request, @PathVariable("isbn") String isbn) {
		Member member = (Member) request.getSession().getAttribute("member");
		Orderbook orderbook = new Orderbook();
		orderbook.setMember(member);
		orderbook.setIsbn(isbn);
		orderbookService.insert(orderbook);
		return "{\"resultCode\":1, \"msg\":\"주문 도서 등록 성공\"}";
	}
	
	@ExceptionHandler(RegistFailException.class)
	@ResponseBody
	public String insertFail(RegistFailException e) {
		return "{\"resultCode\":0, \"msg\":\"" + e.getMessage() + "\"}";
	}
}
