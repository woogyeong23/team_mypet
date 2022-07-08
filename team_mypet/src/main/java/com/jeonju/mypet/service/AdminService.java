package com.jeonju.mypet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.AdminDao;
import com.jeonju.mypet.vo.MemberVo;

@Service
public class AdminService {
	
	private AdminDao adminDao;
	
	@Autowired
	public AdminService(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	public List<MemberVo> getMemberList() {
		return adminDao.getMemberList();
	}

}
