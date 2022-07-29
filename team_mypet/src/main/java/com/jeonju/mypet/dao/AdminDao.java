package com.jeonju.mypet.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.BoardVo;







@Repository
public class AdminDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.admin";
	
	@Autowired
	public AdminDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	

	public List<BoardVo> getboardList() {
		return sqlSession.selectList(MAPPER+".getboardList");
	}

	public int updateboardGrade(HashMap<String, Integer> map) {
		return sqlSession.update(MAPPER+".updateboardGrade", map);
	}

	public int deleteboardInfo(List<Integer> boardList) {
		return sqlSession.delete(MAPPER+".deleteboardInfo", boardList);
	}





}
