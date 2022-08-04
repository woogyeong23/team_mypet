package com.jeonju.mypet.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.Commu_CommentVo;
import com.jeonju.mypet.vo.CommunityVo;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.ReviewVo;
import com.jeonju.mypet.vo.SellerStoryVo;


@Repository
public class CommunityDao {
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.community";
	
	@Autowired
	public CommunityDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<CommunityVo> getCommuList() {
		return sqlSession.selectList(MAPPER+".getCommuList");
	}

	public int InsertCB(CommunityVo communityVo) {
		return sqlSession.insert(MAPPER+".InsertCB", communityVo);
	}

	public CommunityVo getCBView(int cm_idx) {
		return sqlSession.selectOne(MAPPER+".getCBView", cm_idx);
	}

	public int InsertComment(Commu_CommentVo CCommentVo) {
		return sqlSession.insert(MAPPER+".InsertComment", CCommentVo);
	}

	public List<Commu_CommentVo> getCcmList(int cm_idx) {
		return sqlSession.selectList(MAPPER+".getCcmList", cm_idx);
	}

	

	public SellerStoryVo getBSellerView(int seller_idx) {
		return sqlSession.selectOne(MAPPER+".getBSellerView", seller_idx);
	}

	public int getReplyCount(int cm_idx) {
		return sqlSession.selectOne(MAPPER+".getReplyCount", cm_idx);
	}

	public int CCInsert(Commu_CommentVo CCommentVo) {
		return sqlSession.insert(MAPPER+".CCInsert", CCommentVo);
	}
	
	public int UpDepth(Commu_CommentVo CCommentVo) {
		return sqlSession.update(MAPPER+".UpDepth", CCommentVo);
	}

	public CommunityVo modi_CB(int cm_idx) {
		return sqlSession.selectOne(MAPPER+".modi_CB", cm_idx);
	}
	
	
	// bsview 페이지 이동
	public List<SellerStoryVo> getBSList() {
		return sqlSession.selectList(MAPPER+".getBSList");
	}
	
	public List<ProductVo> getBSPList(int seller_idx) {
		return sqlSession.selectList(MAPPER+".getBSPList", seller_idx);
	}

	public List<ReviewVo> getAList(int seller_idx) {
		return sqlSession.selectList(MAPPER+".getAList", seller_idx);
	}

	

	

	
	
	
	
	
	

}
