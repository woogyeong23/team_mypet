package com.jeonju.mypet.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jeonju.mypet.service.CommunityService;
import com.jeonju.mypet.vo.CommunityVo;

@Controller
public class CommunityController {
	
	private CommunityService commuService;
	
	@Autowired
	public CommunityController (CommunityService commuService) {
		this.commuService = commuService;
	}
	
	@GetMapping("/CBList.do")
	public String CBList(Model model) {
		
		List<CommunityVo> commuList = commuService.getCommuList();
		model.addAttribute("commuList", commuList);
	
		return "Community/CBList";
	}
	
	
	
	
	
	
	
}
