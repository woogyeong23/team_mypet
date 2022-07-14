package com.jeonju.mypet.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jeonju.mypet.service.SellerService;
import com.jeonju.mypet.vo.ProductVo;
@Controller
public class SellerController {
	
	private SellerService sellerService;
	
	@Autowired
	public SellerController (SellerService sellerService) {
		this.sellerService = sellerService;
	}
	
	@GetMapping("/seller_productList.do")
	public String seller_productList(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		ProductVo productVo = sellerService.seller_productList(member_id); 
		//Spring MVC에서 Controller에서 생성되는 Model객체는 뷰단(JSP페이지)에서 참조 가능
		model.addAttribute("productVo", productVo);
		
		return "seller/seller_productList";
	}
	
	
}
