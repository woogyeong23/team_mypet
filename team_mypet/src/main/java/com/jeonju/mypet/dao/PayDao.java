package com.jeonju.mypet.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.DetailVo;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.OrdersListVo;
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
		return sqlSession.insert(MAPPER+".getorderInsert",ordersVo);
	}

	public int detailInsert(DetailVo detailVo) throws Exception{
		return sqlSession.insert(MAPPER+".getdetailInsert",detailVo);
	}

	public List<OrdersVo> orderpay(OrdersVo ordersVo) {
		return sqlSession.selectList(MAPPER+".orderList",ordersVo);
	}		

	public List<OrdersListVo> orderview(OrdersVo ordersVo){
		return sqlSession.selectList(MAPPER+".orderView",ordersVo);
	}
	
	
	public HashMap<String, Object> totalProductPrice(int midx,int cart_idx) {
		

		HashMap<String, Object> pay = new HashMap<String, Object>(); 
		pay.put("midx",midx);
		pay.put("cart_idx", cart_idx);
		
		return  sqlSession.selectOne(MAPPER+".totalProductPrice",pay);
		}
	
	public MembersVo membersinfo(int midx) {
		return sqlSession.selectOne(MAPPER+".membersInfo",midx);
	}

	public CartVo cartinfo(int midx) {
		return sqlSession.selectOne(MAPPER+".cartInfo",midx);
	}



	public void detailFixDvPriceUpdate(DetailVo detailVo) {
		// TODO Auto-generated method stub
		sqlSession.selectOne(MAPPER+".detailFixDvPriceUpdate");
	}


	public int detailIdxGet() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER+".detailIdxGet");
	}



	public int getFixDvPrice(int cart_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER+".getFixDvPrice",cart_idx);
	}



	public int getOrderIdx() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(MAPPER+".getOrderIdx");
	}



	public void detailDayInsert() {
		// TODO Auto-generated method stub
		sqlSession.insert(MAPPER+".detailDayInsert");
	}


	

}
