package com.jeonju.mypet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.ProductDao;
import com.jeonju.mypet.vo.CommentVo;
import com.jeonju.mypet.vo.Criteria;
import com.jeonju.mypet.vo.DetailVo;
import com.jeonju.mypet.vo.OrdersVo;
import com.jeonju.mypet.vo.PetVo;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;
import com.jeonju.mypet.vo.ReviewVo;

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
	
	//인기순
	public List<ProductVo> productBestList() {
		return productDao.productBestList();
	}

	//카테고리이름
	public ProductVo getCodeName(int p_category_idx, int p_category_large) {
		return productDao.getCodeName(p_category_idx, p_category_large);
	}

	//상세페이지 상품이미지
	public List<Product_ImgVo> getProductImgs(int p_idx) {
		return productDao.getProductImgs(p_idx);
	}

	//상세페이지 리뷰리스트
	public List<ReviewVo> getReviewList(int p_idx) {
		return productDao.getReviewList(p_idx);
	}

	//후기작성
	public ProductVo getReviewp(int p_idx) {
		return productDao.getReviewp(p_idx);
	}


	public ReviewVo reviewContent(int review_idx) {
		return productDao.reviewContent(review_idx);
	}


	public int reviewInsert(ReviewVo reviewVo) {
		return productDao.reviewInsert(reviewVo);
	}

	
	//상세뷰 하단 판매자의 다른 상품
	public List<ProductVo> getspList(int seller_idx) {
		return productDao.getspList(seller_idx);
	}


	public int getspCount(int seller_idx) {
		return productDao.getspCount(seller_idx);
	}


	public List<ProductVo> getcpList(int p_idx) {
		return productDao.getcpList(p_idx);
	}


	public int reviewWriteck(int p_idx, int midx) {
		return productDao.reviewWriteck(p_idx, midx);
	}


	public DetailVo odIdx(int p_idx, int midx) {
		return productDao.odIdx(p_idx, midx);
	}


	public List<CommentVo> getcmList(int p_idx) {
		return productDao.getcmList(p_idx);
	}


	public void starUpdate(int p_idx) {
		productDao.starUpdate(p_idx);
	}


	public List<ReviewVo> imgCheckbox(int p_idx) {
		return productDao.imgCheckbox(p_idx);
	}





	
	//소현
}
