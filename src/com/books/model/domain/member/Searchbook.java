package com.books.model.domain.member;

import com.books.model.domain.book.Book;

public class Searchbook {
	private int searchbook_id;
	private Member member;
	private Book book;
	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	private String isbn;
	private String searchdate;

	public int getSearchbook_id() {
		return searchbook_id;
	}

	public void setSearchbook_id(int searchbook_id) {
		this.searchbook_id = searchbook_id;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getSearchdate() {
		return searchdate;
	}

	public void setSearchdate(String searchdate) {
		this.searchdate = searchdate;
	}

}
