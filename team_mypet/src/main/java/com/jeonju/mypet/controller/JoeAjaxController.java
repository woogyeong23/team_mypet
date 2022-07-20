package com.jeonju.mypet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jeonju.mypet.service.JoeAjaxService;
import com.jeonju.mypet.vo.Commu_CommentVo;
import com.jeonju.mypet.vo.SellerStoryVo;


//Ajax통신 지원을 위해 pom.xml에 의존모듈(jackson)을 추가해 줌

@Controller
//@RestController //Spring4버전부터 지원. @Controller + @ResponseBody 기능
public class JoeAjaxController {
	
	private JoeAjaxService joeAjaxService;
	
	@Autowired
	public JoeAjaxController(JoeAjaxService joeAjaxService) {
		this.joeAjaxService = joeAjaxService;
	}
	
	@PostMapping("/InsertComment")
	public String InsertComment(Commu_CommentVo CCommentVo) {
		
		String result="N";
		
		int flag = joeAjaxService.InsertComment(CCommentVo);
		
		if(flag == 1) result = "Y";
		
		return result;
		
	}
	
	@GetMapping("/BSellerList.do")
	public String BSellerList(Model model) {
		
		List<SellerStoryVo> BestSellerList = joeAjaxService.getBSList(); 
		model.addAttribute("BestSellerList", BestSellerList);
		
		return "BestSeller/BSellerList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
