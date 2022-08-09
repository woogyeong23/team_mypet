package com.jeonju.mypet.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.SellerDao;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;

@Service
public class SellerService {

	private SellerDao sellerDao;
	
	@Autowired
	public SellerService(SellerDao sellerDao) {
		this.sellerDao = sellerDao;
	}
	
	public List<HashMap<String, Object>> seller_productList(HashMap<String, String> searchInfo) {
		// TODO Auto-generated method stub
		return sellerDao.getSellerProductList(searchInfo);
	}

	public ProductVo seller_productDetail(String p_idx) {
		// TODO Auto-generated method stub
		return sellerDao.getSellerProductDetail(p_idx);
	}

	public List<Product_ImgVo> seller_productImgs(String p_idx) {
		// TODO Auto-generated method stub
		return sellerDao.getSellerProductImgs(p_idx);
	}

	public  int checkPName(String p_name) {
		// TODO Auto-generated method stub
		int result=0;
		result=sellerDao.checkPName(p_name);
		return result;
	}
	
	public int checkId(String id) {
		int result=0;
		result = sellerDao.checkId(id);
		return result;
	}

	public int addProduct(Map<String, String> param) {
		// TODO Auto-generated method stub
		return sellerDao.addProduct(param);
	}

	public int getPIdx() {
		// TODO Auto-generated method stub
		return sellerDao.getPIdx();
	}

	public void addProductImg(HashMap<String,String> imgFileName) {
		// TODO Auto-generated method stub
		sellerDao.addProductImg(imgFileName);
	}

	public String getSellerIdx(String member_id) {
		// TODO Auto-generated method stub
		return sellerDao.getSellerIdx(member_id);
	}

	public List<ProductVo> seller_productVoList(String member_id) {
		// TODO Auto-generated method stub
		return sellerDao.getSellerProductVoList(member_id);
	}

	public List<HashMap<String, Object>> seller_ordersList(HashMap<String, String> searchInfo) {
		// TODO Auto-generated method stub
		return sellerDao.getSellerOrdersList(searchInfo);
	}
	
}
