package com.jeonju.mypet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.jeonju.mypet.service.MembersService;

@Controller
public class MembersController {
	
	private MembersService membersService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public MembersController(MembersService membersService) {
		this.membersService = membersService;
	}
	
	
	
	
}
