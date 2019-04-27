package com.books.model.service.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.exception.DeleteFailException;
import com.books.exception.EditFailException;
import com.books.exception.RegistFailException;
import com.books.model.domain.book.Review;
import com.books.model.repository.book.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	ReviewDAO reviewDAO;

	public List<Review> selectAll() {
		return reviewDAO.selectAll();
	}

	public List<Review> selectByMember(int member_id) {
		return reviewDAO.selectByMember(member_id);
	}

	public List<Review> selectByIsbn(String isbn) {
		return reviewDAO.selectByIsbn(isbn);
	}

	public Review select(int review_id) {
		return reviewDAO.select(review_id);
	}

	public void insert(Review review) throws RegistFailException {
		int result = reviewDAO.insert(review);
		if (result == 0) {
			throw new RegistFailException("리뷰 등록 실패");
		}
	}

	public void update(Review review) throws EditFailException {
		int result = reviewDAO.update(review);
		if (result == 0) {
			throw new EditFailException("리뷰 수정 실패");
		}
	}

	public void delete(int review_id) throws DeleteFailException {
		int result = reviewDAO.delete(review_id);
		if (result == 0) {
			throw new DeleteFailException("리뷰 삭제 실패");
		}
	}

}
