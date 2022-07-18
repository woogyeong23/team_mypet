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
import com.jeonju.mypet.vo.MembersVo;

@Controller
public class MembersController {
	
	private MembersService membersService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public MembersController(MembersService membersService) {
		this.membersService = membersService;
	}
	
	
	@GetMapping("/login.do")//get방식 요청 처리
	public String login() {
		return "member/login";
	}
	@GetMapping("/join.do")
	public String join() {
		return "member/join";	
	}
	@GetMapping("/joinKakao.do")
	public String joinKakao() {
		return "member/joinKakao";	
	}
	@GetMapping("/joinEm.do")
	public String joinEm() {
		return "member/joinEm";	
	}
	@GetMapping("/NewFile.do")
	public String NewFile() {
		return "member/NewFile";	
	}
	
	
	
	@PostMapping("/joinProcess.do")
	public String joinProcess(MembersVo membersVo) {
		
		int result = membersService.join(membersVo);
		String viewPage = null;
		
		if(result == 1) {
			viewPage = "redirect:/login.do";
		}else {
		 viewPage = "member/joinEm";
		}
		return viewPage;	
	}
	
		@PostMapping("/loginProcess.do")
	public String loginProcess(@RequestParam("m_id") String m_id,
			@RequestParam("m_pwd") String m_pwd,
			HttpServletRequest request) {
			
			HashMap<String, String> loginInfo = new HashMap<String, String>(); 
			loginInfo.put("m_id",m_id);
			loginInfo.put("m_pwd",m_pwd);
			
			System.out.println(loginInfo);
			HashMap<String, Long> resultMap = membersService.login(loginInfo);
			System.out.println(resultMap);
			long m_auth = resultMap.get("m_auth");
			long m_grade = resultMap.get("m_grade");
			
			String viewPage = null;
			
			if(m_auth == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("m_id",m_id);
				session.setAttribute("m_grade",m_grade);
				
				viewPage = "redirect:/home.do";
						
			}else {
				viewPage = "member/login";
			}
			
		return viewPage;
	}
	
	
		@GetMapping("/logout.do")
		public String logout(HttpServletRequest request) {
			HttpSession Session = request.getSession();
			Session.invalidate();
			
			return "redirect:/home.do";
		}
		
		
		
			@GetMapping("/memberInfo.do")
		public String memberInfo() {
				
			return "member/memberInfo";	
		}
		
		
		
		
		
		
		
}
