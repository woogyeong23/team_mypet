package com.jeonju.mypet.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.ProductVo;


@Repository
public class SellerDao {

	private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.seller";
	
	public SellerDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ProductVo getSellerProductList(String member_id) {
		
		return sqlSession.selectOne(MAPPER + ".getSellerProductList", member_id);
	}

	
	
	
	
	
	

}
