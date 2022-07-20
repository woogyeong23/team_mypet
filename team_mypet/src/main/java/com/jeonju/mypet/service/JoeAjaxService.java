package com.jeonju.mypet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.CommunityDao;
import com.jeonju.mypet.vo.Commu_CommentVo;
import com.jeonju.mypet.vo.SellerStoryVo;

@Service
public class JoeAjaxService {
	
	private CommunityDao commuDao;
	
	@Autowired
	public JoeAjaxService(CommunityDao commuDao) {
		this.commuDao = commuDao;
	}
	
	public int InsertComment(Commu_CommentVo CCommentVo) {
		int result = 0;
//		int max_cc_idx = commuDao.getMax_cc_idx();
//		CCommentVo.setMax_cc_idx(max_cc_idx);
		result = commuDao.InsertComment(CCommentVo);
		
		return result;
	}

	public List<SellerStoryVo> getBSList() {
		return commuDao.getBSList();
	}
	
	
	
}
