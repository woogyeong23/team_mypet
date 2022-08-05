package com.jeonju.mypet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeonju.mypet.service.CartService;
import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.MembersVo;

@Controller
public class CartController {

	// 소현
	private CartService cartService;

	@Autowired
	public CartController(CartService cartService) {
		this.cartService = cartService;
	}

	
	//장바구니 상품 추가
	@ResponseBody
	@GetMapping("/insertCart.do") 
	public String insertCart(CartVo cart, HttpServletRequest request) throws Exception{ 
		//로그인체크
		HttpSession session = request.getSession();
		MembersVo mvo = (MembersVo)session.getAttribute("member");
		if(mvo == null) {
			return "5";
		}
		
		// 카트 등록
		
		int result = cartService.insertCart(cart);
		
		return result + "";
	}
		
	// 소현 끝

}
