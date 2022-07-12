package com.jeonju.mypet.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MembersDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.member";
	
	@Autowired
	public MembersDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
}
