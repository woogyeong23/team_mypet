package com.jeonju.mypet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.ProductDao;
import com.jeonju.mypet.vo.Criteria;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;

@Service
public class ProductService {
	
	//소현
	private ProductDao productDao;

	@Autowired
	public ProductService(ProductDao productDao) {
		this.productDao = productDao;
	}


	//상품목록
	public List<ProductVo> getProductList(int p_category_idx, int p_category_large) throws Exception {
		if (p_category_idx == 0) {
			return productDao.getProductList(p_category_large); 
		}else {
			return productDao.getProductList(p_category_idx, p_category_large);
		}
	}
	
	//상품목록페이징
	public List<ProductVo> getListPaging(Criteria cri) {        
		return productDao.getListPaging(cri);
	}    
	 
	//상품총개수(페이징)
	public int getTotal() {
		return productDao.getTotal();
	}
	
	
	
	//상품상세
	public ProductVo getProductView(int p_idx) {
		return productDao.getProductView(p_idx);
	}
	  

	//최신순
	public List<ProductVo> productNewList() {
		return productDao.productNewList();
	}


	public ProductVo getCodeName(int p_category_idx, int p_category_large) {
		return productDao.getCodeName(p_category_idx, p_category_large);
	}


	public List<Product_ImgVo> getProductImgs(int p_idx) {
		return productDao.getProductImgs(p_idx);
	}
	
	//소현
}
