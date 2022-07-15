package com.jeonju.mypet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.CommuDao;
import com.jeonju.mypet.vo.CommunityVo;

@Service
public class CommunityService {
	
	private CommuDao commuDao;

	@Autowired
	public CommunityService(CommuDao commuDao) {
		this.commuDao = commuDao;
	}
	
	public int addInsertCommu(CommunityVo commuVo) {
		return commuDao.addInsertCommu(commuVo);
	}

	public List<CommunityVo> getCommuList() {
		return commuDao.getCommuList();
	}

	public CommunityVo getCBView(long cm_idx) throws Exception {
		return commuDao.getCBView(cm_idx);
	}

	

	

	

}
