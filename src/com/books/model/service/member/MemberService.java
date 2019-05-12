package com.books.model.service.member;

import java.util.List;

import com.books.model.domain.member.Member;

public interface MemberService {
	public List<Member> selectAll();
	public List<Member> selectByAuth(int auth_id);
	public Member select(int member_id);
	public Member selectById(String id);
	public Member loginCheck(Member member);
	public Member idCheck(String id);
	public Member emailCheck(String email);
	public Member passCheck(String pass);
	public void insert(Member member);
	public void update(Member member);
	public void delete(int member_id);
	public Member findId(Member member);
	public int resetPass(Member member);
	public Member infoCheck(Member member);
	public boolean send(String subject, String text, String from, String to);
	public void updateAuth(Member member);
	public void lastLogin(Member member);
	public List<Member> search(String searchWord);
}
