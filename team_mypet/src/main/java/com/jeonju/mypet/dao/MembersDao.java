package com.jeonju.mypet.dao;


import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.PetVo;


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
		System.out.println(resultMap);
		return resultMap;
	}
	public HashMap<String, String> loginMember1(HashMap<String, String> loginInfo) {

		HashMap<String, String> resultMap1= sqlSession.selectOne(MAPPER+".loginMember",loginInfo);
		
		System.out.println(resultMap1);
		return resultMap1;
	}
	public HashMap<String, Integer> loginMember2(HashMap<String, String> loginInfo) {
		
		HashMap<String, Integer> resultMap2= sqlSession.selectOne(MAPPER+".loginMember",loginInfo);
		
		System.out.println(resultMap2);
		return resultMap2;
	}

	public int checkId(String id) {
		return sqlSession.selectOne(MAPPER+".checkId", id);
	}

	public MembersVo membermodi(int midx) {
		return sqlSession.selectOne(MAPPER+".getmembermodi", midx);
	}

	public int membermodiProcess(int midx) {
		return sqlSession.update(MAPPER+".getmembermodiProcess", midx);
	}

	public PetVo petmodi(int midx) {
		return sqlSession.selectOne(MAPPER+".getpetmodi",midx);
	}

	public int petmodiProcess(int midx) {
		return sqlSession.insert(MAPPER+".getpetmodiProcess", midx);
	}


	

	
	
	
	
}
