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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jeonju.mypet.service.AdminService;
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
	

	
	
	
	@GetMapping("/admin_board.do")
	public String adminboard(Model model, HttpServletRequest request) {
		
		//int a=1;
		//ProductVo productVo = new ProductVo();
		
		
		
		List<BoardVo> BoardList = adminService.getBoardList();
		
		
		
		model.addAttribute("BoardList", BoardList);
		
		
		return "admin/admin_board";
	}


	
	@GetMapping("/memberList.do")//get방식 요청 처리
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
	
	






@PostMapping("/AWInsertProcess.do")
public String AWInsertProcess(@RequestParam("board_subject") String board_subject,
		
		@RequestParam("board_content") String board_content, 
		@RequestParam("midx") int midx, 
		@RequestParam("bidx") int bidx, 
		@RequestParam("uploadImg") MultipartFile uploadImg,
		@RequestParam("board_origin_bidx") int board_origin_bidx, 
		@RequestParam("board_name") int board_name,
		@RequestParam("board_depth") int board_depth,
		@RequestParam("borad_level_") int borad_level_,
		@RequestParam("board_writer") String board_writer, Model model, HttpServletRequest request) 
				throws IllegalStateException, IOException{
	
	String  bord_front_image= uploadImg.getOriginalFilename();
	
	int dot_idx =  bord_front_image.lastIndexOf(".");
	String fileName1 =  bord_front_image.substring(0, dot_idx);
	String extension =  bord_front_image.substring(dot_idx+1);
	String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
	String  bordfrontimage = fileName2+"."+extension;
	
	
	
	String upload_dir = "resources/Community/upload/";
	
	String realPath = request.getServletContext().getRealPath(upload_dir);
	System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
	
	
			if(board_subject.length() == 0) board_subject = null;
			if(board_content.length() == 0) board_content= null;
			
			int result=0;//0:입력 실패
			
			BoardVo BoardVo = new BoardVo();
			BoardVo.setBoard_subject(board_subject);
			BoardVo.setBidx(bidx);
			BoardVo.setMidx(midx);
			BoardVo.setBoard_origin_bidx(board_origin_bidx);
			BoardVo.setBoard_name(board_name);
			BoardVo.setBoard_depth(board_depth);
			BoardVo.setBorad_level_(borad_level_);
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
				viewPage = "admin/admin_write";	
			}

			return viewPage;
}


}

