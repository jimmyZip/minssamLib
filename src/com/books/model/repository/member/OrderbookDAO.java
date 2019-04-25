package com.books.model.repository.member;

import java.util.List;

import com.books.model.domain.member.Orderbook;

public interface OrderbookDAO {
	public List<Orderbook> selectAll();
	public List<Orderbook> selectByMember(int member_id);
	public List<Orderbook> selectByIsbn(String isbn);
	public Orderbook select(int orderbook_id);
	public int insert(Orderbook orderbook);
	public int update(Orderbook orderbook);
	public int delete(int orderbook_id);
}
