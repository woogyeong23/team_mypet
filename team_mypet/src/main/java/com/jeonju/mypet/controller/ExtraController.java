package com.jeonju.mypet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeonju.mypet.service.JoeAjaxService;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.ReviewVo;
import com.jeonju.mypet.vo.SellerStoryVo;

@Controller
public class ExtraController {
	
	private JoeAjaxService joeAjaxService;
	
	@Autowired
	public ExtraController(JoeAjaxService joeAjaxService) {
		this.joeAjaxService = joeAjaxService;
	}
	
	@GetMapping("/BSellerList.do")
	public String BSellerList(Model model) {

		List<SellerStoryVo> BestSellerList = joeAjaxService.getBSList();
		model.addAttribute("BestSellerList", BestSellerList);

		return "Extra/BSellerList";
	}
	
	 @GetMapping("/BSellerView.do") 
	   public String BSellerView( @RequestParam("seller_idx") int seller_idx, Model model,
	  HttpServletRequest request) { 
		   SellerStoryVo SSVo = joeAjaxService.getBSellerView(seller_idx);
		   
		   model.addAttribute("SSV", SSVo);
		   
		   return "Extra/BSellerView";
		   
	   }
	 
	 @PostMapping("/KeywordSearch")
	   public String KeywordSearch(String keyword ,Model model) {
		   List<ProductVo> SearchList = joeAjaxService.getSearchList(keyword);
           int resultCount = joeAjaxService.resultCount(keyword);
		   
		   model.addAttribute("keyword",keyword);
		   model.addAttribute("SearchList", SearchList);
		   model.addAttribute("resultCount",resultCount);
		   
		   return "search";
		   
	   }
	 
	 @GetMapping("/realTime-review")
	   public String reviewList(Model model) {
		   List<ReviewVo> reviewList = joeAjaxService.getReviewList();
		   model.addAttribute("reviewList",reviewList);
		   
		   return "Extra/reviewList";
		   
	   }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
