package com.jeonju.mypet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.MembersDao;

@Service
public class AjaxService {
	
	private MembersDao membersDao;

	@Autowired
	public AjaxService(MembersDao membersDao) {
		this.membersDao = membersDao;
	}
	
	public String idfind(String m_name) {
		String result = "";
		result = membersDao.idfind(m_name);
		System.out.println(result);
		return result;
	}


	public int petdelinfo(List<Integer> pet_idx_arr) {
		return membersDao.petdelinfo(pet_idx_arr);
	}


	public int petupinfo(int pet_idx) {
		System.out.println(pet_idx);
		return membersDao.petupinfo(pet_idx);
	}
	

	
	

}
