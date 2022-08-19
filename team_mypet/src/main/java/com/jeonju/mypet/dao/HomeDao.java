package com.jeonju.mypet.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.ProductVo;
import com.jeonju.mypet.vo.ReviewVo;
import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.FollowVo;
import com.jeonju.mypet.vo.MembersVo;


@Repository
public class HomeDao {
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.home";

	@Autowired
	public HomeDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<ProductVo> getHList() {
		return sqlSession.selectList(MAPPER+".getHList");
	}
	
	public List<ProductVo> getHList2() {
		return sqlSession.selectList(MAPPER+".getHList2");
	}
	
	public List<ProductVo> getHList3() {
		return sqlSession.selectList(MAPPER+".getHList3");
	}
	public List<ProductVo> getHList4() {
		return sqlSession.selectList(MAPPER+".getHList4");
	}
	
	public List<ProductVo> getHList5() {
		return sqlSession.selectList(MAPPER+".getHList5");
	}
	
	public List<ReviewVo> getHList6() {
		return sqlSession.selectList(MAPPER+".getHList6");
	}
	

	public List<ProductVo> getSearchList(String keyword) {
		return sqlSession.selectList(MAPPER+".getSearchList", keyword);
	}

	public int resultCount(String keyword) {
		return sqlSession.selectOne(MAPPER+".resultCount", keyword);
	}
	
	public int addProfile(MembersVo membersVo) {
		return sqlSession.insert(MAPPER+".addGallery",membersVo);
	}

	public List<ReviewVo> getReviewList() {
		return sqlSession.selectList(MAPPER+".getReviewList");
	}

	public int getFollow(FollowVo followVo) {
		return sqlSession.insert(MAPPER+".getFollow",followVo);
	}

	public int getUnfollow(FollowVo followVo) {
		return sqlSession.update(MAPPER+".getFollow",followVo);
	}

	public int plusFollowCNT(FollowVo followVo) {
		return sqlSession.update(MAPPER+".plusFollowCNT",followVo);
	}

	public int minusFollowCNT(FollowVo followVo) {
		return sqlSession.update(MAPPER+".minusFollowCNT",followVo);
	}

	public CartVo getCCCart(CartVo cartVo) {
		return sqlSession.selectOne(MAPPER+".getCCCart",cartVo);
	}

	

	







	
	



	
	
	


}
