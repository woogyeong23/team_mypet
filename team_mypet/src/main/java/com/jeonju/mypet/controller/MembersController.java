package com.jeonju.mypet.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeonju.mypet.service.MembersService;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.PetVo;

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
			

			HashMap<String, Long> resultMap = membersService.login(loginInfo);

			long m_auth = resultMap.get("m_auth");
			long m_grade = resultMap.get("m_grade");
			
			HashMap<String, String> resultMap1 = membersService.login1(loginInfo);
			String m_nick = resultMap1.get("m_nick");
	
			
			
			String viewPage = null;
			
			if(m_auth == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("m_id",m_id);
				session.setAttribute("m_grade",m_grade);
				session.setAttribute("m_nick",m_nick);
				session.setAttribute("midx",resultMap.get("midx"));

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
		
		
		@GetMapping("/idfind.do")
		public String idFind() {
				
			return "member/idfind";	
		}
		
		
		@GetMapping("/pwdfind.do")
		public String pwdfind() {
				
			return "member/pwdfind";	
		}
		
		@GetMapping("/membergrade.do")
		public String membergrade() {
				
			return "member/membergrade";	
		}
		
		@GetMapping("/memberpoint.do")
		public String memberpoint() {
				
			return "member/memberpoint";	
		}
		
		@GetMapping("/membermodi.do")
		public String membermodi(Model model,HttpServletRequest request) {
				
			HttpSession Session = request.getSession();
			int midx = (int) Session.getAttribute("midx");
			
			MembersVo membersVo = membersService.membermodi(midx);
			
			model.addAttribute("membersVo",membersVo);
			
			return "member/membermodi";	
		}
		@PostMapping("/membermodiProcess.do")
		public String membermodiProcess(Model model,MembersVo membersVo,HttpServletRequest request) {
				

			String viewPage = null;
			
			int flag = membersService.memberupdate(membersVo);
			System.out.println(flag);
			if(flag==1) { viewPage = "member/membermodi";
			}else {
				viewPage = "/home";
			}
			model.addAttribute("membersVo",membersVo);
			return viewPage;	
		}
		
		
		@GetMapping("/petList.do")
		public String petList(Model model,HttpServletRequest request) {
			HttpSession Session = request.getSession();
			int midx = (int) Session.getAttribute("midx");
			
			List<PetVo> petVoList = membersService.petList(midx);
			
			System.out.println(petVoList);
			model.addAttribute("petVoList",petVoList);

			return "member/petList";	
		}
		
		@GetMapping("/petmodi.do")
		public String petmodi() {
			
			return "member/petmodi";	
		}
		
		@PostMapping("/petmodiProcess.do")
		public String petmodiProcess(HttpServletRequest request, PetVo petVo,Model model) {
		
			
			int result = membersService.petmodiProcess(petVo);
			model.addAttribute("petVo",petVo);

			String viewPage = null;
			System.out.println();
			if(result != 0) {
				viewPage = "redirect:/petList.do";
			}else {
			 viewPage = "/home";
			}
			return viewPage;	
		}
		
		@GetMapping("/memberorder.do")
		public String memberorder() {
			
			return "member/memberorder";	
		}
		@GetMapping("/memberorderList.do")
		public String memberorderList() {
			
			return "member/memberorderList";	
		}
		
		@GetMapping("/memberrefund.do")
		public String memberrefund() {
			
			return "member/memberrefund";	
		}
		
		
		@GetMapping("/memberpay.do")
		public String memberpay() {
			
			return "member/memberpay";	
		}
		
		
		
		
}
