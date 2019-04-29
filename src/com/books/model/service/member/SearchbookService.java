package com.books.model.service.member;

import java.util.List;

import com.books.model.domain.member.Searchbook;

public interface SearchbookService {
	public List<Searchbook> selectAll();
	public List<Searchbook> selectByMember(int member_id);
	public List<Searchbook> selectByIsbn(String isbn);
	public Searchbook select(int searchbook_id);
	public void insert(Searchbook searchbook);
	public void update(Searchbook searchbook);
	public void delete(int searchbook_id);
	public Searchbook check(Searchbook searchbook);
}
