
package com.jeonju.mypet.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Extension.Parameter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeonju.mypet.service.JoeAjaxService;
import com.jeonju.mypet.vo.FollowVo;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;
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
	public String BSellerList(Model model, HttpServletRequest request) {

		List<SellerStoryVo> BestSellerList = joeAjaxService.getBSList();
//		List<SellerStoryVo> BestSellerList2 = joeAjaxService.getBsList2();
//		
//		
//		int seller_idx = 0;
//		int p_idx = 0;
//		List<Product_ImgVo> PiList = new ArrayList<Product_ImgVo>();
//		
//		for(int i=0; i < BestSellerList.size(); i++) {
//		seller_idx = BestSellerList.get(i).getSeller_idx();
//		ProductVo po = new ProductVo();
//		po.setSeller_idx(seller_idx);
//		  for(int j=0; j < BestSellerList2.size(); j++) {
//	      p_idx = BestSellerList2.get(j).getP_idx();
//	      po.setP_idx(p_idx);
//	      Product_ImgVo pi = joeAjaxService.getPI(po);
//		  PiList.add(pi);
//		  
//		  model.addAttribute("p_img",PiList);
//		     }
//	
//		}
		
		System.out.println("BestSellerList :"+BestSellerList);
			
		model.addAttribute("BestSellerList", BestSellerList);
				
		return "Extra/BSellerList";
	}
	
	 @GetMapping("/BSellerView.do") 
	   public String BSellerView( @RequestParam("seller_idx") int seller_idx, Model model,
	  HttpServletRequest request) { 
		 
		
		  
		 
		   SellerStoryVo SSVo = joeAjaxService.getBSellerView(seller_idx);
		   List<ProductVo> BSPList = joeAjaxService.getBSPList(seller_idx);
		   int BSPCount = joeAjaxService.getBSPCount(seller_idx); 
		   List<ReviewVo> aList = joeAjaxService.getAList(seller_idx);
		   int BSRCount = joeAjaxService.getBSRCount(seller_idx);
		   
		   long midx = 0;

		   HttpSession session = request.getSession();
		   
		  
			   if(session.getAttribute("midx") != null) {
//				   midx = (int)session.getAttribute("midx");
				   midx =  (long) session.getAttribute("midx");
				   
				   FollowVo followVo = new FollowVo();
				   followVo.setMidx((int) midx);
				   followVo.setSeller_idx(seller_idx);
				   
				   int followCNT = joeAjaxService.getfollowCNT(followVo);
				   
				   model.addAttribute("followCNT",followCNT);
				   model.addAttribute("SSV", SSVo);
				   model.addAttribute("BSPList",BSPList);
				   model.addAttribute("BSPCount",BSPCount);
				   model.addAttribute("aList", aList);
				   model.addAttribute("BSRCount",BSRCount); 
				   
			   } else{
				   model.addAttribute("SSV", SSVo);
				   model.addAttribute("BSPList",BSPList);
				   model.addAttribute("BSPCount",BSPCount);
				   model.addAttribute("aList", aList);
				   model.addAttribute("BSRCount",BSRCount);
			   }
			   
		 
		   
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
	 
	 @GetMapping("/Error")
	 public String Error() {
		 
		 return "Extra/error"; 
	 }
	 
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

