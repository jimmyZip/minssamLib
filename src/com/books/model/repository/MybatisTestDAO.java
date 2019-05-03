package com.books.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MybatisTestDAO implements TestDAO{
	private SqlSessionTemplate sessionTemplate;
	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
