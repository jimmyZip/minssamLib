package com.books.model.repository.book;

import java.util.List;

import com.books.model.domain.book.Ddabong;

public interface DdabongDAO {
	public List<Ddabong> selectAll();
	public List<Ddabong> selectByMember(int member_id);
	public List<Ddabong> selectByReview(int review_id);
	public Ddabong select(int ddabong_id);
	public int insert(Ddabong ddabong);
	public int update(Ddabong ddabong);
	public int delete(int ddabong_id);
}
