package com.jeonju.mypet.service;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.MembersDao;
import com.jeonju.mypet.vo.MembersVo;

@Service
public class MembersService {

	private MembersDao membersDao;

	@Autowired
	public MembersService(MembersDao membersDao) {
		this.membersDao = membersDao;
	}
	
	public int join(MembersVo membersVo) {
		int result=0;//입력 실패
		
		result = membersDao.joinMember(membersVo);
		
		return result;
	}


	public HashMap<String, Long> login(HashMap<String, String>loginInfo) {
		
		return membersDao.loginMember(loginInfo);
	}



	
	
	

}
