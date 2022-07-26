package com.jeonju.mypet.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.AdminDao;

@Service
public class AdminService {
	
	
	
	
		
		private AdminDao adminDao;
		
		@Autowired
		public AdminService(AdminDao adminDao) {
			this.adminDao = adminDao;
		}
		
}
	

