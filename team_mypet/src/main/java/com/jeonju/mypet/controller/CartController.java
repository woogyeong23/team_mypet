package com.jeonju.mypet.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeonju.mypet.service.CartService;
import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.ProductVo;
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
		
		cartVo.setMidx(midx);
		 List<ProductVo> list = cartService.cartList(cartVo);
		 ProductVo productVo = new ProductVo();
		model.addAttribute("cart", list );
		model.addAttribute("cartCount",cartService.cartCount(cartVo));
		
		 
		System.out.println(list);
		 
		return "member/membercart";	
	}
	
	//헤더부분 카트리스트
	@GetMapping("/cartHeaderView")
	public List<ProductVo> cartHeaderView(CartVo cartVo,Model model,HttpServletRequest request)throws Exception {
		
		HttpSession Session = request.getSession();
		int midx = (int) Session.getAttribute("midx");
		
		 List<ProductVo> list = new ArrayList<>();
		
			cartVo.setMidx(midx);
			list = cartService.cartList(cartVo);
			
			
		return list;	
	}
	
	//장바구니 추가 부분
	@PostMapping("/cartMemInto.do")
	public String cartMemInto(@RequestParam("p_idx") int p_idx,CartVo cartVo,Model model,HttpServletRequest request) {
		
		HttpSession Session = request.getSession();
		int midx = (int) Session.getAttribute("midx");
		
		cartVo.setMidx(midx);
		cartVo.setP_idx(p_idx);
		String data;
		boolean isAlreadyexisted = cartService.cartMemCheck(cartVo);
		if(isAlreadyexisted == true) {
			data = "already_existed";
		}else {
			cartService.cartMemInto(cartVo);
			data = "add_success";

		}
		return data; 
	}
	
	
	
	
	
	
	
	
	
	
	
}
