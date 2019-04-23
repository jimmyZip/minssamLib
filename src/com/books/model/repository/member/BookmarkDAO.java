package com.books.model.repository.member;

import java.util.List;

import com.books.model.domain.member.Bookmark;

public interface BookmarkDAO {
	public List<Bookmark> selectAll();
	public List<Bookmark> selectByMember(int member_id);
	public List<Bookmark> selectByBook(int book_id);
	public Bookmark select(int bookmark_id);
	public int insert(Bookmark bookmark);
	public int update(Bookmark bookmark);
	public int delete(int bookmark_id);
}
