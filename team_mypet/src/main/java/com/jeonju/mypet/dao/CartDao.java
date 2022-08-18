package com.jeonju.mypet.dao;


import java.util.List;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//유효성검사
	public boolean cartMemCheck(CartVo cartVo) {
		boolean result = sqlSession.selectOne(MAPPER+".gercartMemCheck",cartVo);
		return result;
	}

	//리스트뿌리기
	public List<CartVo> cartList(CartVo cartVo) {
		return sqlSession.selectList(MAPPER+".getcartList",cartVo);
	}
	
	//수량변경
	public int modifycartcnt(CartVo cartVo) {
		return sqlSession.update(MAPPER+".getmodifycntcart",cartVo);
	}


	//상품 넣을때 카운트
	public int countCart(CartVo cartVo) {
		return sqlSession.selectOne(MAPPER+".getcountCart",cartVo);
	}
	//장바구니 안에 카운트 (midx)
	public int countMemberCart(CartVo cartVo) {
		return sqlSession.selectOne(MAPPER+".getcountMemberCart",cartVo);
	}

	//장바구니 넣기
	public int insertCart(CartVo cartVo) {
		return sqlSession.insert(MAPPER+".insertCart",cartVo);
	}

	//넣어져 있는거면 업데이트 하기
	public int updateCart(CartVo cartVo) {
		return sqlSession.update(MAPPER+".updateCart",cartVo);
	}
	//품목 삭제하기
	public int deleteCart(CartVo cartVo) {
		return sqlSession.delete(MAPPER+".deleteCart",cartVo);
	}

	public int cartReset(int midx) {
		return sqlSession.delete(MAPPER+".resetCart",midx);
	}

	public List<HashMap<String, Object>> cartSellerList(int midx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER+".cartSellerList",midx);
	}
	



}
