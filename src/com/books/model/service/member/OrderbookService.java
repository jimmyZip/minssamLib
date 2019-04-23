package com.books.model.service.member;

import java.util.List;

import com.books.model.domain.member.Orderbook;

public interface OrderbookService {
	public List<Orderbook> selectAll();
	public List<Orderbook> selectByMember(int member_id);
	public List<Orderbook> selectByBook(int book_id);
	public Orderbook select(int orderbook_id);
	public void insert(Orderbook orderbook);
	public void update(Orderbook orderbook);
	public void delete(int orderbook_id);
}
