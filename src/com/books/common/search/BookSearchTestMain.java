package com.books.common.search;

import java.util.List;

import com.books.model.domain.book.Book;

public class BookSearchTestMain {
	public static void main(String[] args) {
		BookSearch bookSearch = new BookSearch();
		BookSerachMapping mapping = new BookSerachMapping();
		
		String resultJSON = bookSearch.search("무소유");
		//System.out.println(bookSearch.search("해리포터"));
		//System.out.println(bookSearch.search("양자역학", 15));
		//System.out.println(bookSearch.search("양자역학", 20, 30));
		//System.out.println(bookSearch.search("9791186900529"));
		
		System.out.println(resultJSON);
		List<Book> bookList = mapping.mapping(resultJSON);
	}
}
