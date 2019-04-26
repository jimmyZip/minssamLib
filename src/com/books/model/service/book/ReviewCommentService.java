package com.books.model.service.book;

import java.util.List;

import com.books.model.domain.book.ReviewComment;

public interface ReviewCommentService {
	public List<ReviewComment> selectAll();
	public List<ReviewComment> selectByReview(int review_id);
	public List<ReviewComment> selectByMember(int member_id);
	public ReviewComment select(int reviewComment_id);
	public void insert(ReviewComment reviewComment);
	public void update(ReviewComment reviewComment);
	public void delete(int reviewComment_id);
}
