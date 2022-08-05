package com.jeonju.mypet.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.AdminDao;
import com.jeonju.mypet.dao.MembersDao;



@Service
public class AjaxService {
	
	private MembersDao membersDao;
	private AdminDao adminDao;
	
	@Autowired(required=false)
	public AjaxService(MembersDao membersDao, AdminDao adminDao) {
		this.membersDao = membersDao;
		this.adminDao = adminDao;
	}

	
	public String idfind(String m_name) {
		String result = "";
		result = membersDao.idfind(m_name);
		System.out.println(result);
		return result;
	}


	public int checkId(String id) {
		int result=0;
		result = membersDao.checkId(id);
		return result;
	}

	public int deleteMemberInfo(List<Integer> midx_list) {
		return adminDao.deleteMemberInfo(midx_list);
	}


	public int updateMemberGrade(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
	return adminDao.updateMemberGrade(map);
	}
	
	

	
	

}
