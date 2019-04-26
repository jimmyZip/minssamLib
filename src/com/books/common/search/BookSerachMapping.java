package com.books.common.search;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.books.model.domain.book.Book;
import com.books.model.service.book.BookCommentService;
import com.books.model.service.book.BookCommentServiceImpl;
import com.books.model.service.book.ReviewService;
import com.books.model.service.book.ReviewServiceImpl;
import com.books.model.service.book.ScoreService;

@Component
public class BookSerachMapping {
	@Autowired
	ReviewService reviewService;
	@Autowired
	BookCommentService bookCommentService;
	@Autowired
	ScoreService scoreService;
		
	// bookcomment 추가
	JSONParser jsonParser = new JSONParser();
	
	// 검색결과(json) -> bookList로 변환
	public List<Book> mapping(String searchResult){
		List<Book> bookList = new ArrayList<Book>();
		searchResult = searchResult.replaceAll("<b>", "");
		searchResult = searchResult.replaceAll("</b>", "");
		try {
			JSONObject jsonObject = (JSONObject) jsonParser.parse(searchResult);
			JSONArray searchBookList = (JSONArray) jsonObject.get("items"); // items에서 뽑아옴
			for(int i=0; i<searchBookList.size(); i++) {
				Book book = new Book();
				JSONObject jsonBook = (JSONObject) searchBookList.get(i);
				book.setTitle(jsonBook.get("title").toString());
				book.setLink(jsonBook.get("link").toString());
				book.setImage(jsonBook.get("image").toString());
				book.setAuthor(jsonBook.get("author").toString());
				book.setPublisher(jsonBook.get("publisher").toString());
				book.setPubdate(jsonBook.get("pubdate").toString());
				book.setDescription(jsonBook.get("description").toString());
				String isbn;
				try {
					isbn = jsonBook.get("isbn").toString().split(" ")[1];
				} catch (ArrayIndexOutOfBoundsException e) {// isbn 하나 있을때 에러 처리
					isbn = jsonBook.get("isbn").toString();
				}
				
				book.setIsbn(isbn);
				book.setReview(reviewService.selectByIsbn(isbn));
				book.setBookComment(bookCommentService.selectByIsbn(isbn));
				book.setScore(scoreService.selectByIsbn(isbn));
				book.setStart(Integer.parseInt(jsonObject.get("start").toString()));
				book.setTotal(Integer.parseInt(jsonObject.get("total").toString()));
				bookList.add(book);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return bookList;
	}
}
