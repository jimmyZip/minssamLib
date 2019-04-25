package com.books.model.service.book;

import java.util.List;

import com.books.model.domain.book.Review;

public interface ReviewService {
	public List<Review> selectAll();
	public List<Review> selectByMember(int member_id);
	public List<Review> selectByIsbn(String isbn);
	public Review select(int review_id);
	public void insert(Review review);
	public void update(Review review);
	public void delete(int review_id);
}
