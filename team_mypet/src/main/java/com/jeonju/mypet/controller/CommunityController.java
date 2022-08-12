package com.jeonju.mypet.controller;



import java.io.File;
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;


import com.jeonju.mypet.service.CommunityService;
import com.jeonju.mypet.vo.Commu_CommentVo;
import com.jeonju.mypet.vo.Commu_Comment_LikeVo;
import com.jeonju.mypet.vo.CommunityVo;
import com.jeonju.mypet.vo.Community_likeVo;

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
	
	@GetMapping("/CBInsert.do")
	public String CBInsert() {
		return "Community/CBInsert";
	}
	
	@PostMapping("/CBInsertProcess.do")
	public String CBInsertProcess(@RequestParam("cm_subject") String cm_subject,
			@RequestParam("uploadImg") MultipartFile uploadImg,
			@RequestParam("cm_content") String cm_content, 
			@RequestParam("midx") int midx, 
			@RequestParam("cm_writer") String cm_writer, Model model, HttpServletRequest request) 
					throws IllegalStateException, IOException{
		
		
		
		String cm_origin_img = uploadImg.getOriginalFilename().trim();
		System.out.println("cm_origin_img :"+cm_origin_img);
		String fileName1="";
		String extension="";
		String fileName2="";
		String cm_img="";
		String view="";
		
		if(cm_origin_img.length() == 0) cm_origin_img = null;
		

		if(cm_origin_img != null) { 
		int dot_idx = cm_origin_img.lastIndexOf(".");
		 fileName1 = cm_origin_img.substring(0, dot_idx);
		 extension = cm_origin_img.substring(dot_idx+1);
		fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
		 cm_img = fileName2+"."+extension;

		
		//upload 디렉토리에 대한 실제 경로 확인을 위해 ServletContext객체를 이용
		String upload_dir = "resources/Community/upload/";
		
		String realPath = request.getServletContext().getRealPath(upload_dir);
		System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
		
		
		//지정된 경로에 파일 저장
				//realPath와 system_fileName을 합쳐서 전체경로를 얻어야 함
				String fullPath = realPath+cm_img;
				uploadImg.transferTo(new File(fullPath));
		}	
				
		 if(cm_subject.length()==0) {
			request.setAttribute("msg1", "제목을 입력해주세요.");
			view = "Community/CBInsert";
		  }
		 else if(cm_content.length()==0){
			 request.setAttribute("msg2", "내용을 입력해주세요");
			 view = "Community/CBInsert";
		 }
		 else {
		        
		       
				int result=0;//0:입력 실패
				
				CommunityVo communityVo = new CommunityVo();
				communityVo.setCm_subject(cm_subject);
				communityVo.setMidx(midx);
				communityVo.setCm_writer(cm_writer);
			    communityVo.setCm_content(cm_content);
				communityVo.setCm_img(cm_img);
				communityVo.setCm_origin_img(cm_origin_img);
				
				result = commuService.InsertCB(communityVo);
		
				
				 
				
				 if(result == 1) {
					model.addAttribute("subject", cm_subject);
					model.addAttribute("content", cm_content);
					model.addAttribute("writer", cm_writer);
					model.addAttribute("img", cm_img);
					
					view = "Community/InsertCB_result";	
				}}
		 
		 return view;
		
	}
	
	
	@GetMapping("/CBView.do")
	public String CBView( int cm_idx, Model model, HttpServletRequest request) {
		
		CommunityVo communityVo = commuService.getCBView(cm_idx);
		List<Commu_CommentVo> ccmList = commuService.getCcmList(cm_idx);
		int replyCount = commuService.getReplyCount(cm_idx);
		int plusCmView = commuService.plusCmView(cm_idx);
		
//		int midx = 0;
		long midx = 0;
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("midx") != null ) {
//			midx = (int)session.getAttribute("midx");
			midx = (long) session.getAttribute("midx");
			
			Community_likeVo community_likeVo = new Community_likeVo();
			community_likeVo.setMidx((int) midx);
			community_likeVo.setCm_idx(cm_idx);
			
			int CmLikeYn = commuService.getCmLikeYn(community_likeVo);
			

			
			
			model.addAttribute("CmLikeYn", CmLikeYn);
			model.addAttribute("communityVo", communityVo);
			model.addAttribute("ccmList", ccmList);
			model.addAttribute("replyCount", replyCount);
			model.addAttribute("plusCmView",plusCmView);
		} else {	
			model.addAttribute("communityVo", communityVo);
			model.addAttribute("ccmList", ccmList);
			model.addAttribute("replyCount", replyCount);
			model.addAttribute("plusCmView",plusCmView);
		}
		
		return "Community/CBView";
	}
	
	@GetMapping("/modi_cm")
	public String modi_CB(int cm_idx, Model model) {
		
		CommunityVo communityVo = commuService.modi_CB(cm_idx);
		
		model.addAttribute("commuVo", communityVo);
		
		return "Community/Modi_CB";
	}
	
	@PostMapping("/Modi_CBProcess.do")
    public String Modi_process(@RequestParam("cm_subject") String cm_subject,
			@RequestParam("uploadImg") MultipartFile uploadImg,
			@RequestParam("cm_content") String cm_content, 
			@RequestParam("cm_idx") int cm_idx,
             Model model, HttpServletRequest request) 
					throws IllegalStateException, IOException{
		
		
		
		String cm_origin_img = uploadImg.getOriginalFilename().trim();
		System.out.println("cm_origin_img :"+cm_origin_img);
		String fileName1="";
		String extension="";
		String fileName2="";
		String cm_img="";
		String view="";
		
		if(cm_origin_img.length() == 0) cm_origin_img = null;
		

		if(cm_origin_img != null) { 
		int dot_idx = cm_origin_img.lastIndexOf(".");
		 fileName1 = cm_origin_img.substring(0, dot_idx);
		 extension = cm_origin_img.substring(dot_idx+1);
		fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
		 cm_img = fileName2+"."+extension;

		
		//upload 디렉토리에 대한 실제 경로 확인을 위해 ServletContext객체를 이용
		String upload_dir = "resources/Community/upload/";
		
		String realPath = request.getServletContext().getRealPath(upload_dir);
		System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
		
		
		//지정된 경로에 파일 저장
				//realPath와 system_fileName을 합쳐서 전체경로를 얻어야 함
				String fullPath = realPath+cm_img;
				uploadImg.transferTo(new File(fullPath));
		}	
				
		 if(cm_subject.length()==0) {
			request.setAttribute("msg1", "제목을 입력해주세요.");
			view = "Community/modi_cm";
		  }
		 else if(cm_content.length()==0){
			 request.setAttribute("msg2", "내용을 입력해주세요");
			 view = "Community/modi_cm";
		 }
		 else {
		        
		       
				int result=0;//0:입력 실패
				
				CommunityVo communityVo = new CommunityVo();
				communityVo.setCm_subject(cm_subject);
			    communityVo.setCm_content(cm_content);
				communityVo.setCm_img(cm_img);
				communityVo.setCm_idx(cm_idx);
				communityVo.setCm_origin_img(cm_origin_img);
				
				result = commuService.UpdateCB(communityVo);
		
				
				 
				
				 if(result == 1) {
					
					view = "redirect:/home.do";	
				}}
		 
		 return view;
		
	}
	
	
	
	
	
	
}
