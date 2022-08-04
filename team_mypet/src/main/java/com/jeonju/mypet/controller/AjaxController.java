package com.jeonju.mypet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jeonju.mypet.service.AjaxService;
import com.jeonju.mypet.vo.MembersVo;

//Ajax통신 지원을 위해 pom.xml에 의존모듈(jackson)을 추가해 줌

//@Controller
@RestController //Spring4버전부터 지원. @Controller + @ResponseBody 기능
public class AjaxController {
	
	private AjaxService ajaxService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public AjaxController(AjaxService ajaxService) {
		this.ajaxService = ajaxService;
	}
	
	
	@PostMapping("/idfindProcess.do")
	//@ResponseBody //Ajax통신의 응답내용을 보내는 것을 표시 <-- @RestController 로 대체 가능
	public String idFindProcess(@RequestParam("m_name") String m_name,Model model) {
		
		
		
		String result  = ajaxService.idfind(m_name);
		
		return result;
	}	
	
	@PostMapping("/petdelete.do")
	public String petDelete(@RequestParam("pet_idx_arr[]") List<Integer> pet_idx_list) {
		
		
		
		String result="N";//회원 삭제 실패
		
		int flag = ajaxService.petdelinfo(pet_idx_list);
		System.out.println(pet_idx_list);
		if(flag == 1) result = "Y";//회원 삭제 성공
		System.out.println("result: "+result);

		return result;
	}
	@PostMapping("/petUpdate.do")
	public String petUpdate(@RequestParam("pet_idx") int pet_idx) {
		
		
		
		String result="N";//회원 삭제 실패
		
		int flag = ajaxService.petupinfo(pet_idx);
		System.out.println(pet_idx);
		if(flag == 1) result = "Y";//회원 삭제 성공
		System.out.println("result: "+result);

		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}
