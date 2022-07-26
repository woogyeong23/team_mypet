package com.jeonju.mypet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jeonju.mypet.service.HomeService;
import com.jeonju.mypet.vo.ProductVo;
@Controller
public class HomeController {
	
	private HomeService homeService;
	
	@Autowired
	public HomeController (HomeService homeService) {
		this.homeService = homeService;
	}
	
	@GetMapping("/")
	public String home1(Model model) {
		
		List<ProductVo> hList = homeService.getHList();
		model.addAttribute("HomeList",hList);
		return "home";
	}
	
	@GetMapping("/home.do")
	public String home2(Model model) {
		
		List<ProductVo> hList = homeService.getHList();
		model.addAttribute("HomeList",hList);
		return "home";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
