package com.jeonju.mypet.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
			searching="searchTotal";
		if(keyword == null)
			keyword = "";
		if(sorting == null)
			sorting = "newest";
		if(status == null)
			status = "00";
		if(category == null)
			category = "00";
		
		HashMap<String, String> searchInfo = new HashMap<String, String>();
		searchInfo.put("member_id", member_id);
		searchInfo.put("searching", searching);
		searchInfo.put("sorting", sorting);
		searchInfo.put("status", status);
		searchInfo.put("category", category);
		searchInfo.put("keyword", keyword);
		//System.out.println("********************************************");
		System.out.println(member_id+searching+keyword+sorting+status+category);
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
	
	@GetMapping("/seller_productRegist.do")
	public String loginProcess(Model model, HttpServletRequest request) {
		
		
		return "seller/seller_productRegist";
	}
	@PostMapping("/checkPName.do")
	@ResponseBody //Ajax통신의 응답내용을 보내는 것을 표시
	public String checkPName(@RequestParam("p_name") String p_name) {
		
		//System.out.println("p_name: "+p_name);
		
		String result="N";//중복된 아이디 없음
		
		int flag = sellerService.checkPName(p_name);
		
		if(flag == 1) result = "Y";//중복된 아이디 있음
		
		return result;
	}

	/*
	 * //test
	 * 
	 * @PostMapping("/checkId.do")
	 * 
	 * @ResponseBody //Ajax통신의 응답내용을 보내는 것을 표시 public String
	 * checkId(@RequestParam("member_id") String id) {
	 * 
	 * System.out.println("id: "+id);
	 * 
	 * String result="N";//중복된 아이디 없음
	 * 
	 * int flag = sellerService.checkId(id);
	 * 
	 * if(flag == 1) result = "Y";//중복된 아이디 있음
	 * 
	 * return result; }
	 */
	@PostMapping("/registProcess.do")
	@ResponseBody
	public String registProcess(
			String p_name, String p_category_large, String p_category_small, String p_size, String p_content, String p_status,
			
			Model model, HttpServletRequest request)throws Exception{
		
		
		int result=0;//중복된 아이디 없음
		String viewPage = "";
		System.out.println("****************************************"+p_name+p_category_large+p_category_small+p_size+p_content+p_status);
		
		
		return "seller/seller_productList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
