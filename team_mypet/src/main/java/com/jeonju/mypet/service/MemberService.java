package com.jeonju.mypet.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.MemberDao;
import com.jeonju.mypet.vo.MemberVo;

@Service
public class MemberService {
	
	private MemberDao memberDao;
	
	@Autowired
	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	/*
	 * public HashMap<String, Long> login(HashMap<String, String> loginInfo) {
	 * return memberDao.loginMember(loginInfo); }
	 */
	
	public MemberVo login(MemberVo memberVo) {
		return memberDao.loginMember(memberVo); 
	}
	
	
	

}
