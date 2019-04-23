package com.books.model.domain.book;

import com.books.model.domain.member.Member;

public class ReviewComment {
	private int reviewComment_id;
	private Review review;
	private Member member;
	private String content;
	private String regdate;
	private String modidate;

	public int getReviewComment_id() {
		return reviewComment_id;
	}

	public void setReviewComment_id(int reviewComment_id) {
		this.reviewComment_id = reviewComment_id;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
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
