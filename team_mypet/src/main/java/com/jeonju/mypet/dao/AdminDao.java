package com.jeonju.mypet.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.BoardVo;
import com.jeonju.mypet.vo.CommunityVo;
import com.jeonju.mypet.vo.MembersVo;


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



	public int deleteboardInfo(List<Integer> boardList) {
		return sqlSession.delete(MAPPER+".deleteboardInfo", boardList);
	}



	public List<BoardVo> getBoardList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER + ".getBoardList");
	}



	public List<BoardVo> getEventList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER + ".getEventList");
	}



	public List<BoardVo> getMuneList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER + ".getMuneList");
		}



	public List<MembersVo> getMembersList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(MAPPER + ".getMembersList");
	}




	public int deleteMemberInfo(List<Integer> midx_list) {
		return sqlSession.delete(MAPPER+".deleteMemberInfo", midx_list);
	}



	public int updateMemberGrade(HashMap<String, Integer> map) {

		System.out.println("dao((((((((((((((((((((((((((((((((((((((((((((((");
		return sqlSession.update(MAPPER+".updateMemberGrade", map);
	}



	public List<CommunityVo> getCommunityList() {
	
		return sqlSession.selectList(MAPPER + ".getCommunityList");
	}


	

}
