package com.books.apitest;

import com.books.model.domain.book.Book;

public class PopularBookTest {
	private int no;
	private String region;
	private String bookname;
	private String ranking;
	private String loan_count;

	//getter and setter
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getRanking() {
		return ranking;
	}
	public void setRanking(String ranking) {
		this.ranking = ranking;
	}
	public String getLoan_count() {
		return loan_count;
	}
	public void setLoan_count(String loan_count) {
		this.loan_count = loan_count;
	}	
}
