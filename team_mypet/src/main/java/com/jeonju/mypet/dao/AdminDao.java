package com.jeonju.mypet.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.BoardVo;
import com.jeonju.mypet.vo.CommunityVo;
import com.jeonju.mypet.vo.LaunchVo;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.OrdersVo;


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



	public List<CommunityVo> getComList() {
	
		return sqlSession.selectList(MAPPER + ".getComList");
	}







	public List<LaunchVo> getLaunchList() {
		// TODO Auto-generated method stub
	
		return sqlSession.selectList(MAPPER + ".getLaunchList");

	}



	public int awInsert(BoardVo boardVo) {
		// TODO Auto-generated method stub
		
			return sqlSession.insert(MAPPER+".awInsert", boardVo);
		}



	public int awInsert2(BoardVo boardVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(MAPPER+".awInsert2", boardVo);
	}

	
	public int awInsert0(BoardVo boardVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(MAPPER+".awInsert0", boardVo);
	}



	public BoardVo getBoardListd(String bidx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER + ".getBoardListd",bidx);
		}



	public int updateMemberGrade0(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.update(MAPPER+".updateMemberGrade0", map);
	}



	public BoardVo adminmodi(String  bidx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER+".adminmodi", bidx);
	}



	public int Updateadmin(BoardVo boardVo) {
		// TODO Auto-generated method stub
		return sqlSession.update(MAPPER+".Updateadmin", boardVo);
		}



	public BoardVo getEventListd(String bidx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER + ".getEventListd",bidx);
	}



	public int Updateadmin2(BoardVo boardVo) {
		// TODO Auto-generated method stub
		return sqlSession.update(MAPPER+".Updateadmin2", boardVo);
	}


	public BoardVo adminmodi2(String  bidx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER+".adminmodi2", bidx);
	}



	public BoardVo getMuneListd(String bidx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER + ".getMuneListd",bidx);
		}



	public CommunityVo getComListd(String cm_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER + ".getComListd",cm_idx);
	}



	public LaunchVo getLaunchListd(String launch_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER + ".getLaunchListd",launch_idx);
	}
}
