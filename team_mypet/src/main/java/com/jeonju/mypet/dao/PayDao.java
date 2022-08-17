package com.jeonju.mypet.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.DetailVo;
import com.jeonju.mypet.vo.OrdersVo;


@Repository
public class PayDao {

private SqlSession sqlSession;
	
	public static final String MAPPER = "com.jeonju.mypet.pay";
	
	@Autowired
	public PayDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int orderInsert(OrdersVo ordersVo) {
		return sqlSession.insert(MAPPER+".orderInsert",ordersVo);
	}


	
	public int detailInsert(DetailVo detailVo) throws Exception{
		return sqlSession.insert(MAPPER+".detailInsert",detailVo);

	}		


	
	
	
	
	
	

}
