package com.jeonju.mypet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.AdminDao;
import com.jeonju.mypet.dao.MembersDao;

@Service
public class AjaxService {
	
	private MembersDao membersDao;

	
	public int checkId(String id) {
		int result=0;
		result = membersDao.checkId(id);
		return result;
	}
	

	
	

}
