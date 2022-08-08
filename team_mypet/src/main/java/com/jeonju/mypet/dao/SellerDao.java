package com.jeonju.mypet.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;


@Repository
public class SellerDao {

	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.seller";
	
	public SellerDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<HashMap<String, Object>> getSellerProductList(HashMap<String, String> searchInfo) {
		
		
		return sqlSession.selectList(MAPPER + ".getSellerProductList", searchInfo);
	}

	public ProductVo getSellerProductDetail(String p_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER + ".getSellerProductDetail", p_idx);
	}

	public List<Product_ImgVo> getSellerProductImgs(String p_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER + ".getSellerProductImgs", p_idx);
	}
	public int checkPName(String p_name) {
		return sqlSession.selectOne(MAPPER+".checkPName", p_name);
	}
	public int checkId(String id) {
		return sqlSession.selectOne(MAPPER+".checkId", id);
	}

	public int addProduct(Map<String, String> param) {
		// TODO Auto-generated method stub
		return sqlSession.insert(MAPPER+".addProduct", param);
	}

	public int getPIdx() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER+".getPIdx");
	}

	public void addProductImg(HashMap<String,String> imgFileName) {
		// TODO Auto-generated method stub
		sqlSession.insert(MAPPER+".addProductImg", imgFileName);
	}

	public String getSellerIdx(String member_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER+".getSellerIdx",member_id);
	}

	public List<ProductVo> getSellerProductVoList(String member_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER + ".getSellerProductVoList", member_id);
	}

	public List<HashMap<String, Object>> getSellerOrdersList(HashMap<String, String> searchInfo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER + ".getSellerOrdersList", searchInfo);
	}
	
	
	
	
	

}
