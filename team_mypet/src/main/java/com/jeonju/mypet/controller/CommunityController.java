package com.jeonju.mypet.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jeonju.mypet.service.CommunityService;
import com.jeonju.mypet.vo.Commu_CommentVo;
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
		
		String cm_origin_img = uploadImg.getOriginalFilename();
		
		int dot_idx = cm_origin_img.lastIndexOf(".");
		String fileName1 = cm_origin_img.substring(0, dot_idx);
		String extension = cm_origin_img.substring(dot_idx+1);
		String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
		String cm_img = fileName2+"."+extension;
		
		//upload 디렉토리에 대한 실제 경로 확인을 위해 ServletContext객체를 이용
		String upload_dir = "resources/Community/upload/";
		
		String realPath = request.getServletContext().getRealPath(upload_dir);
		System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
		
		//지정된 경로에 파일 저장
				//realPath와 system_fileName을 합쳐서 전체경로를 얻어야 함
				String fullPath = realPath+cm_img;
				uploadImg.transferTo(new File(fullPath));
				
				if(cm_subject.length() == 0) cm_subject = null;
				if(cm_content.length() == 0) cm_content= null;
				
				int result=0;//0:입력 실패
				
				CommunityVo communityVo = new CommunityVo();
				communityVo.setCm_subject(cm_subject);
				communityVo.setMidx(midx);
				communityVo.setCm_writer(cm_writer);
			    communityVo.setCm_content(cm_content);
				communityVo.setCm_img(cm_img);
				communityVo.setCm_origin_img(cm_origin_img);
				
				result = commuService.InsertCB(communityVo);
				
				String viewPage = "Community/CBInsert";
				
				if(result == 1) {
					model.addAttribute("subject", cm_subject);
					model.addAttribute("content", cm_content);
					model.addAttribute("writer", cm_writer);
					model.addAttribute("img", cm_img);
					
					viewPage = "Community/InsertCB_result";	
				}

				return viewPage;
	}
	
	@GetMapping("/CBView.do")
	public String CBView( @RequestParam("cm_idx") int cm_idx, Model model, HttpServletRequest request) {
		
		String cm_idx1 = request.getParameter("cm_idx");
		int cmidx = Integer.parseInt(cm_idx1);
		
		CommunityVo communityVo = commuService.getCBView(cmidx);
		
		List<Commu_CommentVo> ccmList = commuService.getCcmList(cmidx);
		
		model.addAttribute("communityVo", communityVo);
		model.addAttribute("ccmList", ccmList);
		
		
		return "Community/CBView";
	
	}
	
	
	
	
	
	
	
}
