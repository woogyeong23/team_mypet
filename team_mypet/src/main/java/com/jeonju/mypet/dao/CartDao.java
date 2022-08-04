package com.jeonju.mypet.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.ProductVo;


@Repository
public class CartDao {

	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.cart";
	
	@Autowired
	public CartDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public int cartMemCheck(CartVo cartVo) {
		return sqlSession.selectOne(MAPPER+".gercartMemCheck",cartVo);
	}
	
	public int cartMemInto(CartVo cartVo) {
		return sqlSession.insert(MAPPER+".getcartMemInto",cartVo);
	}


	public List<ProductVo> cartList(CartVo cartVo) {
		return sqlSession.selectList(MAPPER+".getcartList",cartVo);
	}


	public int cartCount(CartVo cartVo) {
		return sqlSession.selectOne(MAPPER+".getcartCount",cartVo);
	}


	


	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	
	
	
	
	

}
