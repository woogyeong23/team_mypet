package com.jeonju.mypet.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeonju.mypet.service.CartService;
import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;
@Controller
public class CartController {
	
	private CartService cartService;

	@Autowired //자동 의존 주입: 생성자 방식
	public CartController(CartService cartService) {
		this.cartService = cartService;
	}
	//카트 리스트
	@GetMapping("/membercart.do")
	public String membercart(CartVo cartVo,Model model,HttpServletRequest request) {
		
		HttpSession Session = request.getSession();
		int midx = (int) Session.getAttribute("midx");
		
		MembersVo membersVo = new MembersVo();
		membersVo.getM_nick();
		
		List<HashMap<String, Object>> cartSellerList = cartService.cartSellerList(midx);
		model.addAttribute("cartSellerList", cartSellerList );

		cartVo.setMidx(midx);
		 List<CartVo> list = cartService.cartList(cartVo);
		 
		 HashMap<String, Object>ProductPriceMap = cartService.totalProductPrice(midx);
		System.out.println("상품총가격"+ProductPriceMap.get("totalproductprice"));
		model.addAttribute("cart", list );
		model.addAttribute("countCart",cartService.countMemberCart(cartVo));
		model.addAttribute("ProductPriceMap", ProductPriceMap );
		 
		System.out.println(list);
		 
		System.out.println("*************************");
		for (HashMap<String, Object> a : cartSellerList) {
            System.out.println("seller : "+a.get("seller_idx"));
		}
		for (CartVo b : list) {
            System.out.println("list : "+b.getSeller_idx());
		}
		return "member/membercart";	
	}
	
	//헤더부분 카트리스트
	
	
//	//장바구니 추가 부분
//	@PostMapping("/cartMemInto.do")
//	public String cartMemInto(@RequestParam("p_idx") int p_idx,CartVo cartVo,Model model,HttpServletRequest request) {
//		
//		HttpSession Session = request.getSession();
//		int midx = (int) Session.getAttribute("midx");
//		
//		cartVo.setMidx(midx);
//		cartVo.setP_idx(p_idx);
//		String data;
//		boolean isAlreadyexisted = cartService.cartMemCheck(cartVo);
//		if(isAlreadyexisted == true) {
//			data = "already_existed";
//		}else {
//			cartService.cartMemInto(cartVo);
//			data = "add_success";
//
//		}
//		return data; 
//	}
//	
						
	
	
		//장바구니 상품 추가
		@GetMapping("/insertCart.do") 
		public String insertCart(@ModelAttribute CartVo cartVo, HttpSession session) throws Exception{ 
			int midx = (int) session.getAttribute("midx");
			cartVo.setMidx(midx);
			
			//장바구니에 기존 상품이 있는지 검사
			int count = cartService.countCart(cartVo);
			
			if(count == 0) {
				//없으면 insert
				cartService.insertCart(cartVo);
			}else {
				//있으면 update
				cartService.updateCart(cartVo);
			}
			
			System.out.println(cartVo.getCart_cnt());
			
			return "redirect:/membercart.do";
	
	
		}
	
	
	
}
