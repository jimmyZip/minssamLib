package com.books.model.repository.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.books.model.domain.book.BookComment;

@Repository
public class MybatisBookCommentDAO implements BookCommentDAO {
	@Autowired
	SqlSessionTemplate sessionTemplate;

	public List<BookComment> selectAll() {
		return sessionTemplate.selectList("BookComment.selectAll");
	}

	public List<BookComment> selectByMember(int member_id) {
		return sessionTemplate.selectList("BookComment.selectByMember", member_id);
	}

	public List<BookComment> selectByIsbn(String isbn) {
		return sessionTemplate.selectList("BookComment.selectByIsbn", isbn);
	}

	public BookComment select(int bookComment_id) {
		return sessionTemplate.selectOne("BookComment.select", bookComment_id);
	}

	public int insert(BookComment bookComment) {
		return sessionTemplate.insert("BookComment.insert", bookComment);
	}

	public int update(BookComment bookComment) {
		return sessionTemplate.update("BookComment.update", bookComment);
	}

	public int delete(int bookComment_id) {
		return sessionTemplate.delete("BookComment.delete", bookComment_id);
	}

}
