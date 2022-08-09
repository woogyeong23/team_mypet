package com.jeonju.mypet.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.Criteria;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;


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
			
			return sqlSession.selectList(MAPPER + ".getProductList1", map);
	}
	
	public List<ProductVo> getProductList(int p_category_large) throws Exception{
		return sqlSession.selectList(MAPPER + ".getProductList2", p_category_large);
	}
	
	//상품목록(페이징)
	public List<ProductVo> getListPaging(Criteria cri){
		return sqlSession.selectList(MAPPER + ".getListPaging", cri);
	}
	
	//상품게시물총개수(페이징)
		public int getTotal(){
			return sqlSession.selectOne(MAPPER + ".getTotal");
		}
	
		
	//카테고리
	public ProductVo getCodeName(int p_category_idx, int p_category_large) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("p_category_idx", p_category_idx);
		map.put("p_category_large", p_category_large);
		
		return sqlSession.selectOne(MAPPER + ".getCodeName", map);
	}
		
	//상품상세페이지
	public ProductVo getProductView(int p_idx) {
		return sqlSession.selectOne(MAPPER + ".getProductView", p_idx);
	}
	
	//최신순
	public List<ProductVo> productNewList() {
		return sqlSession.selectList(MAPPER + ".productNewList");
	}
	public List<Product_ImgVo> getProductImgs(int p_idx) {
		return sqlSession.selectList(MAPPER + ".getproductImgs",p_idx);
	}
	public ProductVo reviewWrite(int p_idx) {
		return sqlSession.selectOne(MAPPER + ".reviewWrite",p_idx);
	}
	

	
	
	//소현

	
	
	

}
