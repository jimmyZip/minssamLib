package com.books.common.search;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import com.books.model.domain.book.Book;
import com.books.model.service.book.BookCommentService;
import com.books.model.service.book.ReviewService;

public class BookSerachMapping {
	@Autowired
	ReviewService reviewService;
	@Autowired
	BookCommentService bookCommentService;
	
	// bookcomment 추가
	JSONParser jsonParser = new JSONParser();
	
	// 검색결과(json) -> bookList로 변환
	public List<Book> mapping(String searchResult){
		List<Book> bookList = new ArrayList<Book>();
		
		try {
			JSONObject jsonObject = (JSONObject) jsonParser.parse(searchResult);
			JSONArray searchBookList = (JSONArray) jsonObject.get("items");
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
				
				String isbn = jsonBook.get("isbn").toString().split(" ")[1];
				book.setIsbn(isbn);
				book.setReview(reviewService.selectByIsbn(isbn));
				book.setBookComment(bookCommentService.selectByIsbn(isbn));
				bookList.add(book);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return bookList;
	}
}
