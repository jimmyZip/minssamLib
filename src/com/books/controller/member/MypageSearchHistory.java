package com.books.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.books.common.search.BookSearch;
import com.books.common.search.BookSerachMapping;

@Controller
public class MypageSearchHistory {

	@Autowired
	BookSerachMapping mapping;
	@Autowired
	BookSearch bookSearch;
	//@RequestMapping(value="/member/searchHistory",)
	
}
