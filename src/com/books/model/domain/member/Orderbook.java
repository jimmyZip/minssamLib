package com.books.model.domain.member;

public class Orderbook {
	private int orderbook_id;
	private Member member;
	private String isbn;
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

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

}
