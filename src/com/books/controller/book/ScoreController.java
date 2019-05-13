package com.books.controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.books.common.search.BookSearch;
import com.books.common.search.BookSerachMapping;
import com.books.model.domain.book.Book;
import com.books.model.domain.book.Score;
import com.books.model.domain.member.Member;
import com.books.model.service.book.ScoreService;
import com.books.model.service.member.SearchbookService;

@Controller
public class ScoreController {
	@Autowired
	ScoreService scoreService;
	
	@Autowired
	BookSerachMapping mapping;
	@Autowired
	BookSearch bookSearch;
	@Autowired
	SearchbookService searchbookService;
	
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	//bookDetail에서 도서의 평점 표시
	@RequestMapping(value="/book/scores",method=RequestMethod.GET)
	@ResponseBody
	public String showAvgScoreByIsbn(@RequestParam("isbn") String isbn) {
		logger.info("bookDetail에서 해당도서 평점 보기 요청");
		logger.info("넘겨받은 isbn : "+isbn);
		List<Score> scoreList =  scoreService.selectByIsbn(isbn);
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		for(int i=0;i<scoreList.size();i++) {
			Score score = scoreList.get(i);
			JSONObject obj = new JSONObject();
			obj.put("score_id", score.getScore_id());
			obj.put("isbn", score.getIsbn());
			obj.put("member.member_id",score.getMember().getMember_id());
			obj.put("score", score.getScore());
			obj.put("regdate", score.getRegdate());
			jsonArray.add(obj);
		}
		json.put("scoreList", jsonArray);
		return json.toString();
	}
	
	//bookDetail에서 유저의 점수 등록
	@RequestMapping(value="/book/scores",method=RequestMethod.POST)
	@ResponseBody
	public String registScore(HttpServletRequest request,Score score) {
		System.out.println("bookDetail에서 책 점수 등록 요청 컨트롤러 호출");
		Member member = (Member) request.getSession().getAttribute("member");
		score.setMember(member);
		scoreService.insert(score);
		
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"result\":1");
		sb.append("}");
		
		return sb.toString();
	}
	
	//bookDetail에서 평점 업데이트
	/*
	@RequestMapping(value="/book/scores",method=RequestMethod.PUT)
	@ResponseBody
	public String updateAvgScore(Score score) {
		scoreService.update(score);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"result\":1");
		sb.append("}");
		return sb.toString();
	}
	*/
}
