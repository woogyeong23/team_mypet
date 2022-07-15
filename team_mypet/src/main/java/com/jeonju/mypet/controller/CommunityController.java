package com.jeonju.mypet.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeonju.mypet.service.CommunityService;
import com.jeonju.mypet.vo.CommunityVo;



@Controller
public class CommunityController {
	
	private CommunityService commuService;
	
	@Autowired
	public CommunityController(CommunityService commuService) {
		this.commuService = commuService;
	}
	
	@GetMapping("/cbList.do")
	public String cbList(Model model) {
		
		List<CommunityVo> commuList = commuService.getCommuList();
		model.addAttribute("commuList", commuList);
		
		
		return "community/cbList";
	}
	
	
//-----------------------커뮤니티 글쓰기 -------------------------------------------------------------------
	@GetMapping("/cbInsert.do")
	public String cbInsert() {
		return "community/cbInsert";
	}
	
	@PostMapping("/cbInsertProcess.do")
	public String cbInsertProcess( String cm_subject, 
			String cm_content, String cm_writer, int midx, Model model,
			HttpServletRequest request) throws IllegalStateException, IOException{
		
		int result = 0;
		
		CommunityVo commuVo = new CommunityVo();
		commuVo.setMidx(midx);
		System.out.println("midx :"+midx);
		
		commuVo.setCm_subject(cm_subject);
		System.out.println("cm_subject :"+cm_subject);
		
		commuVo.setCm_content(cm_content);
		System.out.println("cm_content"+cm_content);
		
		commuVo.setCm_writer(cm_writer);
		System.out.println("cm_writer: "+cm_writer);
		
		
		result = commuService.addInsertCommu(commuVo);
		
		String viewPage="community/cbInsert";
		
		if(result ==1) {
			model.addAttribute("midx", midx);
			model.addAttribute("cm_subject", cm_subject);
			model.addAttribute("cm_content", cm_content);
			model.addAttribute("cm_writer", cm_writer);
			
			viewPage="community/cbList";
		}
		
	    return viewPage;
	}
//----------------------------------------------------------------------------------------------------
	
	@RequestMapping("/cbView")
	public String cbView(Model model, HttpServletRequest request) throws Exception     /*PathVariable*/
	    { 
			/*
			 * model.addAttribute("community", commuService.getCBView(cm_idx));
			 * 
			 * System.out.println("community :" + model);
			 */
		
			  String cmidx = request.getParameter("cm_idx");
			  System.out.println("String cmidx :"+ cmidx ); 
			  
			  long cm_idx = Integer.parseInt(cmidx);
			  System.out.println("cm_idx : "+ cm_idx);
			  
			  CommunityVo commuVo = commuService.getCBView(cm_idx);
			  model.addAttribute("commuVo", commuVo);
			 
		
     	return "community/cbView";
	}
			
	
	

	
	
	
	
	
	
}
