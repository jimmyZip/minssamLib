package com.books.model.domain.member;

import com.books.model.domain.book.Book;

public class Orderbook {
	private int orderbook_id;
	private Member member;
	private Book book;
	private String orderdate;

	public int getOrderbook_id() {
		return orderbook_id;
	}

	public void setOrderbook_id(int orderbook_id) {
		this.orderbook_id = orderbook_id;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

}
