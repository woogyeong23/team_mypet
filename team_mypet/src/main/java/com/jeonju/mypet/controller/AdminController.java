package com.jeonju.mypet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jeonju.mypet.service.AdminService;
import com.jeonju.mypet.vo.MembersVo;


@Controller
public class AdminController {
	
	
	private AdminService adminService;
	
	@Autowired 
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@GetMapping("/admin.do")
	public String adminHome() {
		return "admin/admin_home";
	}
	
}
	

	
	

	
	
	

