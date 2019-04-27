package com.books.model.service.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DeadlockLoserDataAccessException;
import org.springframework.stereotype.Service;

import com.books.exception.DeleteFailException;
import com.books.exception.EditFailException;
import com.books.exception.RegistFailException;
import com.books.model.domain.book.ReviewComment;
import com.books.model.repository.book.ReviewCommentDAO;

@Service
public class ReviewCommentServiceImpl implements ReviewCommentService{
	
	@Autowired
	ReviewCommentDAO reviewCommentDAO;

	public List<ReviewComment> selectAll() {
		return reviewCommentDAO.selectAll();
	}

	public List<ReviewComment> selectByMember(int member_id) {
		return reviewCommentDAO.selectByMember(member_id);
	}

	public List<ReviewComment> selectByReview(int review_id) {
		return reviewCommentDAO.selectByReview(review_id);
	}

	public ReviewComment select(int reviewComment_id) {
		return reviewCommentDAO.select(reviewComment_id);
	}

	public void insert(ReviewComment reviewComment) throws RegistFailException{
		int result = reviewCommentDAO.insert(reviewComment);
		if(result == 0) {
			throw new RegistFailException("¸®ºä ÄÚ¸àÆ® µî·Ï ½ÇÆÐ");
		}
	}

	public void update(ReviewComment reviewComment) throws EditFailException{
		int result = reviewCommentDAO.update(reviewComment);
		if(result == 0) {
			throw new EditFailException("¸®ºä ÄÚ¸àÆ® ¼öÁ¤ ½ÇÆÐ");
		}
	}

	public void delete(int reviewComment_id) throws DeleteFailException{
		int result = reviewCommentDAO.delete(reviewComment_id);
		if(result == 0) {
			throw new DeleteFailException("¸®ºä ÄÚ¸àÆ® »èÁ¦ ½ÇÆÐ");
		}
	}

	
}
