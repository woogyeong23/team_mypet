package com.jeonju.mypet.service;

import java.util.HashMap;

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
	
	
	//회원가입 처리 메소드:join()
	public int join(MemberVo memberVo) {
		int result=0;//입력 실패
		
		result = memberDao.joinMember(memberVo);
		
		return result;
	}


	/*
	 * public HashMap<String, Long> login(MemberVo memberVo) { return
	 * memberDao.loginMember(memberVo); }
	 */
	
	public HashMap<String, Long> login(HashMap<String,String> loginInfo) {
		return memberDao.loginMember(loginInfo);
	}


	public MemberVo getMemberInfo(String member_id) {
		 
		return memberDao.getMemberInfo(member_id);
	}

}
