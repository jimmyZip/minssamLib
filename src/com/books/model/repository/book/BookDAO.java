package com.books.model.repository.book;

import java.util.List;

import com.books.model.domain.book.Book;

public interface BookDAO {
	public List<Book> selectAll();
	public Book select(int book_id);
	public int insert(Book book);
	public int update(Book book);
	public int delete(int book_id);
}
