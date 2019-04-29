package com.books.model.service.member;

import java.util.List;

import com.books.model.domain.member.Bookmark;

public interface BookmarkService {
	public List<Bookmark> selectAll();
	public List<Bookmark> selectByMember(int member_id);
	public List<Bookmark> selectByIsbn(String isbn);
	public Bookmark check(Bookmark bookmark);
	public Bookmark select(int bookmark_id);
	public void insert(Bookmark bookmark);
	public void update(Bookmark bookmark);
	public void delete(int bookmark_id);
}
