package com.jeonju.mypet.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.Commu_CommentVo;
import com.jeonju.mypet.vo.Commu_Comment_LikeVo;
import com.jeonju.mypet.vo.CommunityVo;
import com.jeonju.mypet.vo.Community_likeVo;
import com.jeonju.mypet.vo.FollowVo;
import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.Product_ImgVo;
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

	public int InsertComment(Commu_CommentVo ccommentVo) {
		return sqlSession.insert(MAPPER+".InsertComment", ccommentVo);
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

	public int CCInsert(Commu_CommentVo ccommentVo) {
		return sqlSession.insert(MAPPER+".CCInsert", ccommentVo);
	}
	
	public int UpDepth(Commu_CommentVo ccommentVo) {
		return sqlSession.update(MAPPER+".UpDepth", ccommentVo);
	}

	public CommunityVo modi_CB(int cm_idx) {
		return sqlSession.selectOne(MAPPER+".modi_CB", cm_idx);
	}
	
	
	// bsview 페이지 이동
	public List<SellerStoryVo> getBSList() {
		return sqlSession.selectList(MAPPER+".getBSList");
	}
	
	public List<SellerStoryVo> getBsList2() {
		return sqlSession.selectList(MAPPER+".getBsList2");
	}
	
	public List<ProductVo> getBSPList(int seller_idx) {
		return sqlSession.selectList(MAPPER+".getBSPList", seller_idx);
	}

	public List<ReviewVo> getAList(int seller_idx) {
		return sqlSession.selectList(MAPPER+".getAList", seller_idx);
	}

	public int getBSPCount(int seller_idx) {
		return sqlSession.selectOne(MAPPER+".getBSPCount", seller_idx);
	}

	public int getBSRCount(int seller_idx) {
		return sqlSession.selectOne(MAPPER+".getBSRCount", seller_idx);
	}

	public int getfollowCNT(FollowVo followVo) {
		return sqlSession.selectOne(MAPPER+".getfollowCNT",followVo);
	}

	public int getCmLike(Community_likeVo community_likeVo) {
		return sqlSession.insert(MAPPER+".getCmLike", community_likeVo);
	}

	public int getCmLikeYn(Community_likeVo community_likeVo) {
		return sqlSession.selectOne(MAPPER+".getCmLikeYn", community_likeVo);
	}

	public int getCmBad(Community_likeVo community_likeVo) {
		return sqlSession.update(MAPPER+".getCmBad", community_likeVo);
	}

	public int plusCmLikeCnt(Community_likeVo community_likeVo) {
		return sqlSession.update(MAPPER+".plusCmLikeCnt", community_likeVo);
	}

	public int minusCmLikeCnt(Community_likeVo community_likeVo) {
		return sqlSession.update(MAPPER+".minusCmLikeCnt", community_likeVo);
	}

	public int plusCmCommentCnt(Commu_CommentVo ccommentVo) {
		return sqlSession.update(MAPPER+".plusCmCommentCnt", ccommentVo);
	}

	public int plusCmView(int cm_idx) {
		return sqlSession.update(MAPPER+".plusCmView", cm_idx);
	}

	public int DeleteCm(CommunityVo communityVo) {
		return sqlSession.update(MAPPER+".DeleteCm", communityVo);
	}

	public int UpdateCB(CommunityVo communityVo) {
		return sqlSession.update(MAPPER+".UpdateCB", communityVo);
	}

	public Product_ImgVo getPI(ProductVo po) {
		return sqlSession.selectOne(MAPPER+".getPI",po);
	}

	public int DeleteCc(Commu_CommentVo commu_commentVo) {
		return sqlSession.update(MAPPER+".DeleteCc",commu_commentVo);
	}

	public int LikeCc(Commu_Comment_LikeVo commu_comment_likeVo) {
		return sqlSession.insert(MAPPER+".LikeCc",commu_comment_likeVo);
	}

	public int plusCcLike(Commu_Comment_LikeVo commu_comment_likeVo) {
		return sqlSession.update(MAPPER+".plusCcLike",commu_comment_likeVo);
	}

	public String getLikeCcYn(Commu_Comment_LikeVo ccl) {
		return sqlSession.selectOne(MAPPER+".getLikeCcYn", ccl);
	}







	

	

	
	
	
	
	
	

}
