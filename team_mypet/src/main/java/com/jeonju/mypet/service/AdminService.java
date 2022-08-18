package com.jeonju.mypet.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.AdminDao;
import com.jeonju.mypet.dao.MembersDao;
import com.jeonju.mypet.vo.BoardVo;
import com.jeonju.mypet.vo.CommunityVo;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.OrdersVo;




@Service

public class AdminService {
	
	
	
	private MembersDao membersDao;
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


	public List<OrdersVo> getOrdersList() {
		// TODO Auto-generated method stub
		return adminDao.getOrdersList();

	
	
	}


	public List<OrdersVo> getLaunchList() {
		// TODO Auto-generated method stub
		return adminDao.getLaunchList();
	}



	public int awInsert(BoardVo boardVo) {
		// TODO Auto-generated method stub
		
		
		System.out.println("서비스까지옴ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ" );
		return adminDao.awInsert(boardVo);
		}


	public int awInsert2(BoardVo boardVo) {
		// TODO Auto-generated method stub
		return adminDao.awInsert2(boardVo);
	}
	public int awInsert0(BoardVo boardVo) {
		// TODO Auto-generated method stub
		return adminDao.awInsert0(boardVo);
	}


	public List<BoardVo> getBoardListd() {
		// TODO Auto-generated method stub
		return adminDao.getBoardListd();
	}
	





}
	

