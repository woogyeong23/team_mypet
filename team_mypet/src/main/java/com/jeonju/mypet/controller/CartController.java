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
import org.springframework.web.bind.annotation.ModelAttribute;

import com.jeonju.mypet.service.CartService;
import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.ProductVo;

@Controller
public class CartController {
	
	private final Logger LOGGER = LoggerFactory.getLogger(CartController.class.getName());

	// 소현
	private CartService cartService;

	@Autowired
	public CartController(CartService cartService) {
		this.cartService = cartService;
	}

	
	//장바구니 상품 추가
	@GetMapping("/insertCart.do") 
	public String insertCart(@ModelAttribute CartVo cart, HttpSession session) throws Exception{ 
		int midx = (int) session.getAttribute("midx");
		cart.setMidx(midx);
		
		//장바구니에 기존 상품이 있는지 검사
		int count = cartService.countCart(cart.getP_idx(), midx);
		
		if(count == 0) {
			//없으면 insert
			cartService.insertCart(cart);
		}else {
			//있으면 update
			cartService.updateCart(cart);
		}
		return "member/membercart";
	}
		
	// 소현 끝

	//카트 리스트
		@GetMapping("/membercart.do")
		public String membercart(CartVo cartVo,Model model,HttpServletRequest request) {
			
			HttpSession Session = request.getSession();
			int midx = (int) Session.getAttribute("midx");
			
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
				
				LOGGER.info("카트헤더들옴??");
				
			return list;	
		}
		
		//장바구니 추가 부분
		@GetMapping("/cartMemInto.do")
		public int cartMemInto(CartVo cartVo,Model model,HttpServletRequest request) {
			
			LOGGER.info("p_idx=" + cartVo.getP_idx());		
			HttpSession Session = request.getSession();
			int midx = (int) Session.getAttribute("midx");
			
			cartVo.setMidx(midx);
			if(cartService.cartMemCheck(cartVo) != 0) {
				return 2;
			}
			 cartService.cartMemInto(cartVo);
			
			return 1;	
		}
	
}
