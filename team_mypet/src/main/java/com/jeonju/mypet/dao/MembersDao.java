package com.jeonju.mypet.dao;


import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.MembersVo;


@Repository
public class MembersDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.members";
	
	@Autowired
	public MembersDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int joinMember(MembersVo membersVo) {
		
		return sqlSession.insert(MAPPER+".joinMember",membersVo);
	}
	
	
	public HashMap<String, Long> loginMember(HashMap<String, String> loginInfo) {

		HashMap<String, Long> resultMap= sqlSession.selectOne(MAPPER+".loginMember",loginInfo);
		if(resultMap.get("m_auth")==0){
			resultMap.put("m_grade",0L);
		}
		return resultMap;
	}

	public int checkId(String id) {
		return sqlSession.selectOne(MAPPER+".checkId", id);
	}

	
	
	
	
}
