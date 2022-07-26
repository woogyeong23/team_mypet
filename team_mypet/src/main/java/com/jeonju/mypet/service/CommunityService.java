package com.jeonju.mypet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.CommunityDao;
import com.jeonju.mypet.vo.Commu_CommentVo;
import com.jeonju.mypet.vo.CommunityVo;

@Service
public class CommunityService {
	
	private CommunityDao commuDao;

	@Autowired
	public CommunityService(CommunityDao commuDao) {
		this.commuDao = commuDao;
		
	}
	
	public List<CommunityVo> getCommuList() {
		return commuDao.getCommuList();
	}

	public int InsertCB(CommunityVo communityVo) {
		return commuDao.InsertCB(communityVo);
	}

	public CommunityVo getCBView(int cm_idx) {
		return commuDao.getCBView(cm_idx);
	}

	public List<Commu_CommentVo> getCcmList(int cmidx) {
		return commuDao.getCcmList(cmidx);
	}

	
	
	
}
