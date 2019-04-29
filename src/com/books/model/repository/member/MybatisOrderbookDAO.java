package com.books.model.repository.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.books.model.domain.member.Orderbook;

@Repository
public class MybatisOrderbookDAO implements OrderbookDAO{
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	public List<Orderbook> selectAll() {
		return sessionTemplate.selectList("Orderbook.selectAll");
	}

	public List<Orderbook> selectByMember(int member_id) {
		return sessionTemplate.selectList("Orderbook.selectByMember", member_id);
	}

	public List<Orderbook> selectByIsbn(String isbn) {
		return sessionTemplate.selectList("Orderbook.selectByIsbn", isbn);
	}

	public Orderbook select(int orderbook_id) {
		return sessionTemplate.selectOne("Orderbook.select", orderbook_id);
	}

	public int insert(Orderbook orderbook) {
		return sessionTemplate.insert("Orderbook.insert", orderbook);
	}

	public int update(Orderbook orderbook) {
		return sessionTemplate.update("Orderbook.update", orderbook);
	}

	public int delete(int orderbook_id) {
		return sessionTemplate.delete("Orderbook.delete", orderbook_id);
	}

	public Orderbook check(Orderbook orderbook) {
		return sessionTemplate.selectOne("Orderbook.check", orderbook);
	}

}
