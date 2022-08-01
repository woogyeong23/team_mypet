package com.jeonju.mypet.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeonju.mypet.service.SellerService;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;
@Controller
public class SellerController {
	
	private SellerService sellerService;
	
	@Autowired
	public SellerController (SellerService sellerService) {
		this.sellerService = sellerService;
	}
	
	
	@GetMapping("/seller_productList.do")
	public String seller_productList(String searching, 
			String keyword, String sorting, String status, String category,
			Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int midx = (int) session.getAttribute("midx");
		String member_id= Integer.toString(midx);
		
		if(searching == null)
			searching="";
		if(keyword == null)
			keyword = "";
		if(sorting == null)
			sorting = "";
		if(status == null)
			status = "";
		if(category == null)
			category = "";
		
		HashMap<String, String> searchInfo = new HashMap<String, String>();
		searchInfo.put("member_id", member_id);
		searchInfo.put("searching", searching);
		searchInfo.put("sorting", sorting);
		searchInfo.put("status", status);
		searchInfo.put("category", category);
		searchInfo.put("keyword", keyword);
		System.out.println("********************************************");
		System.out.println(searching+keyword+sorting+status+category);
		List<HashMap<String, Object>> productListMap = sellerService.seller_productList(searchInfo);
		
		model.addAttribute("productListMap", productListMap);
		model.addAttribute("searchInfo",searchInfo);
		
		return "seller/seller_productList";
	}
	
	@GetMapping("/seller_productDetail.do")
	public String seller_productDetail( @RequestParam("p_idx") String p_idx, Model model, HttpServletRequest request) {
		//@RequestParam("p_idx") String p_idx,
		
		
		
		ProductVo productVo = sellerService.seller_productDetail(p_idx);
		
		List<Product_ImgVo> productImgList = sellerService.seller_productImgs(p_idx);
		productVo.setProduct_imgs(productImgList);
		
		
		
		model.addAttribute("productVo", productVo);
		
		
		
		
		return "seller/seller_productDetail";
	}
}
