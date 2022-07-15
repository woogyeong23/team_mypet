package com.jeonju.mypet.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.CommunityVo;


@Repository
public class CommunityDao {
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.community";

	public List<CommunityVo> getCommuList() {
		return sqlSession.selectList(MAPPER+".getCommuList");
	}

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	
	
	
	
	

}
