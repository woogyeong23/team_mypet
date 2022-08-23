package com.jeonju.mypet.controller;


import java.util.HashMap;
import java.util.List;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jeonju.mypet.service.AjaxService;
import com.jeonju.mypet.vo.CartVo;
import com.jeonju.mypet.vo.MembersVo;
import com.jeonju.mypet.vo.ProductVo;

//Ajax통신 지원을 위해 pom.xml에 의존모듈(jackson)을 추가해 줌

//@Controller
@RestController //Spring4버전부터 지원. @Controller + @ResponseBody 기능
public class AjaxController {
	
	private AjaxService ajaxService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public AjaxController(AjaxService ajaxService) {
		this.ajaxService = ajaxService;
	}
	
	
	@PostMapping("/checkNick.do")
	public String checknick(@RequestParam("m_nick") String m_nick) {
		
		System.out.println("닉네임 : "+m_nick);

		String result= "1";  //중복된 아이디 없음
		
		int flag = ajaxService.checknick(m_nick);
		
		if(flag == 1) result = "2";  //중복된 아이디 있음

		return result;
	}
	
	@PostMapping("/idfindProcess.do")
	//@ResponseBody //Ajax통신의 응답내용을 보내는 것을 표시 <-- @RestController 로 대체 가능
	public String idFindProcess(@RequestParam("m_name") String m_name,Model model) {
		
		String result  = ajaxService.idfind(m_name);
		System.out.println("아이디찾기 : "+result);
		return result;
	}	
	
	@PostMapping("/pwdFindProcess.do")
	//@ResponseBody //Ajax통신의 응답내용을 보내는 것을 표시 <-- @RestController 로 대체 가능
	public String pwdFindProcess(@RequestParam("m_id") String m_id,
			@RequestParam("m_phone") String m_phone,Model model) {
		
		String result  = ajaxService.pwdfind(m_id,m_phone);
		
		System.out.println("비밀번호찾기 : "+result);
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
	
	
	@PostMapping("/cartHeaderView")
	public List<CartVo> cartHeaderView(CartVo cartVo,Model model,HttpServletRequest request)throws Exception {
		
		HttpSession Session = request.getSession();
		int midx = (int) Session.getAttribute("midx");
		
		 List<CartVo> list = new ArrayList<>();
		
			cartVo.setMidx(midx);
			list = ajaxService.cartList(cartVo);
			
			System.out.println("헤더부분"+list);
		return list;	
	}
	
	@PostMapping("/updatecnt.do")
	public String updatecnt(CartVo cartVo) throws Exception {
		
		String result; 
				
		int cnt = ajaxService.modifycartcnt(cartVo);
		
		System.out.println("카운트:"+cartVo);
		
		if(cnt == 1) {
			result = "Y";
		}else {
			result = "N";
		}
		
		System.out.println("업데뚜:"+result);

		return result;
		
	}
	@PostMapping("/cartRequest.do")
	public String cartRequest(CartVo cartVo) throws Exception {
		
		String result = "N";
				
		
			int flag = ajaxService.cartRequestUpdate(cartVo);
		if(flag== 1) result = "Y";		
		
		
		System.out.println("요구사항:"+result);

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
	
	
	

	@PostMapping("/deletecart.do")
	public String deletecart(CartVo cartVo, HttpSession session) {
		
		int midx = (int) session.getAttribute("midx");
		cartVo.setMidx(midx);
		String result = "N";
		int delete = ajaxService.deleteCart(cartVo);
		if(delete == 1) result = "Y";
		System.out.println("삭제:"+result);
		return result;
	}
}