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
	
	@GetMapping("/test.do")//get방식 요청 처리
	public String adminHome() {
		return "seller/test";
	}
	
	
	@GetMapping("/seller_productList.do")
	public String seller_productList(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		//String member_id = (String)session.getAttribute("member_id");
		String member_id= "1";
		//ProductVo productVo = sellerService.seller_productList(member_id); 
		//Spring MVC에서 Controller에서 생성되는 Model객체는 뷰단(JSP페이지)에서 참조 가능
		
		
		//List<ProductVo> productList = sellerService.seller_productList(member_id);
		//System.out.println("asdf"+productList);
		
		//model.addAttribute("productList", productList);
		
		
		List<HashMap<String, Object>> productListMap = sellerService.seller_productList(member_id);
		
		model.addAttribute("productListMap", productListMap);
		
		
		return "seller/seller_productList";
	}
	
	@GetMapping("/seller_productDetail.do")
	public String seller_productDetail( Model model, HttpServletRequest request) {
		//@RequestParam("p_idx") int p_idx,
		//HttpSession session = request.getSession();
		//String member_id = (String)session.getAttribute("member_id");
		//String member_id= "1";
		//ProductVo productVo = sellerService.seller_productList(member_id); 
		//Spring MVC에서 Controller에서 생성되는 Model객체는 뷰단(JSP페이지)에서 참조 가능
		
		
		
		//List<HashMap<String, Object>> productListMap = sellerService.seller_productList(member_id);
		
		//model.addAttribute("productListMap", productListMap);
		
		String p_idx="2";
		
		ProductVo productVo = sellerService.seller_productDetail(p_idx);
		
		List<Product_ImgVo> productImgList = sellerService.seller_productImgs(p_idx);
		productVo.setProduct_imgs(productImgList);
		
		
		
		model.addAttribute("productVo", productVo);
		
		
		
		
		return "seller/seller_productDetail";
	}
}
