package com.books.model.service.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.books.exception.DeleteFailException;
import com.books.exception.EditFailException;
import com.books.exception.RegistFailException;
import com.books.model.domain.book.Score;
import com.books.model.repository.book.ScoreDAO;

@Service
public class ScoreServiceImpl implements ScoreService {

	@Autowired
	ScoreDAO scoreDAO;

	public List<Score> selectAll() {
		return scoreDAO.selectAll();
	}

	public List<Score> selectByMember(int member_id) {
		return scoreDAO.selectByMember(member_id);
	}

	public List<Score> selectByIsbn(String isbn) {
		return scoreDAO.selectByIsbn(isbn);
	}

	public Score select(int score_id) {
		return scoreDAO.select(score_id);
	}

	public void insert(Score score) throws RegistFailException {
		int result = scoreDAO.insert(score);
		if (result == 0) {
			throw new RegistFailException("점수 등록 실패");
		}
	}

	public void update(Score score) throws EditFailException {
		int result = scoreDAO.update(score);
		if (result == 0) {
			throw new EditFailException("점수 수정 실패");
		}
	}

	public void delete(int score_id) throws DeleteFailException {
		int result = scoreDAO.delete(score_id);
		if (result == 0) {
			throw new DeleteFailException("점수 삭제 실패");
		}
	}

}
