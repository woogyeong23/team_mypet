package com.jeonju.mypet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.jeonju.mypet.service.AjaxService;

//Ajax통신 지원을 위해 pom.xml에 의존모듈(jackson)을 추가해 줌

//@Controller
@RestController //Spring4버전부터 지원. @Controller + @ResponseBody 기능
public class AjaxController {
	
	private AjaxService ajaxService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public AjaxController(AjaxService ajaxService) {
		this.ajaxService = ajaxService;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
