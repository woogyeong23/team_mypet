package com.jeonju.mypet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.jeonju.mypet.dao.CommunityDao;
import com.jeonju.mypet.dao.HomeDao;
import com.jeonju.mypet.vo.Commu_CommentVo;
import com.jeonju.mypet.vo.Community_likeVo;
import com.jeonju.mypet.vo.FollowVo;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.ReviewVo;
import com.jeonju.mypet.vo.SellerStoryVo;

@Service
public class JoeAjaxService {
	
	private CommunityDao commuDao;
	private HomeDao homeDao;
	
	@Autowired
	public JoeAjaxService(CommunityDao commuDao) {
		this.commuDao = commuDao;
	}
	
	@Autowired
	public void serHomeDao(HomeDao homeDao) {
		this.homeDao = homeDao;
	}
	
	public int InsertComment(Commu_CommentVo CCommentVo) {
		int result = 0;
//		int max_cc_idx = commuDao.getMax_cc_idx();
//		CCommentVo.setMax_cc_idx(max_cc_idx);
		result = commuDao.InsertComment(CCommentVo);
		
		return result;
	}


	

	public SellerStoryVo getBSellerView(int seller_idx) {
		return commuDao.getBSellerView(seller_idx);
	}

	public List<ProductVo> getSearchList(String keyword) {
		return homeDao.getSearchList(keyword);
	}

	public int resultCount(String keyword) {
		return homeDao.resultCount(keyword);
	}

	public List<ReviewVo> getReviewList() {
		return homeDao.getReviewList();
	}

	public int CCInsert(Commu_CommentVo ccommentVo) {
		return commuDao.CCInsert(ccommentVo);
	}

	public  int UpDepth(Commu_CommentVo ccommentVo) {
	   return commuDao.UpDepth(ccommentVo);
	}
	
    // bsview 작동
	public List<SellerStoryVo> getBSList() {
		return commuDao.getBSList();
	}
	
	public List<ProductVo> getBSPList(int seller_idx) {
		return commuDao.getBSPList(seller_idx);
	}

	public List<ReviewVo> getAList(int seller_idx) {
		return commuDao.getAList(seller_idx);
	}

	public int getBSPCount(int seller_idx) {
		return commuDao.getBSPCount(seller_idx);
	}

	public int getBSRCount(int seller_idx) {
		return commuDao.getBSRCount(seller_idx);
	}
	
	// 팔로우
	public int getfollowCNT(FollowVo followVo) {
		return commuDao.getfollowCNT(followVo);
	}

	public int getFollow(FollowVo followVo) {
		return homeDao.getFollow(followVo);
	}

	public int getUnfollow(FollowVo followVo) {
		return homeDao.getUnfollow(followVo);
	}

	public int plusFollowCNT(FollowVo followVo) {
		return homeDao.plusFollowCNT(followVo);
	}

	public int minusFollowCNT(FollowVo followVo) {
		return homeDao.minusFollowCNT(followVo);
	}

	// 커뮤니티 게시판 좋아요
	public int getCmLike(Community_likeVo community_likeVo) {
		return commuDao.getCmLike(community_likeVo);
	}

	public int getCmBad(Community_likeVo community_likeVo) {
		return commuDao.getCmBad(community_likeVo);
	}

	public int plusCmLikeCnt(Community_likeVo community_likeVo) {
		return commuDao.plusCmLikeCnt(community_likeVo);
	}

	public int minusCmLikeCnt(Community_likeVo community_likeVo) {
		return commuDao.minusCmLikeCnt(community_likeVo);
	}

	public int plusCmCommentCnt(Commu_CommentVo ccommentVo) {
		return commuDao.plusCmCommentCnt(ccommentVo);
	}



	

	
	
	
}
