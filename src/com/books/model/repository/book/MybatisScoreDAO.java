package com.books.model.repository.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.books.model.domain.book.Score;

@Repository
public class MybatisScoreDAO implements ScoreDAO{
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	public List<Score> selectAll() {
		return sessionTemplate.selectList("Score.selectAll");
	}

	public List<Score> selectByMember(int member_id) {
		return sessionTemplate.selectList("Score.selectByMember", member_id);
	}

	public List<Score> selectByIsbn(String isbn) {
		return sessionTemplate.selectList("Score.selectByIsbn", isbn);
	}

	public Score select(int score_id) {
		return sessionTemplate.selectOne("Score.select", score_id);
	}

	public int insert(Score score) {
		return sessionTemplate.insert("Score.insert", score);
	}

	public int update(Score score) {
		return sessionTemplate.update("Score.update", score);
	}

	public int delete(int score_id) {
		return sessionTemplate.delete("Score.delete", score_id);
	}

}
