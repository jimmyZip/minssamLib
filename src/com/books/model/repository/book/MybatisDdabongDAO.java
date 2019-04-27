package com.books.model.repository.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.books.model.domain.book.Ddabong;

@Repository
public class MybatisDdabongDAO implements DdabongDAO{

	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	public List<Ddabong> selectAll() {
		return sessionTemplate.selectList("Ddabong.selectAll");
	}

	public List<Ddabong> selectByMember(int member_id) {
		return sessionTemplate.selectList("Ddabong.selectByMember", member_id);
	}

	public List<Ddabong> selectByReview(int review_id) {
		return sessionTemplate.selectList("Ddabong.selectByReview", review_id);
	}

	public Ddabong select(int ddabong_id) {
		return sessionTemplate.selectOne("Ddabong.select", ddabong_id);
	}

	public int insert(Ddabong ddabong) {
		return sessionTemplate.insert("Ddabong.insert", ddabong);
	}

	public int update(Ddabong ddabong) {
		return sessionTemplate.update("Ddabong.update", ddabong);
	}

	public int delete(int ddabong_id) {
		return sessionTemplate.delete("Ddabong.delete", ddabong_id);
	}

}
