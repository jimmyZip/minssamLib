package com.books.model.repository.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.books.model.domain.member.Auth;

@Repository
public class MybatisAuthDAO implements AuthDAO{
	
	@Autowired
	SqlSessionTemplate sessionTemplace;

	public List<Auth> selectAll() {
		return sessionTemplace.selectList("Auth.selectAll");
	}

	public Auth select(int auth_id) {
		return sessionTemplace.selectOne("Auth.select", auth_id);
	}

	public int insert(Auth auth) {
		return sessionTemplace.insert("Auth.insert", auth);
	}

	public int update(Auth auth) {
		return sessionTemplace.update("Auth.update", auth);
	}

	public int delete(int auth_id) {
		return sessionTemplace.delete("Auth.delete", auth_id);
	}
	
}
