package com.jeonju.mypet.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.AdminDao;
import com.jeonju.mypet.dao.CartDao;
import com.jeonju.mypet.dao.MembersDao;
import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.ProductVo;



@Service
public class AjaxService {
	
	private MembersDao membersDao;
	private AdminDao adminDao;
	
	@Autowired(required=false)
	public AjaxService(MembersDao membersDao, AdminDao adminDao) {
		this.membersDao = membersDao;
		this.adminDao = adminDao;
	}
	private CartDao cartDao;


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


	public int checkId(String id) {
		int result=0;
		result = membersDao.checkId(id);
		return result;
	}

	public int deleteMemberInfo(List<Integer> midx_list) {
		return adminDao.deleteMemberInfo(midx_list);
	}


	public int updateMemberGrade(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
	return adminDao.updateMemberGrade(map);
	}
	

	public int petdelinfo(List<Integer> pet_idx_list) {
		return membersDao.petdelinfo(pet_idx_list);
	}


	public int petupinfo(int pet_idx) {
		System.out.println(pet_idx);
		return membersDao.petupinfo(pet_idx);
	}
	
	public List<CartVo> cartList(CartVo cartVo) {
		
		return cartDao.cartList(cartVo);
	}
	
	public int modifycartcnt(CartVo cartVo) {
		return cartDao.modifycartcnt(cartVo);
	}

	
	public int deleteCart(CartVo cartVo) {
		return cartDao.deleteCart(cartVo);
	}

	public int checknick(String m_nick) {
		int result=0;
		result = membersDao.checkId(m_nick);
		return result;
	}
	
	

}
