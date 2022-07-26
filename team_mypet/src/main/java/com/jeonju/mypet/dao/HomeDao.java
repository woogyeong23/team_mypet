package com.jeonju.mypet.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.MembersVo;


@Repository
public class HomeDao {
	
private SqlSession sqlSession;
	
	public static final String MAPPER = "ezen.dev.spring.gallery";
	
	@Autowired
	public HomeDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public int addProfile(MembersVo membersVo) {
		return sqlSession.insert(MAPPER+".addGallery",membersVo);
	}

	
	
	
	
	
	

}
