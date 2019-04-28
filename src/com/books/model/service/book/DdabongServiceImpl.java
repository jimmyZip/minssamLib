package com.books.model.service.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.exception.DeleteFailException;
import com.books.exception.EditFailException;
import com.books.exception.RegistFailException;
import com.books.model.domain.book.Ddabong;
import com.books.model.repository.book.DdabongDAO;

@Service
public class DdabongServiceImpl implements DdabongService {
	@Autowired
	DdabongDAO ddabongDAO;

	public List<Ddabong> selectAll() {
		return ddabongDAO.selectAll();
	}

	public List<Ddabong> selectByMember(int member_id) {
		return ddabongDAO.selectByMember(member_id);
	}

	public List<Ddabong> selectByReview(int review_id) {
		return ddabongDAO.selectByReview(review_id);
	}

	public Ddabong select(int ddabong_id) {
		return ddabongDAO.select(ddabong_id);
	}

	public void insert(Ddabong ddabong) throws RegistFailException {
		int result = ddabongDAO.insert(ddabong);
		if (result == 0) {
			throw new RegistFailException("추천 등록 실패");
		}
	}

	public void update(Ddabong ddabong) throws EditFailException {
		int result = ddabongDAO.update(ddabong);
		if (result == 0) {
			throw new EditFailException("추천 수정 실패");
		}
	}

	public void delete(int ddabong_id) throws DeleteFailException {
		int result = ddabongDAO.delete(ddabong_id);
		if (result == 0) {
			throw new DeleteFailException("추천 삭제 실패");
		}
	}

}
