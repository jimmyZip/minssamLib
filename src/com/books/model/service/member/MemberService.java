package com.books.model.service.member;

import java.util.List;

import com.books.model.domain.member.Member;

public interface MemberService {
	public List<Member> selectAll();
	public List<Member> selectByAuth(int auth_id);
	public Member select(int member_id);
	public Member loginCheck(Member member);
	public int idCheck(String id);
	public int emailCheck(String email);
	public void insert(Member member);
	public void update(Member member);
	public void delete(int member_id);
}
