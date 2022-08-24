package com.jeonju.mypet.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeonju.mypet.service.EncryptPwd;
import com.jeonju.mypet.service.MembersService;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.OrdersVo;
import com.jeonju.mypet.vo.PetVo;

@Controller
public class MembersController {
	
	private MembersService membersService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	
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
	public String joinProcess(MembersVo membersVo) throws NoSuchAlgorithmException {
		
		String pwd = membersVo.getM_pwd();
		EncryptPwd encryptPwd = new EncryptPwd(pwd);
		pwd = encryptPwd.getPwd();
		
		membersVo.setM_pwd(pwd);
		
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
			HttpServletRequest request) throws NoSuchAlgorithmException {
			
			EncryptPwd encryptPwd = new EncryptPwd(m_pwd);
			 
		
		
			HashMap<String, String> loginInfo = new HashMap<String, String>(); 
			
			loginInfo.put("m_id",m_id);
			loginInfo.put("m_pwd",encryptPwd.getPwd());
			

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
		
		@RequestMapping("/pw_auth.do")
		public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
			String m_id = (String)request.getParameter("m_id");
			String m_phone = (String)request.getParameter("m_phone");

			MembersVo vo = membersService.selectMember(m_id);
			
			System.out.println("아이디+폰 : "+m_id + m_phone);
				
			if(vo != null) {
			Random r = new Random();
			int num = r.nextInt(999999); // 랜덤난수설정
			
			System.out.println("num:"+num);
			System.out.println("id : "+vo.getM_id());
			
			if (vo.getM_phone().equals(m_phone)) {
				session.setAttribute("m_id", vo.getM_id());

				String setfrom = "sosos27@naver.com";
				String tomail = m_id; //받는사람
				String title = "[마이펫] 비밀번호변경 인증 이메일 입니다"; 
				String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
				+ "마이펫 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator");
				
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

					System.out.println("센더"+mailSender.getPort());
					
					messageHelper.setFrom(setfrom); 
					messageHelper.setTo(tomail); 
					messageHelper.setSubject(title);
					messageHelper.setText(content,true); 

					mailSender.send(message);
					
				} catch (Exception e) {
					System.out.println("메"+e.getMessage());
					e.printStackTrace();
				}

				ModelAndView mv = new ModelAndView();
				mv.setViewName("member/pw_auth");
				mv.addObject("num", num);
				return mv;
				
			}else {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("member/pwdfind");
				return mv;
			}
			}else {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("member/pwdfind");
				return mv;
			}
		}
		
		@PostMapping("/pw_new.do")
		public String pw_new(MembersVo vo, HttpSession session) throws IOException, NoSuchAlgorithmException{
			
			String pwd = vo.getM_pwd();
			EncryptPwd encryptPwd = new EncryptPwd(pwd);
			pwd = encryptPwd.getPwd();
	
			vo.setM_pwd(pwd);
	
			int result = membersService.pwUpdate_M(vo);
			
			if(result == 1) {
				return "member/login";
			}
			else {
				return "member/pw_new";
			}
	}
		
		@PostMapping("/pw_set.do")
		public String pw_set(@RequestParam(value="email_injeung") String email_injeung,
					@RequestParam(value = "num") String num) throws IOException{
				
				if(email_injeung.equals(num)) {
					return "member/pw_new";
				}
				else {
					return "member/pwdfind";
				}
		} //이메일 인증번호 확인
		
		
		
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
		public String memberorderList(HttpServletRequest request, OrdersVo ordersVo,Model model) {
			HttpSession Session = request.getSession();
			int midx = (int) Session.getAttribute("midx");
			
			ordersVo.setMidx(midx);
			
			List<OrdersVo> ordersList = membersService.orderList(ordersVo);
			
			model.addAttribute(ordersList);
			
			return "member/memberorderList";	
		}
		
		@GetMapping("/memberrefund.do")
		public String memberrefund() {
			
			return "member/memberrefund";	
		}
		
		
		
		
		
		
		
}