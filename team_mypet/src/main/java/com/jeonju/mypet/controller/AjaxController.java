package com.jeonju.mypet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jeonju.mypet.service.AjaxService;
import com.jeonju.mypet.vo.MembersVo;

//Ajax통신 지원을 위해 pom.xml에 의존모듈(jackson)을 추가해 줌

//@Controller
@RestController //Spring4버전부터 지원. @Controller + @ResponseBody 기능
public class AjaxController {
	
	private AjaxService ajaxService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public AjaxController(AjaxService ajaxService) {
		this.ajaxService = ajaxService;
	}
	
	
	@PostMapping("/idfindProcess.do")
	//@ResponseBody //Ajax통신의 응답내용을 보내는 것을 표시 <-- @RestController 로 대체 가능
	public String idFindProcess(@RequestParam("m_name") String m_name,Model model) {
		
		
		
		String result  = ajaxService.idfind(m_name);
		
		return result;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
