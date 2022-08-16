package com.jeonju.mypet.controller;


import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jeonju.mypet.service.PayService;
import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.DetailVo;
import com.jeonju.mypet.vo.OrdersVo;
@Controller
public class PayController {
	
	
private PayService payService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public PayController(PayService payService) {
		this.payService = payService;
	}
	
	
	@GetMapping("/memberpay.do")
	public String memberpay(OrdersVo ordersVo,Model model,HttpServletRequest request) {

		 List<OrdersVo> orderslist = new ArrayList<>();
//		 for(int i=0; i < (ordersVo.getP_idx()).length; i++) {
//			 
//			 OrdersVo oV = new OrdersVo();
//			 
//			 oV.setOrders();
//		 }
		 model.addAttribute("order", orderslist);
		 
		HttpSession Session = request.getSession();
		int midx = (int) Session.getAttribute("midx");
		
		ordersVo.setMidx(midx);
		
		
		
		return "member/memberpay";	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
