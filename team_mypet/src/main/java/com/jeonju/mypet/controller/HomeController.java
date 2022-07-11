package com.jeonju.mypet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class HomeController {
	
	
	@GetMapping("/")//get방식 요청 처리
	public String home1() {
		return "home";
	}
	
	@GetMapping("/home.do")//get방식 요청 처리
	public String home2() {
		return "home";
	}
	
	
	
	
	
	
	
	
	
	
	
}
