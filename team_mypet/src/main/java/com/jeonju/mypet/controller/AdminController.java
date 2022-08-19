package com.jeonju.mypet.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jeonju.mypet.service.AdminService;
import com.jeonju.mypet.service.AjaxService;
import com.jeonju.mypet.vo.BoardVo;
import com.jeonju.mypet.vo.CommunityVo;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.OrdersVo;









@Controller
public class AdminController {
	
	
	private AdminService adminService;
	private Object service;
	

	

	

	
	
	@Autowired 
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@GetMapping("/admin.do")
	public String adminHome() {
		return "admin/admin_home";
	}
	

	@GetMapping("/admin_panme.do")
	public String adminpanme() {
		return "admin/admin_panme";
	}
	
	
	
	@GetMapping("/admin_board.do")
	public String adminboard(Model model, HttpServletRequest request) {
		
		//int a=1;
		//ProductVo productVo = new ProductVo();
		
		
		
		List<BoardVo> BoardList = adminService.getBoardList();
		
		
		
		model.addAttribute("BoardList", BoardList);
		
		
		return "admin/admin_board";
	}


	@GetMapping("/admin_boardd.do")
	public String adminboardd(Model model , String bidx , HttpServletRequest request) {
		
		//int a=1;
		//ProductVo productVo = new ProductVo();
		
		
		
	    BoardVo BoardListd = adminService.getBoardListd(bidx);
		
		
		
		model.addAttribute("BoardListd", BoardListd);
		
		
		return "admin/admin_boardd";
	}

	
	
	@GetMapping("/admin_memberList.do")//get방식 요청 처리
	public String getMembersList(Model model, HttpServletRequest request) {
		
		
		
		List<MembersVo> memberList = adminService.getMembersList();
	
		
		
	
		model.addAttribute("memberList",memberList);
		
		return "admin/admin_memberList";
	}
	
	
	


	@GetMapping("/admin_community.do")
	public String admincommunity(Model model, HttpServletRequest request) {
		
		//int a=1;
		//ProductVo productVo = new ProductVo();
		
		
		
		List<CommunityVo> CommunityList = adminService.getCommunityList();
		
		
		
		model.addAttribute("CommunityList", CommunityList);
		
		
		return "admin/admin_community";
	}
	
	
	

	
	
	@GetMapping("/admin_launch.do")
	public String adminLaunch(Model model, HttpServletRequest request) {
		
		//int a=1;
		//ProductVo productVo = new ProductVo();
		
		
		
		List<OrdersVo> LaunchList = adminService.getLaunchList();
		
		
		
		model.addAttribute("LaunchList", LaunchList);
		
		
		return "admin/admin_launch";
	}
	
	
	
	
	
	@GetMapping("/admin_orders.do")
	public String adminOrders(Model model, HttpServletRequest request) {
		
		//int a=1;
		//ProductVo productVo = new ProductVo();
		
		
		
		List<OrdersVo> OrdersList = adminService.getOrdersList();
		
		
		
		model.addAttribute("OrdersList", OrdersList);
		
		
		return "admin/admin_orders";
	}
	
	
	
	
	
	
	
	@GetMapping("/admin_mune.do")
	public String adminmune(Model model, HttpServletRequest request) {
		
		//int a=1;
		//ProductVo productVo = new ProductVo();
		
		List<BoardVo> MuneList = adminService.getMuneList();
		
		model.addAttribute("MuneList", MuneList);
		
		
		return "admin/admin_mune";
	}



	
	
	
	
	
	
	@GetMapping("/admin_board2.do")
	public String adminboard2(Model model, HttpServletRequest request) {
		
		
		
		List<BoardVo> EventList = adminService.getEventList();
		
		model.addAttribute("EventList", EventList);
		
		return "admin/admin_board2";
	}
	

	@GetMapping("/admin_board_d.do")
	public String adminboardd() {
		return "admin/admin_board_d";
	}
	

	

@GetMapping("/admin_buyer.do")
public String adminbuyer() {
	return "admin/admin_buyer";
}
	


	

@GetMapping("/admin_write.do")
public String adminwrite() {
	return "admin/admin_write";
}
	



@GetMapping("/admin_write2.do")
public String adminwrite2() {
	return "admin/admin_write2";
	
}


@GetMapping("/admin_write0.do")
public String adminwrite0() {
	return "admin/admin_write0";
	
}


@PostMapping("/AWInsertProcess.do")
public String AWInsertProcess(@RequestParam("board_subject") String board_subject,
		
		@RequestParam("board_content") String board_content, 
		@RequestParam("midx") int midx,  
		@RequestParam("uploadImg") MultipartFile uploadImg,
		@RequestParam("board_writer") String board_writer, Model model, HttpServletRequest request) 
				throws IllegalStateException, IOException{
	
	String  bord_front_image= uploadImg.getOriginalFilename();
	
	int Midx =  bord_front_image.lastIndexOf(".");
	

	
	
	
	System.out.println("dmdkㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ" );
	String upload_dir = "resources/Community/upload/";
	
	String realPath = request.getServletContext().getRealPath(upload_dir);
	System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
	
	
			if(board_subject.length() == 0) board_subject = null;
			if(board_content.length() == 0) board_content= null;
			
			int result=0;//0:입력 실패
			
			BoardVo BoardVo = new BoardVo();
			BoardVo.setBoard_subject(board_subject);
			
			BoardVo.setMidx(midx);
			BoardVo.setBoard_writer(board_writer);
			BoardVo.setBoard_content(board_content);
			BoardVo.setBord_front_image(bord_front_image);
	     
		  
			
			
			result = adminService.awInsert(BoardVo);
			
			String viewPage = "admin/admin_write";
			
			if(result == 1) {
				model.addAttribute("subject", board_subject);
				model.addAttribute("content", board_content);
				model.addAttribute("writer", board_writer);
				model.addAttribute("image", bord_front_image);
				viewPage = "admin/admin_write_result";	
			}

			return viewPage;
}



@PostMapping("/AWInsertProcess2.do")
public String AWInsertProcess2(@RequestParam("board_subject") String board_subject,
		
		@RequestParam("board_content") String board_content, 
		@RequestParam("midx") int midx,  
		@RequestParam("uploadImg") MultipartFile uploadImg,
		@RequestParam("board_writer") String board_writer, Model model, HttpServletRequest request) 
				throws IllegalStateException, IOException{
	
	String  bord_front_image= uploadImg.getOriginalFilename();
	
	int Midx =  bord_front_image.lastIndexOf(".");
	

	
	
	

	String upload_dir = "resources/Community/upload/";
	
	String realPath = request.getServletContext().getRealPath(upload_dir);
	System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
	
	
			if(board_subject.length() == 0) board_subject = null;
			if(board_content.length() == 0) board_content= null;
			
			int result=0;//0:입력 실패
			
			BoardVo BoardVo = new BoardVo();
			BoardVo.setBoard_subject(board_subject);
			
			BoardVo.setMidx(midx);
			BoardVo.setBoard_writer(board_writer);
			BoardVo.setBoard_content(board_content);
			BoardVo.setBord_front_image(bord_front_image);
	     
		  
			
			
	result = adminService.awInsert2(BoardVo);
			
			String viewPage = "admin/admin_write2";
			
			if(result == 1) {
				model.addAttribute("subject", board_subject);
				model.addAttribute("content", board_content);
				model.addAttribute("writer", board_writer);
				model.addAttribute("image", bord_front_image);
				viewPage = "admin/admin_write_result";	
			}

			return viewPage;
}


@PostMapping("/AWInsertProcess0.do")
public String AWInsertProcess0(@RequestParam("board_subject") String board_subject,
		
		@RequestParam("board_content") String board_content, 
		@RequestParam("midx") int midx,  
		@RequestParam("uploadImg") MultipartFile uploadImg,
		@RequestParam("board_writer") String board_writer, Model model, HttpServletRequest request) 
				throws IllegalStateException, IOException{
	
	String  bord_front_image= uploadImg.getOriginalFilename();
	
	int Midx =  bord_front_image.lastIndexOf(".");
	

	
	
	

	String upload_dir = "resources/Community/upload/";
	
	String realPath = request.getServletContext().getRealPath(upload_dir);
	System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
	
	
			if(board_subject.length() == 0) board_subject = null;
			if(board_content.length() == 0) board_content= null;
			
			int result=0;//0:입력 실패
			
			BoardVo BoardVo = new BoardVo();
			BoardVo.setBoard_subject(board_subject);
			
			BoardVo.setMidx(midx);
			BoardVo.setBoard_writer(board_writer);
			BoardVo.setBoard_content(board_content);
			BoardVo.setBord_front_image(bord_front_image);
	     
		  
			
			
	result = adminService.awInsert0(BoardVo);
			
			String viewPage = "admin/admin_write0";
			
			if(result == 1) {
				model.addAttribute("subject", board_subject);
				model.addAttribute("content", board_content);
				model.addAttribute("writer", board_writer);
				model.addAttribute("image", bord_front_image);
				viewPage = "admin/admin_write_result";	
			}

			return viewPage;
}






@GetMapping("/admin_modi.do")
public String adminmodi(String bidx, Model model) {
	System.out.println("**************************************");
	System.out.println(bidx);
	
	BoardVo boardVo = adminService.adminmodi(bidx);
	System.out.println(boardVo.getBoard_content());
	model.addAttribute("boardVo", boardVo);
	
	return "admin/admin_modi";
			
}

@PostMapping("/adminmodiProcess.do")
public String Modi_process(@RequestParam("board_subject") String board_subject,
		
		@RequestParam("board_content") String board_content, 
		@RequestParam("bidx") int bidx,
         Model model, HttpServletRequest request) 
				throws IllegalStateException, IOException{
	
	
	
	
	BoardVo boardVo = new BoardVo();
	boardVo.setBoard_subject(board_subject);
	boardVo.setBoard_content(board_content);
	
	boardVo.setBidx(bidx);

	
	
	
	int result = 0;
	result=adminService.Updateadmin(boardVo);


	

	

	
	//upload 디렉토리에 대한 실제 경로 확인을 위해 ServletContext객체를 이용
	
	


	
	
	//지정된 경로에 파일 저장
			//realPath와 system_fileName을 합쳐서 전체경로를 얻어야 함
		
	


	
	 
	return "redirect:/admin_board.do";
}



	}







