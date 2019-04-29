package com.books.model.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.books.exception.DeleteFailException;
import com.books.exception.EditFailException;
import com.books.exception.RegistFailException;
import com.books.model.domain.member.Member;
import com.books.model.repository.member.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	@Qualifier("mybatisMemberDAO")
	private MemberDAO memberDAO;

	public List<Member> selectAll() {
		return memberDAO.selectAll();
	}

	public List<Member> selectByAuth(int auth_id) {
		return memberDAO.selectByAuth(auth_id);
	}

	public Member select(int member_id) {
		return memberDAO.select(member_id);
	}

	public void insert(Member member) throws RegistFailException {

		int result = memberDAO.insert(member);
		if (result == 0) {
			throw new RegistFailException("정보를 확인해주세요");
		}
	}

	public void update(Member member) {
		int result = memberDAO.update(member);
		if (result == 0) {
			throw new EditFailException("수정에 실패하였습니다");
		}
	}

	public void delete(int member_id) {
		int result = memberDAO.delete(member_id);
		if (result == 0) {
			throw new DeleteFailException("삭제에 실패하였습니다");
		}
	}

	public Member loginCheck(Member member) {
		
		return memberDAO.loginCheck(member);
	}

	public Member idCheck(String id) {
		return memberDAO.idCheck(id);
	}

	public Member emailCheck(String email) {
		return memberDAO.emailCheck(email);
	}

}