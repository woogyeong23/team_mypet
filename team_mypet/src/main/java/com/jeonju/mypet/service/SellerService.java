package com.jeonju.mypet.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.SellerDao;
import com.jeonju.mypet.vo.Cancle_DayVo;
import com.jeonju.mypet.vo.DetailVo;
import com.jeonju.mypet.vo.Detail_DayVo;
import com.jeonju.mypet.vo.OrdersVo;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;
import com.jeonju.mypet.vo.Refund_DayVo;
import com.jeonju.mypet.vo.ReviewVo;
import com.jeonju.mypet.vo.SellerStoryVo;

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

	public int addProductImg(HashMap<String,String> imgFileName) {
		// TODO Auto-generated method stub
		return sellerDao.addProductImg(imgFileName);
	}

	public String getSellerIdx(String member_id) {
		// TODO Auto-generated method stub
		return sellerDao.getSellerIdx(member_id);
	}

	public List<ProductVo> seller_productVoList(String member_id) {
		// TODO Auto-generated method stub
		return sellerDao.getSellerProductVoList(member_id);
	}

	public List<OrdersVo> seller_ordersList(HashMap<String, String> searchInfo) {
		// TODO Auto-generated method stub
		return sellerDao.getSellerOrdersList(searchInfo);
	}

	public SellerStoryVo seller_profile(String member_id) {
		// TODO Auto-generated method stub
		return sellerDao.getSeller_profile(member_id);
	}

	public List<Detail_DayVo> seller_detailDayListVo(String detail_idx) {
		// TODO Auto-generated method stub
		return sellerDao.getSeller_detailDayListVo(detail_idx);
	}

	public List<Refund_DayVo> seller_refundDayListVo(String detail_idx) {
		// TODO Auto-generated method stub
		return sellerDao.getSeller_refundDayListVo(detail_idx);
	}

	public List<Cancle_DayVo> seller_cancleDayListVo(String detail_idx) {
		// TODO Auto-generated method stub
		return sellerDao.getSeller_cancleDayListVo(detail_idx);
	}

	public ReviewVo seller_reviewVo(String detail_idx) {
		// TODO Auto-generated method stub
		return sellerDao.getSeller_reviewVo(detail_idx);
	}

	public HashMap<String, Object> seller_ordersContent(String detail_idx) {
		// TODO Auto-generated method stub
		return sellerDao.getSeller_ordersContent(detail_idx);
	}

	public List<DetailVo> seller_detailVoList(HashMap<String, String > info) {
		// TODO Auto-generated method stub
		return sellerDao.getSeller_detailVoList(info);
	}

	public String seller_ordersPrice(HashMap<String, String> info) {
		// TODO Auto-generated method stub
		System.out.println(info.get("member_id"));
		return sellerDao.seller_ordersPrice(info);
	}

	public HashMap<String, String> seller_ordersMap(HashMap<String, String> info) {
		// TODO Auto-generated method stub
		return sellerDao.seller_ordersMap(info);
	}

	public int updateSellerAccount(SellerStoryVo sellerStoryVo) {
		// TODO Auto-generated method stub
		return sellerDao.updateSellerAccount(sellerStoryVo);
	}

	public int delete_img(int p_front_img) {
		// TODO Auto-generated method stub
		return sellerDao.delete_img(p_front_img);
	}

	public int updateProduct(Map<String, String> param) {
		// TODO Auto-generated method stub
		return sellerDao.updateProduct(param);
	}

	public int DelYNProduct(Map<String, String> param) {
		// TODO Auto-generated method stub
		return sellerDao.DelYNProduct(param);
	}

	public void updateSellerImg(HashMap<String, String> imgFileName) {
		// TODO Auto-generated method stub
		sellerDao.updateSellerImg(imgFileName);
	}

	public void updateSellerIntro(HashMap<String, String> intro) {
		// TODO Auto-generated method stub
		sellerDao.updateSellerIntro(intro);
	}

	public List<HashMap<String, Object>> seller_orderList(HashMap<String, String> searchInfo) {
		// TODO Auto-generated method stub
		return sellerDao.seller_orderList(searchInfo);
	}

	public void Updatedetail_status(String detail_idx) {
		// TODO Auto-generated method stub
		sellerDao.Updatedetail_status(detail_idx);
	}

	public void insertDetail_Day(String detail_idx) {
		// TODO Auto-generated method stub
		 sellerDao.insertDetail_Day(detail_idx);
	}

	public void ordersModif(HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		sellerDao.ordersModif(infoMap);
	}

	public void detailModif(HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		sellerDao.detailModif(infoMap);
	}

	public int seller_productSales(String p_idx) {
		// TODO Auto-generated method stub
		return sellerDao.seller_productSales(p_idx);
	}
	
}
