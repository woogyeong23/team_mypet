package com.jeonju.mypet.dao;


import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MembersDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.members";
	
	@Autowired
	public MembersDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
    
	// Test를 위해 임의로 작성한 코드(membersdao)  (
	public HashMap<String, Long> loginMembers(HashMap<String, String> loginInfo) {
		HashMap<String, Long> resultMap = sqlSession.selectOne(MAPPER+".loginMembers", loginInfo);
	
		if(resultMap.get("m_auth") == 0) {
			resultMap.put("m_grade", 0L);
			resultMap.put("midx", null);
			resultMap.put("m_nick", null);
		}
		return resultMap;
	}
     
     //  ) Test를 위해 임의로 작성한 코드
	
	
	
}
