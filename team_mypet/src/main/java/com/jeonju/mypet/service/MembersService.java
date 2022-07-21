package com.jeonju.mypet.service;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.mypet.dao.MembersDao;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.PetVo;

@Service
public class MembersService {

	private MembersDao membersDao;

	@Autowired
	public MembersService(MembersDao membersDao) {
		this.membersDao = membersDao;
	}
	
	public int join(MembersVo membersVo) {
		int result=0;//입력 실패
		
		result = membersDao.joinMember(membersVo);
		
		return result;
	}

	//로그인
	public HashMap<String, Long> login(HashMap<String, String>loginInfo) {
		return membersDao.loginMember(loginInfo);
	}
	public HashMap<String, String> login1(HashMap<String, String> loginInfo) {
		return membersDao.loginMember1(loginInfo);
	}
	public HashMap<String, Integer> login2(HashMap<String, String> loginInfo) {
		return membersDao.loginMember2(loginInfo);
	}
	
	//수정화면
	public MembersVo membermodi(int midx) {
		return membersDao.membermodi(midx);
	}
	//수정실행
	public int memberupdate(MembersVo membersVo) {
		return membersDao.membermodiProcess(membersVo);

	}



	public int petmodiProcess(PetVo petVo) {
		
		return membersDao.petmodiProcess(petVo);
	}

	public List<PetVo> petList(int midx) {
		return membersDao.petList(midx);
	}

	


	

	

	



	
	
	

}
