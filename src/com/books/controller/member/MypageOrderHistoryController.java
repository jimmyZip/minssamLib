package com.books.controller.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.books.common.Pager;
import com.books.common.search.BookSearch;
import com.books.common.search.BookSerachMapping;
import com.books.model.domain.member.Member;
import com.books.model.domain.member.Orderbook;
import com.books.model.domain.member.Searchbook;
import com.books.model.service.member.OrderbookService;

@Controller
public class MypageOrderHistoryController {
	
	@Autowired
	private BookSerachMapping mapping;
	@Autowired
	private BookSearch bookSearch;
	@Autowired
	private OrderbookService orderbookService;
	Pager pager=new Pager();
	@RequestMapping(value="/member/bookOrderHistory",method=RequestMethod.GET)
	public ModelAndView orderAll(HttpServletRequest request) {
		Member member= (Member)request.getSession().getAttribute("member");
		ArrayList bookOrderHistory;
		ModelAndView mav= new ModelAndView();
		try {	 
			bookOrderHistory=(ArrayList) orderbookService.selectByMember(member.getMember_id());
		}catch (NullPointerException e) { 
			mav.setViewName("member/login/error");
			e.printStackTrace();
			return mav;
	}
		
		mav.setViewName("member/bookOrderHistory");
		mav.addObject("bookOrderHistory",bookOrderHistory);
		return mav; 
	}
	
	@RequestMapping(value="/member/mypage/bookOrderHistory", method=RequestMethod.GET)
	@ResponseBody																			// @PathVariable("currentPage") int currentPage
	public List<Orderbook> searchList(HttpServletRequest request){
		Member member = (Member)request.getSession().getAttribute("member");
		List<Orderbook> orderBookList;
		pager.getCurrentPage();
		orderBookList = orderbookService.selectByMember(member.getMember_id());
		List<Orderbook> orderList = new ArrayList();
		pager.init(request, orderBookList.size());
		
		int curPos = pager.getCurPos();
		int num = pager.getNum();
		for(int i=0; i<pager.getPageSize(); i++) {
			if(num<1) break;
			orderList.add(orderBookList.get(curPos++));
			num--;	
		}
		
		for(int i=0; i<orderList.size(); i++) {
			String isbn = orderList.get(i).getIsbn();
			orderList.get(i).setBook(mapping.mapping(bookSearch.search(isbn)).get(0));
		}//setBook(mapping.mapping(bookSearch.search(isbn)).get(0));
		
		System.out.println("ÀÛµ¿2");
		return orderList;
	}
	
	@RequestMapping(value="/member/mypage/bookOrderHistory/{orderbook_id}", method=RequestMethod.DELETE)
	@ResponseBody
	public String deleteSearch(@PathVariable("orderbook_id") int orderbook_id) {
		orderbookService.delete(orderbook_id);
		
		return null;
	}	
}
