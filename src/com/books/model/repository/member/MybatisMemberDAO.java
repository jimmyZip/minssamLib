package com.books.model.repository.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.books.model.domain.member.Member;

@Repository
public class MybatisMemberDAO implements MemberDAO{

	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	public List<Member> selectAll() {
		return sessionTemplate.selectList("Member.selectAll");
	}

	public List<Member> selectByAuth(int auth_id) {
		return sessionTemplate.selectList("Member.selectByAuth", auth_id);
	}

	public Member select(int member_id) {
		return sessionTemplate.selectOne("Member.select", member_id);
	}

	public int insert(Member member) {
		return sessionTemplate.insert("Member.insert", member);
	}

	public int update(Member member) {
		return sessionTemplate.update("Member.update", member);
	}

	public int delete(int member_id) {
		return sessionTemplate.delete("Member.delete", member_id);
	}

	public Member loginCheck(Member member) {
		return sessionTemplate.selectOne("Member.loginCheck", member);
	}

	public int idCheck(String id) {
		return sessionTemplate.selectOne("Member.idCheck", id);
	}

	public int emailCheck(String email) {
		return sessionTemplate.selectOne("Member.emailCheck", email);
	}

}
