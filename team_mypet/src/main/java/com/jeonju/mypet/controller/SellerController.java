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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jeonju.mypet.service.SellerService;
import com.jeonju.mypet.vo.Cancle_DayVo;
import com.jeonju.mypet.vo.DetailVo;
import com.jeonju.mypet.vo.Detail_DayVo;
import com.jeonju.mypet.vo.OrdersVo;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;
import com.jeonju.mypet.vo.Refund_DayVo;
import com.jeonju.mypet.vo.ReviewVo;
import com.jeonju.mypet.vo.SellerStoryVo;
@Controller
public class SellerController {
	
	private SellerService sellerService;
	
	@Autowired
	public SellerController (SellerService sellerService) {
		this.sellerService = sellerService;
	}
	
	@RequestMapping(value="/seller_productList.do", method = {RequestMethod.GET, RequestMethod.POST})

	public String seller_productList(String searching, 
			String keyword, String sorting, String status, String category,
			Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int midx = (int) session.getAttribute("midx");
//		long midx = (long) session.getAttribute("midx");
		
		String member_id= Integer.toString((int) midx);
	//	String member_id= Integer.toString(midx);
		
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
		//System.out.println(member_id+searching+keyword+sorting+status+category);
		List<HashMap<String, Object>> productListMap = sellerService.seller_productList(searchInfo);
		
		model.addAttribute("productListMap", productListMap);
		model.addAttribute("searchInfo",searchInfo);
		
		return "seller/seller_productList";
	}
	@RequestMapping(value="/seller_productDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String seller_productDetail( @RequestParam("p_idx") String p_idx, Model model, HttpServletRequest request) {
		//@RequestParam("p_idx") String p_idx,
		
		
		
		ProductVo productVo = sellerService.seller_productDetail(p_idx);
		
		List<Product_ImgVo> productImgList = sellerService.seller_productImgs(p_idx);
		productVo.setProduct_imgs(productImgList);
		System.out.println();
		model.addAttribute("productVo", productVo);
		
		
		
		return "seller/seller_productDetail";
	}
	
	@RequestMapping(value="/seller_productModif.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String seller_productModif(MultipartHttpServletRequest mRequest,
			 @RequestParam("p_idx") String p_idx,
			Model model, HttpServletRequest request
			) throws IllegalStateException, IOException{
				

		System.out.println("여기는 상품수정");
		ProductVo productVo = sellerService.seller_productDetail(p_idx);
		
		List<Product_ImgVo> productImgList = sellerService.seller_productImgs(p_idx);
		productVo.setProduct_imgs(productImgList);
		
		 for (Product_ImgVo a : productImgList) {
	            String p_sys_fileName = a.getP_sys_filename();
	            System.out.println(p_sys_fileName+"/"+a.getP_front_img()+"~~");
		 }
		model.addAttribute("productImgList", productImgList);
		model.addAttribute("productVo", productVo);
					  
				
				
		return "seller/seller_productModif";
	}
	
	@RequestMapping(value="/seller_productModifProcess.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String seller_productModifProcess(MultipartHttpServletRequest mRequest,
			@RequestParam Map<String, String> param,
			@RequestParam("p_idx") String p_idx,
			Model model, HttpServletRequest request
			) throws IllegalStateException, IOException{
		
		System.out.println("여기는 상품수정 진행중");

		//기존 이미지 삭제했는지 여부 확인 후 디비 delyn Y로 바꾸기
		List<Product_ImgVo> productImgList = sellerService.seller_productImgs(p_idx);

		for (Product_ImgVo a : productImgList) {
           
            boolean result = param.containsKey("file_"+a.getP_front_img());// 파일 삭제를 눌렀는지 확인
            //System.out.println(result);
            if(result == false)//삭제하기
            {
            	 System.out.println(param.get("file_"+a.getP_front_img()));
            	 int del = sellerService.delete_img(a.getP_front_img());
            }
            
           
		}
		HttpSession session = request.getSession();
		int midx = (int) session.getAttribute("midx");
//		long midx = (long) session.getAttribute("midx");
		String member_id= Integer.toString((int) midx);
		
		//카테고리 분류하기
		String p_category_idx = "";
		int p_category_large =  Integer.parseInt(param.get("p_category_large"));
		if(p_category_large==1)
	    {
	    	if(param.get("p_category_small").equals("개껌")||param.get("p_category_small").equals("1")) p_category_idx ="1";
	    	else if(param.get("p_category_small").equals("스낵")||param.get("p_category_small").equals("2")) p_category_idx ="2";
	    	else if(param.get("p_category_small").equals("뼈/육포")||param.get("p_category_small").equals("3")) p_category_idx ="3";
	    	else if(param.get("p_category_small").equals("스틱")||param.get("p_category_small").equals("4")) p_category_idx ="4";
	    	else if(param.get("p_category_small").equals("프리미엄")||param.get("p_category_small").equals("5")) p_category_idx ="5";
	    	else if(param.get("p_category_small").equals("통살")||param.get("p_category_small").equals("6")) p_category_idx ="6";
	    }
	    else if(p_category_large==2)
	    {
	    	if(param.get("p_category_small").equals("츄르")||param.get("p_category_small").equals("1")) p_category_idx ="7";
	    	else if(param.get("p_category_small").equals("스낵")||param.get("p_category_small").equals("2")) p_category_idx ="8";
	    	else if(param.get("p_category_small").equals("캣잎")||param.get("p_category_small").equals("3")) p_category_idx ="9";
	    	else if(param.get("p_category_small").equals("스틱")||param.get("p_category_small").equals("4")) p_category_idx ="10";
	    	else if(param.get("p_category_small").equals("프리미엄")||param.get("p_category_small").equals("5")) p_category_idx ="11";
	    	else if(param.get("p_category_small").equals("통살")||param.get("p_category_small").equals("6")) p_category_idx ="12";
	    }
	    
		//String p_category_idx = param.get("p_category_large");
		
		String seller_idx=sellerService.getSellerIdx(member_id);
		System.out.println("------------------------------------------------"+seller_idx);
		System.out.println("p_category_idx"+param.get("p_category_idx"));
		System.out.println("p_category_large"+param.get("p_category_large"));
		System.out.println("p_category_small"+param.get("p_category_small"));

		param.put("seller_idx", seller_idx);
		param.put("p_category_idx", p_category_idx);
		//System.out.println("p_category_idx"+param.get("p_category_idx"));
		//System.out.println("@@@@"+p_category_idx);
		
		int productModi = sellerService.updateProduct(param);
		
			int productDel = sellerService.DelYNProduct(param);
		
		
		
		/*
		System.out.println("seller_idx"+seller_idx);
		System.out.println("p_category_idx"+param.get("p_category_idx"));
		System.out.println("p_name"+param.get("p_name"));
		System.out.println("p_content"+param.get("p_content"));
		System.out.println("p_price"+param.get("p_price"));
		System.out.println("p_discount"+param.get("p_discount"));
		System.out.println("p_disprice"+param.get("p_disprice"));
		System.out.println("p_cancle_info"+param.get("p_cancle_info"));
		System.out.println("p_ingerdient"+param.get("p_ingerdient"));
		System.out.println("p_dvprice"+param.get("p_dvprice"));
		System.out.println("p_dvcompany"+param.get("p_dvcompany"));
		System.out.println("p_limit_cnt"+param.get("p_limit_cnt"));
		System.out.println("p_point"+param.get("p_point"));
		System.out.println("p_add_dvprice"+param.get("p_add_dvprice"));
		System.out.println("p_free_dvprice"+param.get("p_free_dvprice"));
		System.out.println("p_size"+param.get("p_size"));
		System.out.println("p_status"+param.get("p_status"));
		System.out.println("p_stock"+param.get("p_stock"));
		*/
		
		
		List<MultipartFile> fileList = mRequest.getFiles("file");
		
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
	  
				
		model.addAttribute("p_idx", p_idx);
				//"redirect:/seller_productList.do"
		return "redirect:/seller_productDetail.do";
	}
	
	
	
	@GetMapping("/seller_productRegist.do")
	public String loginProcess(Model model, HttpServletRequest request) {
		
		
		return "seller/seller_productRegist";
	}
	@PostMapping("/checkPName.do")
	@ResponseBody //Ajax통신의 응답내용을 보내는 것을 표시
	public String checkPName(@RequestParam("p_name") String p_name) {
		
		//System.out.println("p_name: "+p_name);
		
		String result="N";//중복된 상품명 없음
		
		int flag = sellerService.checkPName(p_name);
		
		if(flag != 0) result = "Y";//중복된 상품명 있음
		
		return result;
	}

	
	@RequestMapping(value="/registProcess.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String registProcess(MultipartHttpServletRequest mRequest,
			@RequestParam Map<String, String> param,
			Model model, HttpServletRequest request
			) throws IllegalStateException, IOException{
		
		HttpSession session = request.getSession();
//		int midx = (int) session.getAttribute("midx");
		long midx = (long) session.getAttribute("midx");
		String member_id= Integer.toString((int) midx);
		
		//카테고리 분류하기
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
	    	else if(param.get("p_category_small").equals("스틱")) p_category_idx ="10";
	    	else if(param.get("p_category_small").equals("프리미엄")) p_category_idx ="11";
	    	else if(param.get("p_category_small").equals("통살")) p_category_idx ="12";
	    }
	    
		//String p_category_idx = param.get("p_category_large");
		
		String seller_idx=sellerService.getSellerIdx(member_id);
		//System.out.println("------------------------------------------------"+seller_idx);
		int result=0;//실패
		param.put("seller_idx", seller_idx);
		param.put("p_category_idx", p_category_idx);
		result = sellerService.addProduct(param);
		
		

		//파일 저장하기
		int pidx=sellerService.getPIdx();
		String p_idx= Integer.toString(pidx);
		System.out.println(p_idx);
		
		List<MultipartFile> fileList = mRequest.getFiles("file");
		
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
                int img_result = sellerService.addProductImg(imgFileName);
                
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                
                e.printStackTrace();
            }
        }
		
		
		
		
		
		
	
	
	  model.addAttribute("param", param);
	  
		return "redirect:/seller_productList.do";
		
		
		
		
	}
	@RequestMapping(value="/seller_ordersList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String seller_orderList(String searching, 
			String keyword, String status, String product,
			Model model, HttpServletRequest request){
		

		HttpSession session = request.getSession();
		int midx = (int) session.getAttribute("midx");
		String member_id= Integer.toString(midx);
		
		if(searching == null)
			searching="searchTotal";
		if(keyword == null)
			keyword = "";
		if(status == null)
			status = "1";
		if(product == null)
			product = "00";
		
		HashMap<String, String> searchInfo = new HashMap<String, String>();
		searchInfo.put("member_id", member_id);
		searchInfo.put("searching", searching);
		searchInfo.put("status", status);
		searchInfo.put("product", product);
		searchInfo.put("keyword", keyword);
		System.out.println("********************************************");
		System.out.println(member_id+"--"+searching+"--"+keyword+"--"+product+"--"+status);
		//List<HashMap<String, Object>> ordersListMap = sellerService.seller_ordersList(searchInfo);
		//List<ProductVo> productVoList = sellerService.seller_productVoList(member_id);
		//System.out.println("************************************");
		/*
		 * List<ProductVo> productVoList =
		 * sellerService.seller_productVoList(member_id); List<OrdersVo> ordersVoList =
		 * sellerService.seller_ordersList(searchInfo);
		 * 
		 * for(OrdersVo o: ordersVoList) { HashMap<String, String > info = new
		 * HashMap<String, String>(); String orders_idx =
		 * Integer.toString(o.getOrders_idx()); info.put("orders_idx", orders_idx);
		 * info.put("member_id", member_id);
		 * 
		 * List<DetailVo> detailVoList = sellerService.seller_detailVoList(info);
		 * o.setDetails(detailVoList);
		 * 
		 * 
		 * 
		 * String bundleprice = sellerService.seller_ordersPrice(info);
		 * o.setBundleprice(bundleprice); } model.addAttribute("ordersVoList",
		 * ordersVoList); model.addAttribute("searchInfo",searchInfo);
		 * model.addAttribute("productVoList",productVoList);
		 * 
		 * 
		 */
		
		List<ProductVo> productList = sellerService.seller_productVoList(member_id);
		
		
		//주문 리스트 
		List<HashMap<String, Object>> orderList = sellerService.seller_orderList(searchInfo);
		model.addAttribute("orderList",orderList);
		model.addAttribute("productList",productList);
		model.addAttribute("searchInfo",searchInfo);
		
		return "seller/seller_ordersList";
		
	}
	

	@RequestMapping(value="/seller_ordersDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String seller_ordersDetail( @RequestParam("midx") String member_id,
			@RequestParam("detail_idx") String detail_idx, Model model, HttpServletRequest request) {
		
		//System.out.println("************************************");

		//System.out.println(detail_idx);
		
		  //디테일 테이블 하나.. 
		  List<Detail_DayVo> detailDayListVo = sellerService.seller_detailDayListVo(detail_idx); 
		  List<Refund_DayVo>  refundDayListVo = sellerService.seller_refundDayListVo(detail_idx);
		  List<Cancle_DayVo> cancleDayListVo =  sellerService.seller_cancleDayListVo(detail_idx);
		  ReviewVo reviewVo = sellerService.seller_reviewVo(detail_idx);
		  HashMap<String,Object> ordersContent = sellerService.seller_ordersContent(detail_idx);
		  
		  int fixprice = (int) ordersContent.get("fixprice");
		  int detail_cnt = (int) ordersContent.get("detail_cnt");
		  int p_dvprice = (int) ordersContent.get("p_dvprice");
		  int p_free_dvprice = (int) ordersContent.get("p_free_dvprice");
		  int total_price = 0;
		  int product_price=fixprice*detail_cnt;
		  if(fixprice*detail_cnt<p_free_dvprice)
		  {
			  total_price=p_dvprice+fixprice*detail_cnt;
		  }
		  else
		  {
			  total_price=fixprice*detail_cnt;
		  }

		  model.addAttribute("member_id", member_id);
		  model.addAttribute("detailDayListVo", detailDayListVo);
		  model.addAttribute("refundDayListVo", refundDayListVo);
		  model.addAttribute("cancleDayListVo", cancleDayListVo);
		  model.addAttribute("reviewVo", reviewVo);
		  model.addAttribute("ordersContent",ordersContent);
		  model.addAttribute("product_price",product_price);
		  model.addAttribute("total_price",total_price);
		
		return "seller/seller_ordersDetail";
	}
	
	@RequestMapping(value="/seller_DetailStatusUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String seller_DetailStatusUpdate( @RequestParam("midx") String member_id,
			@RequestParam("detail_idx") String detail_idx, Model model, HttpServletRequest request) {
		
			
		sellerService.Updatedetail_status(detail_idx);
		sellerService.insertDetail_Day(detail_idx);

		  model.addAttribute("midx",member_id);
		  model.addAttribute("detail_idx",detail_idx);
		  
			return "redirect:/seller_ordersDetail.do";
	}
	@RequestMapping(value="/seller_ordersModif.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String seller_ordersModif( @RequestParam("midx") String member_id,
			@RequestParam("detail_idx") String detail_idx, Model model, HttpServletRequest request) {
		
	
		  List<Detail_DayVo> detailDayListVo = sellerService.seller_detailDayListVo(detail_idx); 
		  List<Refund_DayVo>  refundDayListVo = sellerService.seller_refundDayListVo(detail_idx);
		  List<Cancle_DayVo> cancleDayListVo =  sellerService.seller_cancleDayListVo(detail_idx);
		  ReviewVo reviewVo = sellerService.seller_reviewVo(detail_idx);
		  HashMap<String,Object> ordersContent = sellerService.seller_ordersContent(detail_idx);
		  
		  int fixprice = (int) ordersContent.get("fixprice");
		  int detail_cnt = (int) ordersContent.get("detail_cnt");
		  int p_dvprice = (int) ordersContent.get("p_dvprice");
		  int p_free_dvprice = (int) ordersContent.get("p_free_dvprice");
		  int total_price = 0;
		  int product_price=fixprice*detail_cnt;
		  if(fixprice*detail_cnt<p_free_dvprice)
		  {
			  total_price=p_dvprice+fixprice*detail_cnt;
		  }
		  else
		  {
			  total_price=fixprice*detail_cnt;
		  }
		  
		  model.addAttribute("member_id", member_id);
		  model.addAttribute("detailDayListVo", detailDayListVo);
		  model.addAttribute("refundDayListVo", refundDayListVo);
		  model.addAttribute("cancleDayListVo", cancleDayListVo);
		  model.addAttribute("reviewVo", reviewVo);
		  model.addAttribute("ordersContent",ordersContent);
		  model.addAttribute("product_price",product_price);
		  model.addAttribute("total_price",total_price);
		
		
		return "seller/seller_ordersModif";
	}
	@RequestMapping(value="/seller_ordersModifProcess.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String seller_ordersModifProcess( @RequestParam("midx") String member_id,
			@RequestParam("detail_idx") String detail_idx,
			@RequestParam Map<String, String> param,
			Model model, HttpServletRequest request) {
		
			HashMap<String,Object> infoMap = new HashMap<String, Object>();
			infoMap.put("orders_idx", param.get("orders_idx"));
			infoMap.put("detail_request", param.get("detail_request"));
			infoMap.put("orders_addr1", param.get("orders_addr1"));
			infoMap.put("orders_addr2", param.get("orders_addr2"));
			infoMap.put("orders_addr3", param.get("orders_addr3"));
			infoMap.put("orders_name", param.get("orders_name"));
			infoMap.put("orders_phone", param.get("orders_phone"));
			infoMap.put("detail_idx", param.get("detail_idx"));
			sellerService.ordersModif(infoMap);
			sellerService.detailModif(infoMap);
		  model.addAttribute("midx", member_id);
		  model.addAttribute("detail_idx", detail_idx);
		return "redirect:/seller_ordersDetail.do";
	}
	
	@RequestMapping(value="/seller_profile.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String seller_profile( 
			Model model, HttpServletRequest request
			) throws IllegalStateException, IOException{
				
				  HttpSession session = request.getSession(); 
//				  int midx = (int)session.getAttribute("midx"); 
				  long midx = (long)session.getAttribute("midx"); 
				  String member_id= Integer.toString((int) midx);
				  
				  SellerStoryVo sellerStoryVo = sellerService.seller_profile(member_id);
				  model.addAttribute("sellerStoryVo",sellerStoryVo);
				  
				 
		return "seller/seller_profile";
	}

	@RequestMapping(value="/seller_profileModif.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String seller_profileModif( 
			Model model, HttpServletRequest request
			) throws IllegalStateException, IOException{

		  HttpSession session = request.getSession(); 
//		  int midx = (int)session.getAttribute("midx"); 
		  long midx = (long)session.getAttribute("midx"); 
		  String member_id= Integer.toString((int) midx);
		  
		  SellerStoryVo sellerStoryVo = sellerService.seller_profile(member_id);
		  model.addAttribute("sellerStoryVo",sellerStoryVo);
		  
		//System.out.println(detail_idx);
		
		
		return "seller/seller_profileModif";
	}
	@RequestMapping(value="/seller_profileModifProcess.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String seller_profileModifProcess( MultipartHttpServletRequest mRequest,
			String seller_intro , Model model, HttpServletRequest request
			) throws IllegalStateException, IOException{
		
					HttpSession session = request.getSession(); 
//					int midx = (int)session.getAttribute("midx"); 
					long midx = (long)session.getAttribute("midx"); 
				  String member_id= Integer.toString((int) midx);
				  				  
				  List<MultipartFile> fileList = mRequest.getFiles("file");
					
			        for (MultipartFile mf : fileList) {
			            String p_ori_fileName = mf.getOriginalFilename().trim(); // 원본 파일 명

			          //시스템 파일명은 원본 파일명에서 파일명과 확장자를 분리한 다음 파일명에 시스템시간을 추가한 후 다시 확장자를 붙이는 식으로 생성
			    		int dot_idx = p_ori_fileName.lastIndexOf(".");
			    		String fileName1 = p_ori_fileName.substring(0, dot_idx);
			    		String extension = p_ori_fileName.substring(dot_idx+1);
			    		String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
			    		String p_sys_fileName = fileName2+"."+extension;
			    		
			    		//upload 디렉토리에 대한 실제 경로 확인을 위해 ServletContext객체를 이용
			    		String upload_dir = "resources/seller/";
			    		
			    		String realPath = request.getServletContext().getRealPath(upload_dir);
			    		System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
			    		
			    		//지정된 경로에 파일 저장
			    		String fullPath = realPath+p_sys_fileName;
			            System.out.println("********************************************");
			            System.out.println("p_sys_fileName : " + p_sys_fileName);
			            System.out.println("p_ori_fileName : " + p_ori_fileName);
			            HashMap<String,String> imgFileName = new HashMap<String,String>();
			            imgFileName.put("seller_img", p_sys_fileName);
			            imgFileName.put("member_id", member_id);
			            
			            try {
			                mf.transferTo(new File(fullPath));
			                sellerService.updateSellerImg(imgFileName);
			            } catch (IllegalStateException e) {
			                e.printStackTrace();
			            } catch (IOException e) {
			                
			                e.printStackTrace();
			            }
			        }
			        HashMap<String,String> intro = new HashMap<String,String>();
			        intro.put("seller_intro", seller_intro);
			        intro.put("member_id", member_id);
			        sellerService.updateSellerIntro(intro);
			        
		
		return "redirect:/seller_profile.do";
	}
	
	@RequestMapping(value="/seller_account.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String seller_account( 
			Model model, HttpServletRequest request
			) throws IllegalStateException, IOException{
		
		
		//System.out.println(detail_idx);
		HttpSession session = request.getSession(); int midx = (int)
		session.getAttribute("midx"); 
		String member_id= Integer.toString(midx);
			
		SellerStoryVo sellerStoryVo = sellerService.seller_profile(member_id);
		  model.addAttribute("sellerStoryVo",sellerStoryVo);

		
		
		return "seller/seller_account";
	}
	
	@RequestMapping(value="/seller_accountModif.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String seller_accountModif( 
			Model model, HttpServletRequest request
			) throws IllegalStateException, IOException{
		HttpSession session = request.getSession(); int midx = (int)
				session.getAttribute("midx"); 
				String member_id= Integer.toString(midx);
					
				SellerStoryVo sellerStoryVo = sellerService.seller_profile(member_id);
				  model.addAttribute("sellerStoryVo",sellerStoryVo);


		System.out.println(sellerStoryVo.getSeller_bank());
		
		
		return "seller/seller_accountModif";
	}
	
	@RequestMapping(value="/seller_accountModifProcess.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String seller_accountModifProcess( String seller_bank, String seller_account_number,
			SellerStoryVo sellerStoryVo,
			Model model, HttpServletRequest request
			) throws IllegalStateException, IOException{
				
				HttpSession session = request.getSession(); int midx = (int)
				session.getAttribute("midx"); 
				sellerStoryVo.setSeller_bank(seller_bank);
				sellerStoryVo.setSeller_account_number(seller_account_number);
				sellerStoryVo.setMidx(midx);
				System.out.println(sellerStoryVo.getSeller_bank());
				String viewPage = null;
				int flag = sellerService.updateSellerAccount(sellerStoryVo);
				System.out.println(flag);
				if(flag==1) { viewPage = "redirect:/seller_account.do";
				}else {
					viewPage = "/home";
				}
				model.addAttribute("membersVo",sellerStoryVo);
				
					  
				
				
		return viewPage;
	}
	
	
	
	
	
	
	
}
