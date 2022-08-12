package com.jeonju.mypet.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.Criteria;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;
import com.jeonju.mypet.vo.ReviewVo;


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
	
	//인기순
	public List<ProductVo> productBestList() {
		return sqlSession.selectList(MAPPER + ".productBestList");
	}
	
	//상세페이지 상품이미지
	public List<Product_ImgVo> getProductImgs(int p_idx) {
		return sqlSession.selectList(MAPPER + ".getproductImgs",p_idx);
	}
	
	//상세페이지 리뷰리스트
	public List<ReviewVo> getReviewList(int p_idx) {
		return sqlSession.selectList(MAPPER + ".getReviewList",p_idx);
	}
	
	//후기작성
	public ProductVo reviewWrite(int p_idx) {
		return sqlSession.selectOne(MAPPER + ".reviewWrite",p_idx);
	}
	
	//리뷰콘텐츠
	public ReviewVo reviewContent(int review_idx) {
		return sqlSession.selectOne(MAPPER + ".reviewContent",review_idx);
	}
	
	public int insertReview(ReviewVo reviewVo) {
		return sqlSession.insert(MAPPER + ".insertReview",reviewVo);
	}
	public ProductVo getReviewp(ProductVo product) {
		return sqlSession.selectOne(MAPPER + ".getReviewp",product);
	}
	
	public List<ProductVo> getspList(int seller_idx) {
		return sqlSession.selectList(MAPPER + ".getspList",seller_idx);
	}
	
	public int getspCount(int seller_idx) {
		return sqlSession.selectOne(MAPPER + ".getspCount",seller_idx);
	}
	
	
	
	//소현

	
	
	

}
