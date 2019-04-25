package com.books.model.repository.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.books.model.domain.book.Review;

@Repository
public class MybatisReviewDAO implements ReviewDAO{
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	public List<Review> selectAll() {
		return sessionTemplate.selectList("Review.selectAll");
	}

	public List<Review> selectByMember(int member_id) {
		return sessionTemplate.selectList("Review.selectByMember", member_id);
	}

	public List<Review> selectByIsbn(String isbn) {
		return sessionTemplate.selectList("Review.selectByIsbn", isbn);
	}

	public Review select(int review_id) {
		return sessionTemplate.selectOne("Review.select", review_id);
	}

	public int insert(Review review) {
		return sessionTemplate.insert("Review.insert", review);
	}

	public int update(Review review) {
		return sessionTemplate.update("Review.update", review);
	}

	public int delete(int review_id) {
		return sessionTemplate.delete("Review.delete", review_id);
	}

}
