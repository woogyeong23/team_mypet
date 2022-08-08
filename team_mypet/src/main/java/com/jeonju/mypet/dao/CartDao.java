package com.jeonju.mypet.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.ProductVo;


@Repository
public class CartDao {

	//소현
	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.cart";
	
	@Autowired
	public CartDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//소현
	
	//장바구니 추가
	public int insertCart(CartVo cart)  throws Exception {
		return sqlSession.insert(MAPPER + ".insertCart", cart);
	}

	//장바구니에 해당 상품이 들어있는지 확인
	public int countCart(int p_idx, int midx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p_idx", p_idx);
		map.put("midx", midx);
		return sqlSession.selectOne(MAPPER + ".countCart",map);
	}

	//장바구니에 해당 상품이 이미 들어있다면 업데이트
	public void updateCart(CartVo cart) {
		sqlSession.update(MAPPER + ".updateCart",cart);
	}
	
	//소현끝
	
	
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

	
	
	
	

}
