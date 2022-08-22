package com.jeonju.mypet.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.AdminDao;
import com.jeonju.mypet.dao.MembersDao;
import com.jeonju.mypet.vo.BoardVo;
import com.jeonju.mypet.vo.CommunityVo;
import com.jeonju.mypet.vo.LaunchVo;
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

	
	public List<CommunityVo> getComList() {
			
			return adminDao.getComList();
		
		}




	public List<LaunchVo> getLaunchList() {
		// TODO Auto-generated method stub
		
		System.out.println("서비스까지옴ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ" );
		return adminDao.getLaunchList();
	}



	public int awInsert(BoardVo boardVo) {
		// TODO Auto-generated method stub
		
		

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


	public BoardVo getBoardListd(String bidx) {
		// TODO Auto-generated method stub
		return adminDao.getBoardListd(bidx);
	}


	public BoardVo adminmodi(String  bidx) {
		// TODO Auto-generated method stub
		return adminDao.adminmodi(bidx);
		}


	public int Updateadmin(BoardVo boardVo) {
		// TODO Auto-generated method stub
		return adminDao.Updateadmin(boardVo);
		}


	public BoardVo getEventListd(String bidx) {
		// TODO Auto-generated method stub
		return adminDao.getEventListd(bidx);
	}


	public int Updateadmin2(BoardVo boardVo) {
		// TODO Auto-generated method stub
		return adminDao.Updateadmin2(boardVo);
	}
		
	public BoardVo adminmodi2(String  bidx) {
		// TODO Auto-generated method stub
		return adminDao.adminmodi2(bidx);
		}


	public BoardVo getMuneListd(String bidx) {
		// TODO Auto-generated method stub
		return adminDao.getMuneListd(bidx);
		}


	public CommunityVo getComListd(String cm_idx) {
		// TODO Auto-generated method stub
	
		return adminDao.getComListd(cm_idx);
		}


	public LaunchVo getLaunchListd(String launch_idx) {
		// TODO Auto-generated method stub
		return adminDao.getLaunchListd(launch_idx);
	}






}
	

