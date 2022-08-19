package com.jeonju.mypet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeonju.mypet.dao.CartDao;
import com.jeonju.mypet.dao.MembersDao;
import com.jeonju.mypet.dao.PayDao;
import com.jeonju.mypet.vo.DetailVo;
import com.jeonju.mypet.vo.OrdersVo;

@Service
public class PayService {

private PayDao payDao;
private CartDao cartDao;

	@Autowired
	public PayService(PayDao payDao, CartDao cartDao) {
		this.payDao = payDao;
		this.cartDao = cartDao;
		
	}
	
	public List<OrdersVo> orderpay(OrdersVo ordersVo) {
		return payDao.orderpay(ordersVo);

	}
	
	public int orderInsert(OrdersVo ordersVo)throws Exception {
		//장바구니 초기화
		  cartDao.cartReset(ordersVo.getMidx());
		
		return payDao.orderInsert(ordersVo);
	}
	
	public int detailInsert(DetailVo detailVo) throws Exception {
		return payDao.detailInsert(detailVo);
	}

	

	
	
	
}
