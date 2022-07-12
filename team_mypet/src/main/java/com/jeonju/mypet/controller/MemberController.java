package com.jeonju.mypet.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jeonju.mypet.service.MemberService;
import com.jeonju.mypet.vo.MemberVo;

@Controller
public class MemberController {
	
	private MemberService memberService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/login.do")
	public String login() {
		return "member/login";
	}
	
	/*
	 * @PostMapping("loginProcess.do") public String
	 * loginProces(@RequestParam("m_id") String m_id,
	 * 
	 * @RequestParam("m_pwd") String m_pwd, HttpServletRequest request) {
	 * 
	 * HashMap<String, String> loginInfo = new HashMap<String, String>();
	 * loginInfo.put("m_id", m_id); loginInfo.put("m_pwd", m_pwd);
	 * 
	 * String viewPage = null;
	 * 
	 * HashMap<String, Long> resultMap = memberService.login(loginInfo); long m_auth
	 * = resultMap.get("m_auth"); long m_grade = resultMap.get("m_grade");
	 * 
	 * System.out.println("m_grade : "+ m_grade);
	 * 
	 * 
	 * if(m_auth==1) { // 값이 유효해 로그인이 성공적으로 이루어진 경우 HttpSession session =
	 * request.getSession(); session.setAttribute("m_id", m_id);
	 * session.setAttribute("m_grade", m_grade);
	 * 
	 * System.out.println("Session: "+ session.getAttribute("m_id"));
	 * System.out.println("Session: "+ session.getAttribute("m_grade"));
	 * 
	 * viewPage = "redirect:/home.do";
	 * 
	 * }else { // 로그인 실패 viewPage = "member/login"; }
	 * 
	 * return viewPage; }
	 */
	
	@PostMapping("loginProcess.do")
	public String loginProces(MemberVo memberVo, 
			HttpServletRequest request) {
		
		/*
		 * HashMap<String, String> loginInfo = new HashMap<String, String>();
		 * loginInfo.put("m_id", m_id); loginInfo.put("m_pwd", m_pwd);
		 * 
		 */
		
		MemberVo resultVo = memberService.login(memberVo);
		long m_auth = resultVo.getM_auth();
		long m_grade = resultVo.getM_grade();
				
		System.out.println("m_grade : "+ m_grade);
		String viewPage = null;
		
		if(m_auth==1) {  // 값이 유효해 로그인이 성공적으로 이루어진 경우
			HttpSession session = request.getSession();
			session.setAttribute("m_id", memberVo.getM_id());
			session.setAttribute("m_nick", memberVo.getM_nick());

			session.setAttribute("m_grade", m_grade);
			
			System.out.println("Session: "+ session.getAttribute("m_id"));
			System.out.println("Session: "+ session.getAttribute("m_grade"));
			
			viewPage = "redirect:/home.do";
			
		}else { // 로그인 실패
			viewPage = "member/login";
		}
		
		return viewPage;
	}
	
	
	
	
	
	
}
