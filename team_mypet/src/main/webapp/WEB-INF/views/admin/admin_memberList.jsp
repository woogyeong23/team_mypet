<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매자 리스트</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	

	<link href = "resources/assets/css/style.css"type="text/css" rel = "stylesheet">
		


<script>
	$(function(){
		
		//수정하기 버튼 클릭시 이벤트 처리
		$(".adminUpdateInfo").click(function(){
			
			let midx = $(this).attr("name");
			let id_input = "#m_grade"+midx;
			let m_grade = $(id_input).val();
			
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/adminUpdateInfo.do",
				data: {
					"midx": midx,
					"m_grade": m_grade
				},
				success: function(data){
					if(data == "N"){
						alert("회원등급 수정 실패!");
					}else{
						alert("회원등급 수정 성공!");
						$(id_input).attr("disabled", true);
					}
				},
				error: function(error){ alert("미구현"); }
			});
			
		});//end of 수정하기 버튼 클릭시 이벤트 처리
		
		//삭제하기 버튼 클릭시 이벤트 처리
		$("#adminDeleteInfo").click(function(){
			
			let midx_arr = new Array();
			
			//삭제 체크박스를 체크한 jQuery객체들로부터 member_idx값을 배열에 저장
			$("input:checked").each(function(index, item){
				midx_arr[index] = $(item).val();
			});
			
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/adminDeleteInfo.do",
				data: {
					"midx_arr": midx_arr
				},
				success: function(data){
					if(data == "N"){
						alert("회원삭제 실패!");
					}else{
						//회원목록에서 삭제 체크된 회원정보를 테이블에서 삭제하기
						$("tr:has(input:checked)").remove();
					}
				},
				error: function(error){ alert("미구현"); }
			});
			
		});//end of 삭제하기 버튼 클릭시 이벤트 처리
		
		
		
		
	});



</script>

</head>
<body>
	
<header>	
	
	



    <div class = "wrap">
    <div class = "logo">



관리자

  
</div>
 <hr/>
    <nav class = "menu">
           <ul class ="navi">
            
            <li><a href="${pageContext.request.contextPath}/admin_buyer.do">구매자 관리</a>
           
            


</li>

<li><a href="${pageContext.request.contextPath}/#">판매자 관리</a>


</li>
<li> <a href="${pageContext.request.contextPath}/#">판매량 차트</a>



   

</li>


<li> <a href="${pageContext.request.contextPath}/admin_board.do">공지사항 관리</a>


 
   


</li>



<li> 	<a href="${pageContext.request.contextPath}/admin_board2.do">이벤트 관리</a>


    
   


</li>



<li>	<a href="${pageContext.request.contextPath}/admin_mune.do">1:1문의 사항</a>


 
   


</li>



    </nav>

    </div>


</header>

<div class = "bodywrap">

  

<table border="1">




<h3>회원목록</h3>
<hr/>

<table border="1px">
	<tr>
		<th>회원번호</th><th>이름</th><th>아이디</th><th>비밀번호</th><th>회원등급</th><th>등급수정</th>
		<th>전화번호</th><th>가입일시</th><th>삭제여부</th><th>삭제요청일</th><th>DB삭제여부</th>
	</tr>
	
	<c:forEach var="MembersVo" items="${memberList}">
		<tr>
			<td>${MembersVo.midx}</td><td>${MembersVo.m_name}</td>
			<td>${MembersVo.m_id}</td><td>${MembersVo.m_pwd}</td>
			<td><input type="text" id="m_grade${MembersVo.midx}"  value="${MembersVo.m_grade}" size="5" /></td>
			<td><button class ="adminUpdateInfo" name="${MembersVo.midx}">수정하기</button></td>
			<td>${MembersVo.m_phone}</td><td>${MembersVo.m_wday}</td>
			<td>${MembersVo.m_delyn}</td><td>${MembersVo.midx}</td>
			<td>삭제<input type="checkbox" value="${MembersVo.midx}" /></td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="10"></td>
			<td><button id="adminDeleteInfo">삭제하기</button></td>
		</tr>
</table> 
	<a href="${pageContext.request.contextPath}/admin.do">관리자 메인페이지</a>
	

	






    
        <div class ="contents">
            <ul class ="tabmenu">
                <li>

                    <div class ="notice">
                       
                    </div>
                  </li>
                  <li>

                    <div class ="gallery">
                        

                    </div>
                  </li>

    </ul>


        <div class ="otherwrap">
            <div class ="banner">
<form method="get" action="admin_board.do">
		<select name="searchType">
			<option value="title" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'title'}">selected</c:if>>제목</option>
			<option value="contentWriter" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'contentWriter'}">selected</c:if>>내용+작성자</option>
		</select>
		<input type="text" name="searchValue" <c:if test="${!empty searchVO.searchValue}">value="${searchVO.searchValue}"</c:if>>
		<input type="submit" value="검색">
	</form>
           
</div>

                <div class ="shortcut">

                    
                


</div>

            </div>
        </div>


        

</div>
	

<footer>

    <div class="wrap">
    <div class ="btlogo">

     하단 로고 자리
    </div>
    
    <div class="site">
    <div class ="btmenu">
        하단 자리

   </div>



<div class ="copy">

copyright 자리



</div>

</div>



</footer>



	
	
	
	
	
	
	
</body>
</html>