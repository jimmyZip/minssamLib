package com.books.model.service.book;

import java.util.List;

import com.books.model.domain.book.Score;

public interface ScoreService {
	public List<Score> selectAll();
	public List<Score> selectByMember(int member_id);
	public List<Score> selectByIsbn(String isbn);
	public Score select(int score_id);
	public void insert(Score score);
	public void update(Score score);
	public void delete(int score_id);
}
