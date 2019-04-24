package com.books.model.domain.book;

import com.books.model.domain.member.Member;

public class BookComment {
	private int bookComment_id;
	private Member member;
	private String isbn;
	private String content;
	private String regdate;
	private String modidate;

	public int getBookComment_id() {
		return bookComment_id;
	}

	public void setBookComment_id(int bookComment_id) {
		this.bookComment_id = bookComment_id;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getModidate() {
		return modidate;
	}

	public void setModidate(String modidate) {
		this.modidate = modidate;
	}

}
