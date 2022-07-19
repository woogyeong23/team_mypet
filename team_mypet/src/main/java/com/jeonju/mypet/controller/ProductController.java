package com.jeonju.mypet.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeonju.mypet.service.ProductService;
import com.jeonju.mypet.vo.ProductVo;
@Controller
public class ProductController {
	
	//소현
	private ProductService productService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public ProductController(ProductService productService) {
		this.productService = productService;
	}
	
	@GetMapping("/productList.do")//get방식 요청 처리
	public String getProductList(Model model){
		List<ProductVo> productList = productService.getProductList();
		model.addAttribute("productList",productList);
		return "product/productList";
	}
	
	@GetMapping("/productView.do")
	public String getproductView() {
		
		return "product/productView";
	}
	
	@GetMapping("/productBest.do")
	public String getproductBest() {
		
		return "product/productBest";
	}
	
	@GetMapping("/productNew.do")
	public String getproductNew() {
		
		return "product/productNew";
	}
	
	//소현
	
}
