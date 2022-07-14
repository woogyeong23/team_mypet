package com.jeonju.mypet.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.SellerDao;
import com.jeonju.mypet.vo.ProductVo;

@Service
public class SellerService {

	private SellerDao sellerDao;
	
	@Autowired
	public SellerService(SellerDao sellerDao) {
		this.sellerDao = sellerDao;
	}
	public ProductVo seller_productList(String member_id) {
		// TODO Auto-generated method stub
		return sellerDao.getSellerProductList(member_id);
	}
	
	
	
}
