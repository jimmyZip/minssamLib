package com.books.model.repository.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.books.model.domain.book.ReviewComment;

@Repository
public class MybatisReviewCommentDAO implements ReviewCommentDAO{
	
	@Autowired
	SqlSessionTemplate sessionTemplate;

	public List<ReviewComment> selectAll() {
		return sessionTemplate.selectList("ReviewComment.selectAll");
	}

	public List<ReviewComment> selectByReview(int review_id) {
		return sessionTemplate.selectList("ReviewComment.selectByReview",review_id);
	}

	public List<ReviewComment> selectByMember(int member_id) {
		return sessionTemplate.selectList("ReviewComment.selectByMember", member_id);
	}

	public ReviewComment select(int reviewComment_id) {
		return sessionTemplate.selectOne("ReviewComment.select", reviewComment_id);
	}

	public int insert(ReviewComment reviewComment) {
		return sessionTemplate.insert("ReviewComment.insert", reviewComment);
	}

	public int update(ReviewComment reviewComment) {
		return sessionTemplate.update("ReviewComment.update", reviewComment);
	}

	public int delete(int reviewComment_id) {
		return sessionTemplate.delete("ReviewComment.delete", reviewComment_id);
	}

}
