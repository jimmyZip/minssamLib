package com.books.model.domain.member;

import com.books.model.domain.book.Book;

public class Bookmark {
	private Book book;
	private int bookmark_id;
	private Member member;
	private String isbn;
	private String bookmark_date;

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getBookmark_id() {
		return bookmark_id;
	}

	public void setBookmark_id(int bookmark_id) {
		this.bookmark_id = bookmark_id;
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

	public String getBookmark_date() {
		return bookmark_date;
	}

	public void setBookmark_date(String bookmark_date) {
		this.bookmark_date = bookmark_date;
	}

}
