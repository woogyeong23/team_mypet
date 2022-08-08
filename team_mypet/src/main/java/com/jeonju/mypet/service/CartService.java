package com.jeonju.mypet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.CartDao;
import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.ProductVo;

@Service
public class CartService {
	
	//소현
	private CartDao cartDao;

	
	@Autowired
	public CartService(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	//장바구니추가
	public int insertCart(CartVo cart)  throws Exception {
		return cartDao.insertCart(cart);
	}

	//장바구니에 해당 상품이 들어있는지 확인
	public int countCart(int p_idx, int midx) {
		return cartDao.countCart(p_idx,midx);
	}

	//장바구니에 해당 상품이 이미 들어있다면 업데이트
	public void updateCart(CartVo cart) {
		cartDao.updateCart(cart);
	}
	
	//소현 끝

	public List<ProductVo> cartList(CartVo cartVo) {
		return cartDao.cartList(cartVo);
	}


	/*
	public int cartMemCheck(CartVo cartVo) {
		return cartDao.cartMemCheck(cartVo);
	}

	public int cartMemInto(CartVo cartVo) {
		return cartDao.cartMemInto(cartVo);
	}





	public int cartCount(CartVo cartVo) {
		return cartDao.cartCount(cartVo);
	}
	*/
}
