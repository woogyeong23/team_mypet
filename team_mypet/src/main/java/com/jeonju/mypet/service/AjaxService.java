package com.jeonju.mypet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.CartDao;
import com.jeonju.mypet.dao.MembersDao;
import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.ProductVo;

@Service
public class AjaxService {
	
	private MembersDao membersDao;
	private CartDao cartDao;


	@Autowired
	public AjaxService(MembersDao membersDao) {
		this.membersDao = membersDao;
	}
	
	@Autowired //의존  자동 주입 : setter 방식
	public void setAdminDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	
	public String idfind(String m_name) {
		String result = "";
		result = membersDao.idfind(m_name);
		System.out.println(result);
		return result;
	}


	public int petdelinfo(List<Integer> pet_idx_list) {
		return membersDao.petdelinfo(pet_idx_list);
	}


	public int petupinfo(int pet_idx) {
		System.out.println(pet_idx);
		return membersDao.petupinfo(pet_idx);
	}
	
	public List<ProductVo> cartList(CartVo cartVo) {
		
		return cartDao.cartList(cartVo);
	}
	
	public int modifycartcnt(CartVo cartVo) {
		return cartDao.modifycartcnt(cartVo);
	}

	
	public int deleteCart(CartVo cartVo) {
		return cartDao.deleteCart(cartVo);
	}

	public int checkNick(String m_nick) {
		return membersDao.checkNick(m_nick);
	}
	
	

}
