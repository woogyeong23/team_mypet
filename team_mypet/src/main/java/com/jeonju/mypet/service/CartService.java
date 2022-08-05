package com.jeonju.mypet.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.CartDao;
import com.jeonju.mypet.vo.CartVo;

@Service
public class CartService {
	
	//소현
	private CartDao cartDao;

	@Autowired
	public CartService(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	public int insertCart(CartVo cart)  throws Exception {
		return cartDao.insertCart(cart);
	}
	
	//소현 끝
	
}
