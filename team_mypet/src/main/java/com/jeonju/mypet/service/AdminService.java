package com.jeonju.mypet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.AdminDao;
import com.jeonju.mypet.vo.BoardVo;
import com.jeonju.mypet.vo.CommunityVo;
import com.jeonju.mypet.vo.MembersVo;




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


		public List<BoardVo> getBoardList() {
			
			return adminDao.getBoardList();
		}


	

		public List<BoardVo> getEventList() {
			
			return adminDao.getEventList();
		}


		public List<BoardVo> getMuneList() {
			
			return adminDao.getMuneList();
		}


		public List<MembersVo> getMembersList() {
			// TODO Auto-generated method stub
			return adminDao.getMembersList();
			}

	
	public List<CommunityVo> getCommunityList() {
			
			return adminDao.getCommunityList();
		
		}

}
	

