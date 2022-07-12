package com.jeonju.mypet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jeonju.mypet.service.CommunityService;



@Controller
public class CommunityController {
	
	private CommunityService CommunityService;
	
	@GetMapping("/cbList.do")
	public String cbList() {
		return "community/cbList";
	}
	
	@GetMapping("/cbInsert.do")
	public String cbInsert() {
		return "community/cbInsert";
	}

	
	
	
	
	
	
}
