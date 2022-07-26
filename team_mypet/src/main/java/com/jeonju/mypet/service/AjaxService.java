package com.jeonju.mypet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.AdminDao;
import com.jeonju.mypet.dao.MembersDao;
import com.jeonju.mypet.vo.MembersVo;

@Service
public class AjaxService {
	
	private MembersDao membersDao;

	
	public String idfind(String m_name) {
		String result = "";
		result = membersDao.idfind(m_name);
		System.out.println(result);
		return result;
	}
	

	
	

}
