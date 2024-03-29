package com.jeonju.mypet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.CommunityDao;
import com.jeonju.mypet.vo.Commu_CommentVo;
import com.jeonju.mypet.vo.Commu_Comment_LikeVo;
import com.jeonju.mypet.vo.CommunityVo;
import com.jeonju.mypet.vo.Community_likeVo;

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

	public List<Commu_CommentVo> getCcmList(int cm_idx) {
		return commuDao.getCcmList(cm_idx);
	}

	public int getReplyCount(int cm_idx) {
		return commuDao.getReplyCount(cm_idx);
	}

	public CommunityVo modi_CB(int cm_idx) {
		return commuDao.modi_CB(cm_idx);
	}

	public int getCmLikeYn(Community_likeVo community_likeVo) {
		return commuDao.getCmLikeYn(community_likeVo);
	}

	public int plusCmView(int cm_idx) {
		return commuDao.plusCmView(cm_idx);
	}

	public int UpdateCB(CommunityVo communityVo) {
		return commuDao.UpdateCB(communityVo);
	}

	public String getLikeCcYn(Commu_Comment_LikeVo ccl) {
		return commuDao.getLikeCcYn(ccl);
	} 

	
	
	
}
