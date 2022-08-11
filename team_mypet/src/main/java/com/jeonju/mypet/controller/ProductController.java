package com.jeonju.mypet.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jeonju.mypet.service.ProductService;
import com.jeonju.mypet.vo.Criteria;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.PageMaker;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;
import com.jeonju.mypet.vo.ReviewVo;

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
						@RequestParam("l") int p_category_large, Criteria cri,Model model) throws Exception {
		
		List<ProductVo> productList = productService.getProductList(p_category_idx,p_category_large);
		ProductVo CodeName = productService.getCodeName(p_category_idx,p_category_large);
		List<ProductVo> ListPaging = productService.getListPaging(cri);
		
		//페이지총개수
		int total = productService.getTotal();
		PageMaker pageMake = new PageMaker(cri, total);
		
		model.addAttribute("productList", productList); //리스트
		model.addAttribute("CodeName", CodeName); //카테고리
		model.addAttribute("ListPaging",ListPaging); //페이징
        model.addAttribute("pageMaker", pageMake); //상품게시물 총개수
        
		return "product/productList";
	}
	
	
	//상품상세페이지
	@GetMapping("/productView.do")
	public String getproductView(@RequestParam("p_idx") int p_idx, Model model) {
		 System.out.println("상품번호 : " + p_idx);
		 
		 ProductVo productView = productService.getProductView(p_idx);
		 model.addAttribute("productView", productView);
	
		 List<Product_ImgVo> product_imgs = productService.getProductImgs(p_idx);
		 model.addAttribute("product_imgs",product_imgs);
		 
		 List<ReviewVo> reviewList = productService.getReviewList(p_idx);
		model.addAttribute("reviewList", reviewList);
			
		 return "product/productView"; 
	}
	
	
	//인기순
	@GetMapping("/productBest.do")
	public String getproductBest(Model model) {
		List<ProductVo> productList = productService.productBestList();
		model.addAttribute("productList",productList);
		return "product/productBest";
	}
	
	//최신순
	@GetMapping("/productNew.do")
	public String productNewList(Model model){
		List<ProductVo> productList = productService.productNewList();
		model.addAttribute("productList",productList);
		return "product/productNew";
	}
	
	//후기작성
	@GetMapping("/reviewWrite.do")
	public String reviewWrite(int p_idx,Model model) {
		

		ProductVo ReviewWP = productService.reviewWrite(p_idx);
		
		
		model.addAttribute("ReviewWP",ReviewWP);
		
		System.out.println("리뷰상품번호"+ p_idx);
		System.out.println("작가닉"+ ReviewWP.getM_nick());
		
			 return "product/reviewWrite"; 
	}
	
	
	//리뷰콘텐츠
	//상품상세페이지
		@GetMapping("/reviewContent.do")
		public String reviewContent(@RequestParam("review_idx") int review_idx, ProductVo product,Model model) {
			 
			 ReviewVo reviewContent = productService.reviewContent(review_idx);
			 model.addAttribute("reviewContent", reviewContent);
			 
			 product = productService.getReviewp(product);
			 model.addAttribute("product", product);
			 
			 System.out.println("리뷰콘텐츠"+reviewContent.getReview_idx()+reviewContent.getReview_content());
			 
			 return "product/reviewContent"; 
		}
	
	
	@RequestMapping("/insertReview.do")
	public String insertReview(@ModelAttribute ReviewVo reviewVo, HttpSession session) throws Exception{

		int midx=(Integer)session.getAttribute("midx");
        reviewVo.setMidx(midx); 
        
		productService.insertReview(reviewVo);
		
		
		System.out.println("Reviewidx"+reviewVo.getReview_idx());
		
		 return "redirect:/productView.do";
	
	}
	
	
	
	//소현
	
}
