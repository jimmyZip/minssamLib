package com.books.model.repository.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.books.model.domain.member.Searchbook;

@Repository
public class MybatisSearchbookDAO implements SearchbookDAO{
	
	@Autowired
	SqlSessionTemplate sessionTemplate;

	public List<Searchbook> selectAll() {
		return sessionTemplate.selectList("Searchbook.selectAll");
	}

	public List<Searchbook> selectByMember(int member_id) {
		return sessionTemplate.selectList("Searchbook.selectByMember", member_id);
	}

	public List<Searchbook> selectByIsbn(String isbn) {
		return sessionTemplate.selectList("Searchbook.selectByIsbn", isbn);
	}

	public Searchbook select(int searchbook_id) {
		return sessionTemplate.selectOne("Searchbook.select", searchbook_id);
	}

	public int insert(Searchbook searchbook) {
		return sessionTemplate.insert("Searchbook.insert", searchbook);
	}

	public int update(Searchbook searchbook) {
		return sessionTemplate.update("Searchbook.update", searchbook);
	}

	public int delete(int searchbook_id) {
		return sessionTemplate.delete("Searchbook.delete", searchbook_id);
	}

}
