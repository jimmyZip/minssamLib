package com.books.controller.book;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.books.model.domain.book.Score;
import com.books.model.service.book.ScoreService;

@Controller
public class ScoreController {
	@Autowired
	ScoreService scoreService;
	
	//bookDetail에서 도서의 평점 표시
	@RequestMapping(value="/book/scores",method=RequestMethod.GET)
	@ResponseBody
	public String showAvgScoreByIsbn(@RequestParam("isbn") String isbn) {
		System.out.println("bookDetail에서 해당도서 평점 보기 요청");
		System.out.println("넘겨받은 isbn : "+isbn);
		List<Score> scoreList = scoreService.selectByIsbn(isbn);
		StringBuilder sb = new StringBuilder();
		
		//구글 라이브러리(google json simple)로 표현해서 문자열 취급하지 않고 표현
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		for(int i=0;i<scoreList.size();i++) {
			Score score = scoreList.get(i);
			JSONObject obj = new JSONObject();//dto와 1:1대응하는 obj
			obj.put("score_id", score.getScore_id());
			obj.put("isbn", score.getIsbn());
			obj.put("member_id",score.getMember().getMember_id());
			obj.put("score", score.getScore());
			obj.put("regdate", score.getRegdate());
			jsonArray.add(obj);
		}
		json.put("scoreList", jsonArray);
		return json.toString();
	}
	
	//bookDetail에서 유저의 평점 등록
	@RequestMapping(value="/book/scores",method=RequestMethod.POST)
	@ResponseBody
	public String registScore(Score score) {
		System.out.println("bookDetail에서 책 점수 등록 요청 컨트롤러 호출");
		scoreService.insert(score);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"result\":1");
		sb.append("}");
		
		return sb.toString();
	}
	
	//bookDetail에서 평점 업데이트
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
}
