package com.jeonju.mypet.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import com.jeonju.mypet.service.AdminService;
import com.jeonju.mypet.vo.BoardVo;
import com.jeonju.mypet.vo.MembersVo;






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


	
	

	@GetMapping("/boardList.do")//get방식 요청 처리
	public String getboardList(Model model) {
		
		List<BoardVo> boardList = adminService.getboardList();
		//모델객체에 회원목록을 추가함
		model.addAttribute("boardList",boardList);
		
		return "admin/boardList";
	}
	
	


	
	
	
	
	
	
	@GetMapping("/admin_board2.do")
	public String adminboard2() {
		return "admin/admin_board2";
	}
	
	@GetMapping("/admin_write.do")
	public String adminwrite() {
		return "admin/admin_write";
	}
	
	@GetMapping("/admin_board_d.do")
	public String adminboardd() {
		return "admin/admin_board_d";
	}
	
}
	

	
	

	
	
	

