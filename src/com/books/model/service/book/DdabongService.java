package com.books.model.service.book;

import java.util.List;

import com.books.model.domain.book.Ddabong;

public interface DdabongService {
	public List<Ddabong> selectAll();
	public List<Ddabong> selectByMember(int member_id);
	public List<Ddabong> selectByReview(int review_id);
	public Ddabong select(int ddabong_id);
	public void insert(Ddabong ddabong);
	public void update(Ddabong ddabong);
	public void delete(int ddabong_id);
}
