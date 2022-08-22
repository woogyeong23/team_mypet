package com.jeonju.mypet.controller;


import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeonju.mypet.service.PayService;
import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.DetailVo;
import com.jeonju.mypet.vo.OrdersListVo;
import com.jeonju.mypet.vo.OrdersVo;

@Controller
public class PayController {
	
	
private PayService payService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public PayController(PayService payService) {
		this.payService = payService;
	}
	
	//주문하기 페이지 넘어가기
	@GetMapping("/memberpay.do")
	public String memberpay(@RequestParam Map<String, String> param,OrdersVo ordersVo,Model model,HttpServletRequest request) {

		HttpSession Session = request.getSession();
		int midx = (int) Session.getAttribute("midx");
		
		 List<OrdersVo> orderslist = new ArrayList<>();

		 model.addAttribute("orderslist", orderslist);
		 HashMap<String, Object>ProductPriceMap = payService.totalProductPrice(midx);

	
		ordersVo.setMidx(midx);
		
		List<OrdersVo> ordersList = payService.orderpay(ordersVo);
		
		model.addAttribute("ordersList",ordersList);
		model.addAttribute("ProductPriceMap",ProductPriceMap);

		return "member/memberpay";	
	}
		//결제 성공 시 주문 및 카트 삭제 
	  @PostMapping("/orderInsert.do")
	  public String orderInsert(OrdersVo ordersVo, DetailVo detailVo, HttpServletRequest request)throws Exception{
		 
		  	HttpSession Session = request.getSession();
			int midx = (int) Session.getAttribute("midx");
			Calendar cal = Calendar.getInstance();
			 int year = cal.get(Calendar.YEAR);
			 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
			 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
			 String subNum = "";
			 
			 for(int i = 1; i <= 6; i ++) {
			  subNum += (int)(Math.random() * 10);
			 }
			 
			 String detail_idx = ymd + "_" + subNum;
			 
			ordersVo.setMidx(midx);
			
			payService.orderInsert(ordersVo);

			
			detailVo.setDetail_idx(midx);
			detailVo.setDetail_completeday(detail_idx);
			
			payService.detailInsert(detailVo);

		  return "redirect:/memberorderList.do";
	  }
	  //주문상세목록
	  @PostMapping("/OrderView.do")
	  public void OrderView( HttpServletRequest request, @RequestParam("n") int orders_idx,
			  OrdersVo ordersVo, Model model) throws Exception {
	   
		HttpSession Session = request.getSession();
		int midx = (int) Session.getAttribute("midx");
	   
		ordersVo.setMidx(midx);
		ordersVo.setOrders_idx(orders_idx);
	   
	   List<OrdersListVo> orderView = payService.orderview(ordersVo);
	   
	   model.addAttribute("orderView", orderView);
	  }
	
	
	
	
	
	
	
	
	
	
	
}
