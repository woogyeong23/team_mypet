package com.jeonju.mypet.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.ProductVo;


@Repository
public class SellerDao {

	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.seller";
	
	public SellerDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<HashMap<String, Object>> getSellerProductList(String member_id) {
		
		
		return sqlSession.selectList(MAPPER + ".getSellerProductList", member_id);
	}

	
	
	
	
	
	

}
