package com.jeonju.mypet.controller;


import java.util.List;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jeonju.mypet.service.HomeService;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.ReviewVo;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.MembersVo;

@Controller
public class HomeController {
	
	private HomeService homeService;

	
	@Autowired //의존 자동 주입 : 생성자 방식
	public HomeController(HomeService homeService) {
		this.homeService = homeService;
	}
	
	@GetMapping("/")
	public String home1(Model model, HttpServletRequest request) {
		
		List<ProductVo> hList = homeService.getHList();
		List<ProductVo> hList2 = homeService.getHList2();
		List<ProductVo> hList3 = homeService.getHList3();
		List<ProductVo> hList4 = homeService.getHList4();
		List<ProductVo> hList5 = homeService.getHList5();
		 //리뷰전용
		List<ReviewVo> hList6 = homeService.getHList6();
		
		
		

				model.addAttribute("HomeList",hList);
				model.addAttribute("HomeList2",hList2);
				model.addAttribute("HomeList3",hList3);
				model.addAttribute("HomeList4",hList4);
				model.addAttribute("HomeList5",hList5);
               //리뷰전용
				model.addAttribute("HomeList6",hList6);
	
		 
		
	
		
		

		
		
		
		return "home";
	}
	
	@GetMapping("/home.do")
	public String home2(Model model,HttpServletRequest request) {
		List<ProductVo> hList = homeService.getHList();
		List<ProductVo> hList2 = homeService.getHList2();
		List<ProductVo> hList3 = homeService.getHList3();
		List<ProductVo> hList4 = homeService.getHList4();
		List<ProductVo> hList5 = homeService.getHList5();
		 //리뷰전용
		List<ReviewVo> hList6 = homeService.getHList6();
		
		
		
		

				model.addAttribute("HomeList",hList);
				model.addAttribute("HomeList2",hList2);
				model.addAttribute("HomeList3",hList3);
				model.addAttribute("HomeList4",hList4);
				model.addAttribute("HomeList5",hList5);	 
			    //리뷰전용
			    model.addAttribute("HomeList6",hList6);

		 
		
		return "home";
	}
	
	@PostMapping("/profileUpload.do")
	public String fileUploadProcess(@RequestParam("uploadFile") MultipartFile uploadFile,
			String gallery_content, Model model, HttpServletRequest request ) throws IllegalStateException, IOException{
		//<input type ="file" name="uploadFile" />에서 업로드된 파일객체를 MultipartFile uploadFile에 저장
		
		//업로드된 파일을 프로젝트 내의 upload 폴더에 저장하기 전에 DB의 upload_file 테이블에 저장할 
		//origin_filename과 system_filename 값을 세팅함
		
		String origin_fileName = uploadFile.getOriginalFilename();
		
		//시스템 파일명은 원본 파일명에서 파일명과 확장자를 분리한 다음 파일명에 시스템시간을 추가한 후 다시 확장자를 붙이는 식으로 생성
		int dot_idx = origin_fileName.lastIndexOf(".");
		String fileName1 = origin_fileName.substring(0, dot_idx);
		String extension = origin_fileName.substring(dot_idx+1);
		String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
		String system_fileName = fileName2+"."+extension;
		
		//upload 디렉토리에 대한 실제 경로 확인을 위해 ServletContext객체를 이용
		String upload_dir = "resources/assets/upload/";
		
		String realPath = request.getServletContext().getRealPath(upload_dir);
								
		System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
		
		//지정된 경로에 파일 저장
		//realPath와 system_fileName을 합쳐서 전체경로를 얻어야 함
		String fullPath = realPath+system_fileName;
		uploadFile.transferTo(new File(fullPath));
		
		if(gallery_content.length() == 0) gallery_content = null;
		
		int result=0;//0:입력 실패
		
		MembersVo membersVo = new MembersVo();
		
		membersVo.setM_profile(origin_fileName);
		
		result = homeService.addProfile(membersVo);
		
		String viewPage="gallery/fileUpload";
		
		if(result ==1) {
			model.addAttribute("content", gallery_content);
			model.addAttribute("fileName", system_fileName);
			viewPage = "gallery/fileUpload_result";
		}
		
		return viewPage;
	}
	
	
	
	
	
	
	
	
	
	
	
}
