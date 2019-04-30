package com.books.model.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.exception.DeleteFailException;
import com.books.exception.EditFailException;
import com.books.exception.RegistFailException;
import com.books.model.domain.member.Searchbook;
import com.books.model.repository.member.SearchbookDAO;

@Service
public class SearchbookServiceImpl implements SearchbookService {
	@Autowired
	SearchbookDAO searchbookDAO;

	public List<Searchbook> selectAll() {
		return searchbookDAO.selectAll();
	}

	public List<Searchbook> selectByMember(int member_id) {
		return searchbookDAO.selectByMember(member_id);
	}

	public List<Searchbook> selectByIsbn(String isbn) {
		return searchbookDAO.selectByIsbn(isbn);
	}

	public Searchbook select(int searchbook_id) {
		return searchbookDAO.select(searchbook_id);
	}

	public void insert(Searchbook searchbook) throws RegistFailException {
		int result = searchbookDAO.insert(searchbook);
		if (result == 0) {
			throw new RegistFailException("검색한 도서 등록 실패");
		}
	}

	public void update(Searchbook searchbook) throws EditFailException {
		int result = searchbookDAO.update(searchbook);
		if (result == 0) {
			throw new EditFailException("검색한 도서 수정 실패");
		}
	}

	public void delete(int searchbook_id) throws DeleteFailException {
		int result = searchbookDAO.delete(searchbook_id);
		if (result == 0) {
			throw new DeleteFailException("검색한 도서 삭제 실패");
		}
	}

	public Searchbook check(Searchbook searchbook) {
		return searchbookDAO.check(searchbook);
	}

}
