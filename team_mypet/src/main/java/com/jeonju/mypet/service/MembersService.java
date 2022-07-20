package com.jeonju.mypet.service;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.MembersDao;

@Service
public class MembersService {
	
	private MembersDao membersDao;
	
	// Test를 위해 임의로 작성한 코드(memberservice)  (
		@Autowired
		public MembersService(MembersDao membersDao) {
			this.membersDao = membersDao;
		}


		public HashMap<String, Long> login(HashMap<String, String> loginInfo) {
			return membersDao.loginMembers(loginInfo);
		}
		

		
		//  ) Test를 위해 임의로 작성한 코드
	
	
	
	
	

}
