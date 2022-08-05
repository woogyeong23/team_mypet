package com.jeonju.mypet.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jeonju.mypet.service.SellerService;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;
@Controller
public class SellerController {
	
	private SellerService sellerService;
	
	@Autowired
	public SellerController (SellerService sellerService) {
		this.sellerService = sellerService;
	}
	
	
	@GetMapping("/seller_productList.do")
	public String seller_productList(String searching, 
			String keyword, String sorting, String status, String category,
			Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int midx = (int) session.getAttribute("midx");
		String member_id= Integer.toString(midx);
		
		if(searching == null)
			searching="searchTotal";
		if(keyword == null)
			keyword = "";
		if(sorting == null)
			sorting = "newest";
		if(status == null)
			status = "00";
		if(category == null)
			category = "00";
		
		HashMap<String, String> searchInfo = new HashMap<String, String>();
		searchInfo.put("member_id", member_id);
		searchInfo.put("searching", searching);
		searchInfo.put("sorting", sorting);
		searchInfo.put("status", status);
		searchInfo.put("category", category);
		searchInfo.put("keyword", keyword);
		//System.out.println("********************************************");
		System.out.println(member_id+searching+keyword+sorting+status+category);
		List<HashMap<String, Object>> productListMap = sellerService.seller_productList(searchInfo);
		
		model.addAttribute("productListMap", productListMap);
		model.addAttribute("searchInfo",searchInfo);
		
		return "seller/seller_productList";
	}
	
	@GetMapping("/seller_productDetail.do")
	public String seller_productDetail( @RequestParam("p_idx") String p_idx, Model model, HttpServletRequest request) {
		//@RequestParam("p_idx") String p_idx,
		
		
		
		ProductVo productVo = sellerService.seller_productDetail(p_idx);
		
		List<Product_ImgVo> productImgList = sellerService.seller_productImgs(p_idx);
		productVo.setProduct_imgs(productImgList);
		
		
		
		model.addAttribute("productVo", productVo);
		
		
		
		
		return "seller/seller_productDetail";
	}
	
	@GetMapping("/seller_productRegist.do")
	public String loginProcess(Model model, HttpServletRequest request) {
		
		
		return "seller/seller_productRegist";
	}
	@PostMapping("/checkPName.do")
	@ResponseBody //Ajax통신의 응답내용을 보내는 것을 표시
	public String checkPName(@RequestParam("p_name") String p_name) {
		
		//System.out.println("p_name: "+p_name);
		
		String result="N";//중복된 아이디 없음
		
		int flag = sellerService.checkPName(p_name);
		
		if(flag != 0) result = "Y";//중복된 아이디 있음
		
		return result;
	}

	/*
	 * //test
	 * 
	 * @PostMapping("/checkId.do")
	 * 
	 * @ResponseBody //Ajax통신의 응답내용을 보내는 것을 표시 public String
	 * checkId(@RequestParam("member_id") String id) {
	 * 
	 * System.out.println("id: "+id);
	 * 
	 * String result="N";//중복된 아이디 없음
	 * 
	 * int flag = sellerService.checkId(id);
	 * 
	 * if(flag == 1) result = "Y";//중복된 아이디 있음
	 * 
	 * return result; }
	 */
	@PostMapping("/registProcess.do")
	@ResponseBody
	public String registProcess(MultipartHttpServletRequest mRequest,
			@RequestParam Map<String, String> param,
			Model model, HttpServletRequest request
			) throws IllegalStateException, IOException{
		
		HttpSession session = request.getSession();
		int midx = (int) session.getAttribute("midx");
		String member_id= Integer.toString(midx);
		
		String p_category_idx = "";
		int p_category_large =  Integer.parseInt(param.get("p_category_large"));
		if(p_category_large==1)
	    {
	    	if(param.get("p_category_small").equals("개껌")) p_category_idx ="1";
	    	else if(param.get("p_category_small").equals("스낵")) p_category_idx ="2";
	    	else if(param.get("p_category_small").equals("뼈/육포")) p_category_idx ="3";
	    	else if(param.get("p_category_small").equals("스틱")) p_category_idx ="4";
	    	else if(param.get("p_category_small").equals("프리미엄")) p_category_idx ="5";
	    	else if(param.get("p_category_small").equals("통살")) p_category_idx ="6";
	    }
	    else if(p_category_large==2)
	    {
	    	if(param.get("p_category_small").equals("츄르")) p_category_idx ="7";
	    	else if(param.get("p_category_small").equals("스낵")) p_category_idx ="8";
	    	else if(param.get("p_category_small").equals("캣잎")) p_category_idx ="9";
	    	else if(param.get("p_category_small").equals("통살")) p_category_idx ="10";
	    	else if(param.get("p_category_small").equals("프리미엄")) p_category_idx ="11";
	    	else if(param.get("p_category_small").equals("스틱")) p_category_idx ="12";
	    }
	    
		//String p_category_idx = param.get("p_category_large");
		
		String seller_idx=sellerService.getSellerIdx(member_id);
		System.out.println("------------------------------------------------"+seller_idx);
		int result=0;//실패
		param.put("seller_idx", seller_idx);
		param.put("p_category_idx", p_category_idx);
		result = sellerService.addProduct(param);
		
		

		
		int pidx=sellerService.getPIdx();
		String p_idx= Integer.toString(pidx);
		System.out.println(p_idx);
		
		List<MultipartFile> fileList = mRequest.getFiles("file");
		System.out.println();
		
        for (MultipartFile mf : fileList) {
            String p_ori_fileName = mf.getOriginalFilename().trim(); // 원본 파일 명

          //시스템 파일명은 원본 파일명에서 파일명과 확장자를 분리한 다음 파일명에 시스템시간을 추가한 후 다시 확장자를 붙이는 식으로 생성
    		int dot_idx = p_ori_fileName.lastIndexOf(".");
    		String fileName1 = p_ori_fileName.substring(0, dot_idx);
    		String extension = p_ori_fileName.substring(dot_idx+1);
    		String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
    		String p_sys_fileName = fileName2+"."+extension;
    		
    		//upload 디렉토리에 대한 실제 경로 확인을 위해 ServletContext객체를 이용
    		String upload_dir = "resources/product/";
    		
    		String realPath = request.getServletContext().getRealPath(upload_dir);
    		System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
    		
    		//지정된 경로에 파일 저장
    		String fullPath = realPath+p_sys_fileName;
            System.out.println("********************************************");
            System.out.println("p_sys_fileName : " + p_sys_fileName);
            System.out.println("p_ori_fileName : " + p_ori_fileName);
            HashMap<String,String> imgFileName = new HashMap<String,String>();
            imgFileName.put("p_sys_fileName", p_sys_fileName);
            imgFileName.put("p_ori_fileName", p_ori_fileName);
            imgFileName.put("p_idx", p_idx);
            
            try {
                mf.transferTo(new File(fullPath));
                sellerService.addProductImg(imgFileName);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                
                e.printStackTrace();
            }
        }
		
		
		
		
		
		
	
	
	  model.addAttribute("param", param);
	  
	  System.out.println(result); String viewPage="gallery/fileUpload";
	  
	  if(result ==1) { viewPage = "gallery/fileUpload_result"; }
	 
		return "gallery/fileUpload_result";
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
