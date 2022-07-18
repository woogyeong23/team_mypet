package com.jeonju.mypet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.ProductDao;
import com.jeonju.mypet.vo.ProductVo;

@Service
public class ProductService {
	
	//소현
	private ProductDao productDao;

	@Autowired
	public ProductService(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	public List<ProductVo> getProductList() {
		return productDao.getProductList();
	}
	
	//소현
}
