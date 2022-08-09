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
import org.springframework.web.bind.annotation.RequestParam;

import com.jeonju.mypet.service.ProductService;
import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.Criteria;
import com.jeonju.mypet.vo.PageMaker;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;

@Controller
public class ProductController {
	
	//소현
	private ProductService productService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public ProductController(ProductService productService) {
		this.productService = productService;
	}
	
	
	//상품목록
	@GetMapping("/productList.do")
	public String getProductList(@RequestParam("i") int p_category_idx,
						@RequestParam("l") int p_category_large, Criteria cri,Model model) throws Exception {
		
		List<ProductVo> productList = productService.getProductList(p_category_idx,p_category_large);
		ProductVo CodeName = productService.getCodeName(p_category_idx,p_category_large);
		List<ProductVo> ListPaging = productService.getListPaging(cri);
		
		//페이지총개수
		int total = productService.getTotal();
		PageMaker pageMake = new PageMaker(cri, total);
		
		model.addAttribute("productList", productList); //리스트
		model.addAttribute("CodeName", CodeName); //카테고리
		model.addAttribute("ListPaging",ListPaging); //페이징
        model.addAttribute("pageMaker", pageMake); //상품게시물 총개수
        
		return "product/productList";
	}
	
	
	//상품상세페이지
	@GetMapping("/productView.do")
	public String getproductView(@RequestParam("p_idx") int p_idx, Model model) {
		 System.out.println("상품번호 : " + p_idx);
		 
		 ProductVo productView = productService.getProductView(p_idx);
		 model.addAttribute("productView", productView);
	
		 List<Product_ImgVo> product_imgs = productService.getProductImgs(p_idx);
		 model.addAttribute("product_imgs",product_imgs);
		 
		 return "product/productView"; 
	}
	
	
	//인기순
	@GetMapping("/productBest.do")
	public String getproductBest() {
		return "product/productBest";
	}
	
	//최신순
	@GetMapping("/productNew.do")
	public String productNewList(Model model){
		List<ProductVo> productList = productService.productNewList();
		model.addAttribute("productList",productList);
		return "product/productNew";
	}
	
	@GetMapping("/reviewWrite.do")
	public String reviewWrite() {
			 return "product/reviewWrite"; 
	}
	
	//리뷰작성 +파일업로드
	/*
	 * @PostMapping("/insertReview.do") public String
	 * insertReview(@RequestParam("uploadFile") MultipartFile uploadFile, String
	 * review_content, Model model, HttpServletRequest request) throws
	 * IllegalStateException, IOException{
	 * 
	 * return "product/productView"; }
	 */
	/* 
	 * @PostMapping("/fileUploadProcess.do")
	public String fileUploadProcess(@RequestParam("uploadFile") MultipartFile uploadFile,
			String gallery_content, Model model, HttpServletRequest request) throws IllegalStateException, IOException{
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
		String upload_dir = "resources/upload/";
		
		String realPath = request.getServletContext().getRealPath(upload_dir);
		System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
		
		//지정된 경로에 파일 저장
		//realPath와 system_fileName을 합쳐서 전체경로를 얻어야 함
		String fullPath = realPath+system_fileName;
		uploadFile.transferTo(new File(fullPath));
		
		if(gallery_content.length() == 0) gallery_content = null;
		
		int result=0;//0:입력 실패
		
		GalleryVo galleryVo = new GalleryVo();
		galleryVo.setGallery_content(gallery_content);
		galleryVo.setOrigin_filename(origin_fileName);
		galleryVo.setSystem_filename(system_fileName);
		
		result = galleryService.addGallery(galleryVo);
		String viewPage="gallery/fileUpload";
		
		if(result ==1) {
			model.addAttribute("content", gallery_content);
			model.addAttribute("fileName", system_fileName);
			viewPage = "gallery/fileUpload_result";
		}
		
		return viewPage;
	}
	 * */
	
	/*
	 * @RequestMapping(value="/registProcess.do", method = {RequestMethod.GET, RequestMethod.POST})
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
	 * 
	 * */
	
	//소현
	
}
