package com.jeonju.mypet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.CartDao;
import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.ProductVo;

@Service
public class CartService {

	private CartDao cartDao;
	
	@Autowired
	public CartService(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	
	
	public int cartMemCheck(CartVo cartVo) {
		return cartDao.cartMemCheck(cartVo);
	}

	public int cartMemInto(CartVo cartVo) {
		return cartDao.cartMemInto(cartVo);
	}



	public List<ProductVo> cartList(CartVo cartVo) {
		return cartDao.cartList(cartVo);
	}



	public int cartCount(CartVo cartVo) {
		return cartDao.cartCount(cartVo);
	}



	
	
	
	
}
