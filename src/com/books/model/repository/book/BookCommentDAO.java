package com.books.model.repository.book;

import java.util.List;

import com.books.model.domain.book.BookComment;

public interface BookCommentDAO {
	public List<BookComment> selectAll();
	public List<BookComment> selectByMember(int member_id);
	public List<BookComment> selectByIsbn(String isbn);
	public BookComment select(int bookComment_id);
	public int insert(BookComment bookComment);
	public int update(BookComment bookComment);
	public int delete(int bookComment_id);
}