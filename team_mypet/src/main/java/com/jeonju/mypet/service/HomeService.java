package com.jeonju.mypet.service;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.HomeDao;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.ProductVo;


@Service
public class HomeService {

	private HomeDao homeDao;
	
	@Autowired
	public HomeService(HomeDao homeDao) {
		this.homeDao = homeDao;
	}
	

	public List<ProductVo> getHList() {
		return homeDao.getHList();
	}

	public int addProfile(MembersVo membersVo) {
		return homeDao.addProfile(membersVo);
	}
	
	
	
}
