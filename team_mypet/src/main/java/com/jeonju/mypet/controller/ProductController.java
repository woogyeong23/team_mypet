package com.jeonju.mypet.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
	public String getProductList(Model model) {
		
		List<ProductVo> productList = productService.getProductList();
		//모델객체에 회원목록을 추가함
		model.addAttribute("productList",productList);
		
		return "product/productList";
	}
	
	//소현
	
}
