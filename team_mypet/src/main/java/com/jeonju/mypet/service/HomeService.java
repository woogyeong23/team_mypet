package com.jeonju.mypet.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.HomeDao;
import com.jeonju.mypet.vo.MembersVo;

@Service
public class HomeService {

	private HomeDao homeDao;
	
	@Autowired
	public HomeService(HomeDao HomeDao) {
		this.homeDao = homeDao;
	}
	
	public int addProfile(MembersVo membersVo) {
		return homeDao.addProfile(membersVo);
	}

	

	
	
	
}
