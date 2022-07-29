package com.jeonju.mypet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.AdminDao;
import com.jeonju.mypet.vo.BoardVo;




@Service

public class AdminService {
	
	
	
	
		
		private AdminDao adminDao;
		
		@Autowired
		public AdminService(AdminDao adminDao) {
			this.adminDao = adminDao;
		}
		
   
		public List<BoardVo> getboardList() {
			return adminDao.getboardList();
		}



}
	

