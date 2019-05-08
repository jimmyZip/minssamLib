package com.books.controller.book;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.books.apitest.MyHandler;
import com.books.apitest.PopularBookTest;
import com.books.apitest.TestParser;

@Controller
public class PopularBookController {
	@Autowired
	TestParser testParser;
	
	@RequestMapping(value="/book/popular",method=RequestMethod.GET)
	public ModelAndView searchResult() {
		System.out.println("popularBookController 결과 호출");
		List<PopularBookTest> apiSearchResult = testParser.getMyHandler().getPopularBookList();

		System.out.println(apiSearchResult.size());
		/*
		for(int i=0;i<apiSearchResult.size();i++) {
			System.out.println(" ▶ "+i+"번째 No : "+apiSearchResult.get(i).getNo());
			System.out.println(" ▶ "+i+"번째 BookName : "+apiSearchResult.get(i).getBookname());
			System.out.println(" ▶ "+i+"번째 ISBN : "+apiSearchResult.get(i).getIsbn13());
			System.out.println(" ▶ "+i+"번째 Ranking : "+apiSearchResult.get(i).getRanking());
		}
		*/
		ModelAndView mav = new ModelAndView();
		//System.out.println("api로부터 담겨진 결과의 수"+apiSearchResult.size());
		mav.setViewName("books/popular");
		mav.addObject("apiSearchResult", apiSearchResult);
		
		return mav;
	}
}
