package com.books.model.repository.book;

import java.util.List;

import com.books.model.domain.book.ReviewComment;

public interface ReviewCommentDAO {
	public List<ReviewComment> selectAll();
	public List<ReviewComment> selectByReview(int review_id);
	public List<ReviewComment> selectByMember(int member_id);
	public ReviewComment select(int reviewComment_id);
	public int insert(ReviewComment reviewComment);
	public int update(ReviewComment reviewComment);
	public int delete(int reviewComment_id);
}
