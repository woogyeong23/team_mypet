package com.jeonju.mypet.controller;

import java.util.HashMap;
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
	
	
	
	
	
	
	
	@PostMapping("/checkId.do")
	//@ResponseBody //Ajax통신의 응답내용을 보내는 것을 표시
	public String checkId(@RequestParam("m_id") String id) {
		
		System.out.println("id: "+id);
		
		String result="N";//중복된 아이디 없음
		
		int flag = ajaxService.checkId(id);
		
		if(flag == 1) result = "Y";//중복된 아이디 있음
		
		return result;
	}
	
	
	@PostMapping("/adminUpdateInfo.do")
	public String adminUpdateInfo(@RequestParam("midx") int midx, @RequestParam("m_grade") int m_grade) {
		System.out.println(midx+":"+m_grade);
	
		//웹브라우저에서 전달받은 2개의 값을 MyBatis의 입력값으로 사용하기 위해 HashMap객체 생성해서 저장
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("midx", midx);
		map.put("m_grade", m_grade);
				
		String result="N";//정보수정 실패
		
		int flag = ajaxService.updateMemberGrade(map);
		System.out.println(flag+"-----------------------------------------");
		if(flag == 1) result = "Y";//정보수정 성공
		
		return result;
	}
	

	
	@PostMapping("/adminDeleteInfo.do")
	public String adminDeleteInfo(@RequestParam("midx_arr[]") List<Integer> midx_list) {
		
		String result="N";//회원삭제 실패
		
		int flag = ajaxService.deleteMemberInfo(midx_list);
		
		if(flag != 0) result = "Y";//회원삭제 성공
		
		return result;
	}
	
	
	
	
	
	
	
	
}
