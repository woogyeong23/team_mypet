package com.jeonju.mypet.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.ProductVo;




@Repository
public class HomeDao {
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.home";

	@Autowired
	public HomeDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<ProductVo> getHList() {
		return sqlSession.selectList(MAPPER+".getHList");
	}

	public List<ProductVo> getSearchList(String keyword) {
		return sqlSession.selectList(MAPPER+".getSearchList", keyword);
	}

	public int resultCount(String keyword) {
		return sqlSession.selectOne(MAPPER+".resultCount", keyword);
	}
	
	


	
	
	
	
	
	

}
