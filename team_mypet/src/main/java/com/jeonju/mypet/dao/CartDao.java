package com.jeonju.mypet.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.CartVo;


@Repository
public class CartDao {

	//소현
	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.cart";
	
	@Autowired
	public CartDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insertCart(CartVo cart)  throws Exception {
		return sqlSession.insert(MAPPER + ".insertCart", cart);
	}
	
	
	
	
	

}
