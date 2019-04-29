package com.books.model.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.exception.DeleteFailException;
import com.books.exception.EditFailException;
import com.books.exception.RegistFailException;
import com.books.model.domain.member.Orderbook;
import com.books.model.repository.member.OrderbookDAO;

@Service
public class OrderbookServiceImpl implements OrderbookService {
	@Autowired
	OrderbookDAO orderbookDAO;

	public List<Orderbook> selectAll() {
		return orderbookDAO.selectAll();
	}

	public List<Orderbook> selectByMember(int member_id) {
		return orderbookDAO.selectByMember(member_id);
	}

	public List<Orderbook> selectByIsbn(String isbn) {
		return orderbookDAO.selectByIsbn(isbn);
	}

	public Orderbook select(int orderbook_id) {
		return orderbookDAO.select(orderbook_id);
	}

	public void insert(Orderbook orderbook) throws RegistFailException {
		int result = orderbookDAO.insert(orderbook);
		if (result == 0) {
			throw new RegistFailException("주문 도서 목록 등록 실패");
		}
	}

	public void update(Orderbook orderbook) throws EditFailException {
		int result = orderbookDAO.update(orderbook);
		if (result == 0) {
			throw new EditFailException("주문 도서 목록 수정 실패");
		}
	}

	public void delete(int orderbook_id) throws DeleteFailException {
		int result = orderbookDAO.delete(orderbook_id);
		if (result == 0) {
			throw new DeleteFailException("주문 도서 목록 삭제 실패");
		}
	}

	public Orderbook check(Orderbook orderbook) {
		return orderbookDAO.check(orderbook);
	}

}
