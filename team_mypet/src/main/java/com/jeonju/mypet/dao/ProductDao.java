package com.jeonju.mypet.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.ProductVo;


@Repository
public class ProductDao {

	//소현
	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.product";
	
	@Autowired
	public ProductDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//상품목록
		public List<ProductVo> getProductList(int p_category_idx, int p_category_large) throws Exception{			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("p_category_idx", p_category_idx);
			map.put("p_category_large", p_category_large);
			
			return sqlSession.selectList(MAPPER + ".getProductList", map);
		}
		
/*	public List<ProductVo> getProductList(){
		return sqlSession.selectList(MAPPER + ".getProductList");
	} */

	//최신순
	public List<ProductVo> productNewList() {
		return sqlSession.selectList(MAPPER + ".productNewList");
	}

	
	
	//소현

	
	
	

}
