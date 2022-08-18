package com.jeonju.mypet.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.Cancle_DayVo;
import com.jeonju.mypet.vo.DetailVo;
import com.jeonju.mypet.vo.Detail_DayVo;
import com.jeonju.mypet.vo.OrdersVo;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;
import com.jeonju.mypet.vo.Refund_DayVo;
import com.jeonju.mypet.vo.ReviewVo;
import com.jeonju.mypet.vo.SellerStoryVo;


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

	public int addProductImg(HashMap<String,String> imgFileName) {
		// TODO Auto-generated method stub
		return sqlSession.insert(MAPPER+".addProductImg", imgFileName);
	}

	public String getSellerIdx(String member_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER+".getSellerIdx",member_id);
	}

	public List<ProductVo> getSellerProductVoList(String member_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER + ".getSellerProductVoList", member_id);
	}

	public List<OrdersVo> getSellerOrdersList(HashMap<String, String> searchInfo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER + ".getSellerOrdersList", searchInfo);
	}

	public SellerStoryVo getSeller_profile(String member_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER+".getSeller_profile",member_id);
	}

	public List<Detail_DayVo> getSeller_detailDayListVo(String detail_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER + ".getSellerDetailDayListVo", detail_idx);
	}

	public List<Refund_DayVo> getSeller_refundDayListVo(String detail_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER + ".getSellerRefundDayListVo", detail_idx);
	}

	public List<Cancle_DayVo> getSeller_cancleDayListVo(String detail_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER + ".getSellerCancleDayListVo", detail_idx);
	}

	public ReviewVo getSeller_reviewVo(String detail_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER+".getSellerReviewVo",detail_idx);
	}

	public HashMap<String, Object> getSeller_ordersContent(String detail_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER+".getSellerOrdersContent",detail_idx);
	}

	public List<DetailVo> getSeller_detailVoList(HashMap<String, String > info) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER + ".getSellerDetailVoList", info);
	}

	public String seller_ordersPrice(HashMap<String, String> info) {
		// TODO Auto-generated method stub
		System.out.println(info.get("member_id"));

		return sqlSession.selectOne(MAPPER+".getSellerOrdersPrice",info);
	}

	public HashMap<String, String> seller_ordersMap(HashMap<String, String> info) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER+".seller_ordersMap",info);
	}

	public int updateSellerAccount(SellerStoryVo sellerStoryVo) {
		// TODO Auto-generated method stub
		return sqlSession.update(MAPPER+".updateSellerAccount", sellerStoryVo);
	}

	public int delete_img(int p_front_img) {
		// TODO Auto-generated method stub
		return sqlSession.update(MAPPER+".delete_img", p_front_img);
	}

	public int updateProduct(Map<String, String> param) {
		// TODO Auto-generated method stub
		return sqlSession.update(MAPPER+".updateProduct", param);
	}

	public int DelYNProduct(Map<String, String> param) {
		// TODO Auto-generated method stub
		return sqlSession.update(MAPPER+".DelYNProduct", param);
	}

	public void updateSellerImg(HashMap<String, String> imgFileName) {
		// TODO Auto-generated method stub
		sqlSession.update(MAPPER+".updateSellerImg", imgFileName);
	}

	public void updateSellerIntro(HashMap<String, String> intro) {
		// TODO Auto-generated method stub
		sqlSession.update(MAPPER+".updateSellerIntro", intro);
	}
	
	
	
	
	

}
