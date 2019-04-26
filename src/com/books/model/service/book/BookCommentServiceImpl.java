package com.books.model.service.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.exception.DeleteFailException;
import com.books.exception.EditFailException;
import com.books.exception.RegistFailException;
import com.books.model.domain.book.BookComment;
import com.books.model.repository.book.BookCommentDAO;

@Service
public class BookCommentServiceImpl implements BookCommentService {
	@Autowired
	BookCommentDAO bookCommentDAO;

	public List<BookComment> selectAll() {
		return bookCommentDAO.selectAll();
	}

	public List<BookComment> selectByMember(int member_id) {
		return bookCommentDAO.selectByMember(member_id);
	}

	public List<BookComment> selectByIsbn(String isbn) {
		return bookCommentDAO.selectByIsbn(isbn);
	}

	public BookComment select(int bookComment_id) {
		return bookCommentDAO.select(bookComment_id);
	}

	public void insert(BookComment bookComment) throws RegistFailException {
		int result = bookCommentDAO.insert(bookComment);
		if (result == 0) {
			throw new RegistFailException("ºÏ ÄÚ¸àÆ® µî·Ï ½ÇÆÐ");
		}
	}

	public void update(BookComment bookComment) throws EditFailException {
		int result = bookCommentDAO.update(bookComment);
		if (result == 0) {
			throw new EditFailException("ºÏ ÄÚ¸àÆ® ¼öÁ¤ ½ÇÆÐ");
		}
	}

	public void delete(int bookComment_id) throws DeleteFailException {
		int result = bookCommentDAO.delete(bookComment_id);
		if (result == 0) {
			throw new DeleteFailException("ºÏ ÄÚ¸àÆ® »èÁ¦ ½ÇÆÐ");
		}
	}

}
