package com.jeonju.mypet.controller;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.jeonju.mypet.service.ProductAjaxService;
@Controller
public class ProductAjaxController {
	

	private ProductAjaxService productAjaxService;

	@Autowired
	public ProductAjaxController(ProductAjaxService productAjaxService) {
		this.productAjaxService = productAjaxService;
	}
	
	@RequestMapping(value="/uploadSummernotervImageFile", produces = "application/json; charset=utf8")
	 public String uploadSummernotervImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
			JsonObject jsonObject = new JsonObject();
			
			 
			// 내부경로로 저장
			String contextRoot = new HttpServletRequestWrapper(request).getSession().getServletContext().getRealPath("/");
			System.out.println("contextRoot :"+ contextRoot);
			String fileRoot = contextRoot+"resources/review/";
			System.out.println("fileRoot :"+fileRoot);
			
			
			String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
			String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
			
			File targetFile = new File(fileRoot + savedFileName);
			
			System.out.println("targetFile :"+targetFile);
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
				jsonObject.addProperty("url", request.getContextPath()+"/resources/review/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
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
