package com.books.model.repository.book;

import java.util.List;

import com.books.model.domain.book.Score;

public interface ScoreDAO {
	public List<Score> selectAll();
	public List<Score> selectByBook(int book_id);
	public List<Score> selectByMember(int member_id);
	public Score select(int score_id);
	public int insert(Score score);
	public int update(Score score);
	public int delete(int score_id);
}
