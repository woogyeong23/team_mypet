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
	
	
//	public boolean cartMemCheck(CartVo cartVo) {
//		return cartDao.cartMemCheck(cartVo);
//	}
//	public int cartMemInto(CartVo cartVo) {
//		return cartDao.cartMemInto(cartVo);
//	}


	public List<ProductVo> cartList(CartVo cartVo) {
		
		return cartDao.cartList(cartVo);
	}



	public int countCart(CartVo cartVo) {
		return cartDao.countCart(cartVo);
	}

	public int countMemberCart(CartVo cartVo) {
		return cartDao.countMemberCart(cartVo);
	}


	public int insertCart(CartVo cartVo) {
		return cartDao.insertCart(cartVo);
	}
	public int updateCart(CartVo cartVo) {
		return cartDao.updateCart(cartVo);
	}







}
