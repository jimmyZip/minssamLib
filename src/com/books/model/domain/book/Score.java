package com.books.model.domain.book;

import com.books.model.domain.member.Member;

public class Score {
	private int score_id;
	private String isbn;
	private Member member;
	private int score;
	private String regdate;

	public int getScore_id() {
		return score_id;
	}

	public void setScore_id(int score_id) {
		this.score_id = score_id;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
