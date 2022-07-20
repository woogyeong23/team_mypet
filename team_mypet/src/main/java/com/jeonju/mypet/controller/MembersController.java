package com.jeonju.mypet.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeonju.mypet.service.MembersService;

@Controller
public class MembersController {
	
	private MembersService membersService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public MembersController(MembersService membersService) {
		this.membersService = membersService;
	}
	
	
	// Test를 위해 임의로 만든 코드 (memberController)(
	
		@GetMapping("/login.do")
		public String login() {
			return"member/login";
		}
		
		@PostMapping("/loginProcess.do")
		public String loginProcess(@RequestParam("m_id") String m_id,
				              @RequestParam("m_pwd") String m_pwd, 
				              HttpServletRequest request) {
			
			HashMap<String, String> loginInfo = new HashMap<String, String>();
			loginInfo.put("m_id", m_id);
			loginInfo.put("m_pwd", m_pwd);
			
			HashMap<String, Long> resultMap = membersService.login(loginInfo);
			long m_auth = resultMap.get("m_auth"); // 회원 인증
	        long m_grade = resultMap.get("m_grade"); // 회원등급
	        long midx = resultMap.get("midx");
           
	        
	 
	        String viewPage = null;
	        if(m_auth == 1) {
	        	HttpSession session = request.getSession();
	        	session.setAttribute("m_id", m_id);
	        	System.out.println("m_id :"+ m_id);
	        	
	        	session.setAttribute("m_grade", m_grade);
	        	System.out.println("m_grade :"+ m_grade);
	        	
	        	session.setAttribute("midx", midx);
	        	System.out.println("midx :" + midx);
	        
	        	
	        	session.setMaxInactiveInterval(3*60);
	        	viewPage = "redirect:/home.do";
	        }
	        else {
	        	viewPage = "member/login";
	        }
	        
	        return viewPage;
		}
				
		
		@GetMapping("/logout.do")
		public String logout(HttpServletRequest request) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			return "redirect:/home.do";
		}
		
		// )Test를 위해 임의로 만든 코드

	
	
	
	
}
