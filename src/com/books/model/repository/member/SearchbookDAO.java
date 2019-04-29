package com.books.model.repository.member;

import java.util.List;

import com.books.model.domain.member.Searchbook;

public interface SearchbookDAO {
	public List<Searchbook> selectAll();
	public List<Searchbook> selectByMember(int member_id);
	//public List<Searchbook> selectByIsbn(String isbn);
	public Searchbook selectByIsbn(String isbn);
	public Searchbook select(int searchbook_id);
	public int insert(Searchbook searchbook);
	public int update(Searchbook searchbook);
	public int delete(int searchbook_id);
	public Searchbook check(Searchbook searchbook);
}
