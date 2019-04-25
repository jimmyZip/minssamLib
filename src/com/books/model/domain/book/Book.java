package com.books.model.domain.book;

import java.util.List;

public class Book {
	private String title; // 제목
	private String link; // 경로
	private String image; // 이미지 주소
	private String author; // 저자
	private String publisher; // 출판사
	private String pubdate; // 출판일
	private String isbn; // isbn
	private String description; // 설명
	private List<Review> review; // 리뷰
	private List<BookComment> bookComment; // 댓글
	private List<Score> score;// 점수
	private int start; // 시작 위치
	private int total; // 전체 개수

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPubdate() {
		return pubdate;
	}

	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Review> getReview() {
		return review;
	}

	public void setReview(List<Review> review) {
		this.review = review;
	}

	public List<BookComment> getBookComment() {
		return bookComment;
	}

	public void setBookComment(List<BookComment> bookComment) {
		this.bookComment = bookComment;
	}

	public List<Score> getScore() {
		return score;
	}

	public void setScore(List<Score> score) {
		this.score = score;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
