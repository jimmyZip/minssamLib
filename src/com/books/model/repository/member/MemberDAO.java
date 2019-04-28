package com.books.model.repository.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.books.model.domain.member.Member;

public interface MemberDAO {
	public List<Member> selectAll();
	public List<Member> selectByAuth(int auth_id);
	public Member select(int member_id);
	public Member idCheck(String id);
	public Member emailCheck(String email);
	public int insert(Member member);
	public int update(Member member);
	public int delete(int member_id);
	public Member loginCheck(Member member);
}
