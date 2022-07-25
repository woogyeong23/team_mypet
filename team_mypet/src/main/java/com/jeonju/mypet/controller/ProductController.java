package com.jeonju.mypet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeonju.mypet.service.ProductService;
import com.jeonju.mypet.vo.ProductVo;

@Controller
public class ProductController {
	
	//소현
	
	//private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	private ProductService productService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public ProductController(ProductService productService) {
		this.productService = productService;
	}
	
	
	//제품리스트
	
/*	@GetMapping("/productList.do")//get방식 요청 처리
	public String getProductList(Model model){
		List<ProductVo> productList = productService.getProductList();
		model.addAttribute("productList",productList);
		return "product/productList";
	} */
	
	@GetMapping("/productList.do")
	public String getProductList(@RequestParam("i") int p_category_idx,
						@RequestParam("l") int p_category_large, Model model) throws Exception {
		
		List<ProductVo> productList = productService.getProductList(p_category_idx,p_category_large);
	
		model.addAttribute("productList", productList);
		
		return "product/productList";
	}
	
	
	
	//제품상세페이지
	@GetMapping("/productView.do")
	public String getproductView() {
		
		return "product/productView";
	}
	
	//인기순
	@GetMapping("/productBest.do")
	public String getproductBest() {
		
		return "product/productBest";
	}
	
	//최신순
	@GetMapping("/productNew.do")
	public String productNewList(Model model){
		List<ProductVo> productList = productService.productNewList();
		model.addAttribute("productList",productList);
		return "product/productNew";
	}
	
	//소현
	
}
