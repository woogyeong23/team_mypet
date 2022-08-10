package com.jeonju.mypet.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.jeonju.mypet.service.JoeAjaxService;
import com.jeonju.mypet.vo.Commu_CommentVo;


//Ajax통신 지원을 위해 pom.xml에 의존모듈(jackson)을 추가해 줌

//@Controller
@RestController //Spring4버전부터 지원. @Controller + @ResponseBody 기능
public class JoeAjaxController {

	private JoeAjaxService joeAjaxService;

	@Autowired
	public JoeAjaxController(JoeAjaxService joeAjaxService) {
		this.joeAjaxService = joeAjaxService;
	}

	@PostMapping("/InsertComment.do")
	public String InsertComment(Commu_CommentVo CCommentVo) {
		
		String ww = "N";
		
		 int flag = joeAjaxService.InsertComment(CCommentVo);
		 
		 if(flag == 1)
		   ww = "I";
		
		 return ww;
	}
	
	@PostMapping("/CCInsert")
	public String CCInsert(Commu_CommentVo CCommentVo) {
		System.out.println("111122222222222222");
		
		String qw = "N";
		
		int qq = joeAjaxService.UpDepth(CCommentVo);
		int flag = joeAjaxService.CCInsert(CCommentVo);
		
		System.out.println(qq+flag+"=qq+flag");
		
		if(flag+qq != 0)
			qw = "H";
		
		return qw;
	}
	
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	 public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
			JsonObject jsonObject = new JsonObject();
			
			 
			// 내부경로로 저장
			String contextRoot = new HttpServletRequestWrapper(request).getSession().getServletContext().getRealPath("/");
			System.out.println("contextRoot :"+ contextRoot);
			String fileRoot = contextRoot+"resources/commuImg/";
			System.out.println("fileRoot :"+fileRoot);
			
			
			String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
			String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
			
			File targetFile = new File(fileRoot + savedFileName);
			
			System.out.println("targetFile :"+targetFile);
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
				jsonObject.addProperty("url", request.getContextPath()+"/resources/commuImg/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
				System.out.println("jsonObject 1 :"+jsonObject);
				jsonObject.addProperty("responseCode", "success");
					
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
				jsonObject.addProperty(request.getContextPath()+"/responseCode", "error");
				e.printStackTrace();
			}
			String a = jsonObject.toString();
			System.out.println("jsonObject 2 :"+jsonObject);
			return a;
		}

	

	
	  
	   
	   
	   
	   
	   
	 

		   
}
