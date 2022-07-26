package com.jeonju.mypet.dao;


import java.util.HashMap;
import java.util.List;

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
	
	public List<HashMap<String, Object>> getSellerProductList(String member_id) {
		
		
		return sqlSession.selectList(MAPPER + ".getSellerProductList", member_id);
	}

	public ProductVo getSellerProductDetail(String p_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER + ".getSellerProductDetail", p_idx);
	}

	public List<Product_ImgVo> getSellerProductImgs(String p_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER + ".getSellerProductImgs", p_idx);
	}

	
	
	
	
	
	

}
