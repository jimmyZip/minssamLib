package com.books.model.repository.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.books.model.domain.member.Bookmark;

@Repository
public class MybatisBookmarkDAO implements BookmarkDAO{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<Bookmark> selectAll() {
		return sqlSessionTemplate.selectList("Bookmark.selectAll");
	}

	public List<Bookmark> selectByMember(int member_id) {
		return null;
	}

	public List<Bookmark> selectByIsbn(String isbn) {
		return null;
	}

	public Bookmark select(int bookmark_id) {
		return null;
	}

	public int insert(Bookmark bookmark) {
		return 0;
	}

	public int update(Bookmark bookmark) {
		return 0;
	}

	public int delete(int bookmark_id) {
		return 0;
	}
}
