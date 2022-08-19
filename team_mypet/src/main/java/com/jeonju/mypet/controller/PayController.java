package com.jeonju.mypet.controller;


import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.jeonju.mypet.vo.OrdersVo;

@Controller
public class PayController {
	
	
private PayService payService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public PayController(PayService payService) {
		this.payService = payService;
	}
	
	
	@GetMapping("/memberpay.do")
	public String memberpay(@RequestParam Map<String, String> param,OrdersVo ordersVo,Model model,HttpServletRequest request) {

		String c_idxArr = param.get("c_idxArr");
		System.out.println(c_idxArr);
		
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

		  return "redirect:/memberorders";
	  }
	
	
	
	
	
	
	
	
	
	
	
	
	
}
