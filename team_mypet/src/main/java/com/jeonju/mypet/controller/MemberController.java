package com.jeonju.mypet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.jeonju.mypet.service.MemberService;

@Controller
public class MemberController {
	
	private MemberService memberService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
}
