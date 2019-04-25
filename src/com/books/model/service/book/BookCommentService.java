package com.books.model.service.book;

import java.util.List;

import com.books.model.domain.book.BookComment;

public interface BookCommentService {
	public List<BookComment> selectAll();
	public List<BookComment> selectByMember(int member_id);
	public List<BookComment> selectByIsbn(String isbn);
	public BookComment select(int bookComment_id);
	public void insert(BookComment bookComment);
	public void update(BookComment bookComment);
	public void delete(int bookComment_id);
}
