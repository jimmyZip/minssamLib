package com.books.model.service.book;

import java.util.List;

import com.books.model.domain.book.Book;

public interface BookService {
	public List<Book> selectAll();
	public Book select(int book_id);
	public void insert(Book book);
	public void update(Book book);
	public void delete(int book_id);
}
