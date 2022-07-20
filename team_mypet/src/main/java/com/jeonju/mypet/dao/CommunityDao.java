package com.jeonju.mypet.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.Commu_CommentVo;
import com.jeonju.mypet.vo.CommunityVo;
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

	public CommunityVo getCBView(int cmidx) {
		return sqlSession.selectOne(MAPPER+".getCBView", cmidx);
	}

	public int InsertComment(Commu_CommentVo CCommentVo) {
		return sqlSession.insert(MAPPER+".InsertComment", CCommentVo);
	}

	public List<Commu_CommentVo> getCcmList(int cmidx) {
		return sqlSession.selectList(MAPPER+".getCcmList", cmidx);
	}

	public List<SellerStoryVo> getBSList() {
		return sqlSession.selectList(MAPPER+".getBSList");
	}

	

	
	
	
	
	
	

}
