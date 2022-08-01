package com.jeonju.mypet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	private ProductService productService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public ProductController(ProductService productService) {
		this.productService = productService;
	}
	
	
	//상품목록
	@GetMapping("/productList.do")
	public String getProductList(@RequestParam("i") int p_category_idx,
						@RequestParam("l") int p_category_large, Model model) throws Exception {
		
		List<ProductVo> productList = productService.getProductList(p_category_idx,p_category_large);
		
		ProductVo CodeName = productService.getCodeName(p_category_idx,p_category_large);
		
		model.addAttribute("productList", productList);
		model.addAttribute("CodeName", CodeName);
		
		
		return "product/productList";
	}
	
	
	//상품상세페이지
	@GetMapping("/productView.do")
	public String getproductView(@RequestParam("p_idx") int p_idx, Model model) {
		 System.out.println("상품번호 : " + p_idx);
		 
		 ProductVo productView = productService.getProductView(p_idx);
		 model.addAttribute("productView", productView);
	
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
