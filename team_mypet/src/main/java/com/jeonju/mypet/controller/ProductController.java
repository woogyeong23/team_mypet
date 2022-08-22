package com.jeonju.mypet.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeonju.mypet.service.ProductService;
import com.jeonju.mypet.vo.BoardVo;
import com.jeonju.mypet.vo.Criteria;
import com.jeonju.mypet.vo.DetailVo;
import com.jeonju.mypet.vo.OrdersVo;
import com.jeonju.mypet.vo.PageMaker;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;
import com.jeonju.mypet.vo.ReviewVo;

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
        
        System.out.println("카테고리번호"+productList.get(0).getP_category_idx());
        
		return "product/productList";
	}
	
	
	//상품상세페이지
	@GetMapping("/productView.do")
	public String getproductView(@RequestParam("p_idx") int p_idx,@RequestParam("seller_idx") int seller_idx ,Model model,HttpServletRequest request) throws Exception {
		 System.out.println("상품번호 : " + p_idx);
		 
//		 HttpSession session = request.getSession();
//		 int midx = (Integer)session.getAttribute("midx");
//		 session.setAttribute("midx", midx);
		 
		 ProductVo productView = productService.getProductView(p_idx);
		 model.addAttribute("productView", productView);
	
		 List<Product_ImgVo> product_imgs = productService.getProductImgs(p_idx);
		 model.addAttribute("product_imgs",product_imgs);
		 
		 List<ReviewVo> reviewList = productService.getReviewList(p_idx);
		 model.addAttribute("reviewList", reviewList);
		
		 List<ProductVo> spList = productService.getspList(seller_idx);
		 model.addAttribute("spList",spList);
		 
		 int spCount = productService.getspCount(seller_idx); 
		 model.addAttribute("spCount",spCount);
		 
		 List<ProductVo> cpList = productService.getcpList(p_idx);
		 model.addAttribute("cpList",cpList);
		 
		 System.out.println("카테고리번호"+productView.getP_category_idx());
		 
		 return "product/productView"; 
	}
	
	
	//인기순
	@GetMapping("/productBest.do")
	public String getproductBest(Model model) {
		List<ProductVo> productList = productService.productBestList();
		model.addAttribute("productList",productList);
		return "product/productBest";
	}
	
	//최신순
	@GetMapping("/productNew.do")
	public String productNewList(Model model){
		List<ProductVo> productList = productService.productNewList();
		model.addAttribute("productList",productList);
		return "product/productNew";
	}
	
	//후기작성
	@GetMapping("/reviewWrite.do")
	public String reviewWrite(@RequestParam("p_idx") int p_idx,ReviewVo reviewVo,Model model, HttpServletRequest request) {
		model.addAttribute("p_idx",p_idx);
		
        HttpSession session = request.getSession();
		int midx = (int) session.getAttribute("midx");
        
		ProductVo ReviewWP = productService.getReviewp(p_idx);
		model.addAttribute("ReviewWP",ReviewWP);
		
		DetailVo odIdx = productService.odIdx(p_idx,midx);
		model.addAttribute("odIdx",odIdx);
		System.out.println("oridxo"+odIdx.getOrders_idx());
		System.out.println("oridxd"+odIdx.getDetail_idx());
		System.out.println("리뷰상품번호"+ p_idx);
		
			 return "product/reviewWrite"; 
	}
	
	@GetMapping("/reviewWriteck.do")
	public String reviewWriteck(@RequestParam("p_idx") int p_idx,Model model,HttpServletRequest request,RedirectAttributes re,HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		int midx = (int) session.getAttribute("midx");
		int count = productService.reviewWriteck(p_idx, midx);
		String pageView = null;
		
		System.out.println("midx"+midx);
		System.out.println("p_idx"+p_idx);
		System.out.println("count"+count);
		
		if (count == 0) {
			String referer = request.getHeader("Referer");
			pageView="redirect:/"+ referer;
		}else {

			re.addAttribute("p_idx",p_idx);
			re.addAttribute("midx",midx);
			
			pageView="redirect:/reviewWrite.do";
		}
		
		return pageView;
	}
	
	//리뷰콘텐츠
		@GetMapping("/reviewContent.do")
		public String reviewContent(@RequestParam("review_idx") int review_idx, ProductVo product,Model model) {
			 
			 ReviewVo reviewContent = productService.reviewContent(review_idx);
			 model.addAttribute("reviewContent", reviewContent);
			 
			 return "product/reviewContent"; 
		}
	
	
	//리뷰작성
		
		/*
	@PostMapping("/rvInsertProcess.do")
	public String rvInsertProcess(
			@RequestParam("midx") int midx,
			@RequestParam("p_idx") int p_idx,
			@RequestParam("review_stars") int review_stars ,
			@RequestParam("review_content") String review_content,
			@RequestParam("review_nick") String review_nick,
			@RequestParam("uploadImg") MultipartFile uploadImg,
			HttpSession session,Model model,HttpServletRequest request) throws IllegalStateException, IOException{
				
		String review_ori_img = uploadImg.getOriginalFilename().trim();
		System.out.println("review_ori_img :"+review_ori_img);
		String fileName1="";
		String extension="";
		String fileName2="";
		String review_img="";
		String view="";
		
		if(review_ori_img.length() == 0) review_ori_img = null;
		

		if(review_ori_img != null) { 
		int dot_idx = review_ori_img.lastIndexOf(".");
		 fileName1 = review_ori_img.substring(0, dot_idx);
		 extension = review_ori_img.substring(dot_idx+1);
		fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
		 review_img = fileName2+"."+extension;

		int Midx =  review_img.lastIndexOf(".");
		
		String upload_dir = "resources/review/upload/";
		
		String realPath = request.getServletContext().getRealPath(upload_dir);
		System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
		
		
				if(review_content.length() == 0) review_content= null;
				
				int result=0;//0:입력 실패
				
				ReviewVo reviewVo = new ReviewVo();

				reviewVo.setMidx(midx);
				reviewVo.setReview_nick(review_nick);
				reviewVo.setReview_content(review_content);
				reviewVo.setReview_img(review_img);
				reviewVo.setReview_ori_img(review_ori_img);
				
				result = productService.reviewInsert(reviewVo);
				
				view = "product/reviewWrite";
				
				if(result == 1) {
					model.addAttribute("content", review_content);
					model.addAttribute("writer", review_nick);
					model.addAttribute("img", review_img);
					
					view = "product/reviewWrite_result";
				}}

				return view;
	}
	*/
	
	@PostMapping("/rvInsertProcess.do")
	public String rvInsertProcess(
			@RequestParam("midx") int midx,
			@RequestParam("p_idx") int p_idx,
			@RequestParam("review_stars") int review_stars,
			@RequestParam("orders_idx") int orders_idx,
			@RequestParam("detail_idx") int detail_idx,
			@RequestParam("review_content") String review_content,
			@RequestParam("review_nick") String review_nick,
			@RequestParam("uploadImg") MultipartFile uploadImg,
			HttpSession session,Model model,HttpServletRequest request) throws IllegalStateException, IOException{
					
		
					//파일업로드

		String review_ori_img = uploadImg.getOriginalFilename().trim();
		System.out.println("review_ori_img :"+review_ori_img);
		String fileName1="";
		String extension="";
		String fileName2="";
		String review_img="";
		String view="";
		
		if(review_ori_img.length() == 0) review_ori_img = null;
		
		if(review_ori_img != null) { 
		int dot_idx = review_ori_img.lastIndexOf(".");
		fileName1 = review_ori_img.substring(0, dot_idx);
		extension = review_ori_img.substring(dot_idx+1);
		fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
		review_img = fileName2+"."+extension;

		String upload_dir = "resources/review/upload/";
		
		String realPath = request.getServletContext().getRealPath(upload_dir);
		System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
		
	
		String fullPath = realPath+review_img;
		uploadImg.transferTo(new File(fullPath));
		}	
					//파일업로드 끝
				
		if(review_content.length()==0) {
			request.setAttribute("msg1", "후기 내용을 입력해주세요.");
			view = "product/reviewWrite";
		  }
		else {
					int result=0;//0:입력 실패
					
					ReviewVo reviewVo = new ReviewVo();

					reviewVo.setMidx(midx);
					reviewVo.setP_idx(p_idx);
					reviewVo.setReview_stars(review_stars);
					reviewVo.setReview_nick(review_nick);
					reviewVo.setReview_content(review_content);
					reviewVo.setOrders_idx(orders_idx);
					reviewVo.setDetail_idx(detail_idx);

					reviewVo.setReview_img(review_img);
					reviewVo.setReview_ori_img(review_ori_img);
					
					result = productService.reviewInsert(reviewVo);
					
					view = "product/reviewWrite";
					
					System.out.println("midx"+midx+"p_idx"+p_idx+"review_stars"+review_stars+"review_nick"+review_nick);
					
					if(result == 1) {
						model.addAttribute("p_idx", p_idx);
						model.addAttribute("review_stars", review_stars);
						model.addAttribute("content", review_content);
						model.addAttribute("writer", review_nick);

						model.addAttribute("orders_idx", orders_idx);
						model.addAttribute("detail_idx", detail_idx);

						model.addAttribute("img", review_img);
						
						view = "product/reviewWrite_result";
					}}

					return view;
		}
		
	//소현
	
}
