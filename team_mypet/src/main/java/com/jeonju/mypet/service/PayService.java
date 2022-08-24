package com.jeonju.mypet.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeonju.mypet.dao.CartDao;
import com.jeonju.mypet.dao.MembersDao;
import com.jeonju.mypet.dao.PayDao;
import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.DetailVo;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.OrdersListVo;
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
		
		return payDao.orderInsert(ordersVo);
	}
	
	public int detailInsert(DetailVo detailVo) throws Exception {
		return payDao.detailInsert(detailVo);
	}
	
	public List<OrdersListVo> orderview(OrdersVo ordersVo){
		return payDao.orderview(ordersVo);
	}
	
	public HashMap<String, Object> totalProductPrice(int midx, int cart_idx) {
		// TODO Auto-generated method stub
		return payDao.totalProductPrice(midx,cart_idx);
	}
	public MembersVo membersinfo(int midx) {
		return payDao.membersinfo(midx);
	}
	public CartVo cartinfo(int midx) {
		return payDao.cartinfo(midx);
	}


	public void detailFixDvPriceUpdate(DetailVo detailVo) {
		// TODO Auto-generated method stub
		payDao.detailFixDvPriceUpdate(detailVo);
	}

	public int detailIdxGet() {
		// TODO Auto-generated method stub
		return payDao.detailIdxGet();
	}

	public int getFixDvPrice(int cart_idx) {
		// TODO Auto-generated method stub
		return payDao.getFixDvPrice(cart_idx);
	}

	public int getOrderIdx() {
		// TODO Auto-generated method stub
		return payDao.getOrderIdx();
	}

	public void detailDayInsert() {
		// TODO Auto-generated method stub
		payDao.detailDayInsert();
	}






	
	
	
}
