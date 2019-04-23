package com.books.model.domain.book;

import com.books.model.domain.member.Member;

public class Ddabong {
	private int ddabong_id;
	private Member member;
	private Review review;
	private String regdate;

	public int getDdabong_id() {
		return ddabong_id;
	}

	public void setDdabong_id(int ddabong_id) {
		this.ddabong_id = ddabong_id;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
