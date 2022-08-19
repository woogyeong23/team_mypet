<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

 

<head>
   <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />
   <!--  nav sticky -->
    <style type="text/css">
    #naver.fixed{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	background-color:#FFFFF0
    }
    
     /*  nav sticky */

    
    .popup{
   width:100%; 
   height:40px;
    margin: 0 auto; 
   position: relative; 
   background-color: #D9D7F1;
    }
    
   .popup_in{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
    }
    
    
    #popup_close{
    background-color: #D9D7F1;
    border: none;
    float: right;
    color: #FFFFFF;
    margin-right: 300px;
    margin-top:10px;
    }
    
    #popup_link{
    color: #FFFFFF;
    }
 
 table {
    margin:auto; 
}

table, td, th {
    border-collapse : collapse;
    border : 1px solid black;
};
    
    </style>
<!-- ************************************************ -->


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
						alert("판매자등업 성공!");
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

<script>
	$(function(){
		
		//수정하기 버튼 클릭시 이벤트 처리
		$(".adminUpdateInfo0").click(function(){
			
			let midx = $(this).attr("name");
			let id_input = "#m_grade"+midx;
			let m_grade = $(id_input).val();
			
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/adminUpdateInfo0.do",
				data: {
					"midx": midx,
					"m_grade": m_grade
				},
				success: function(data){
					if(data == "N"){
						alert("실패");
					}else{
						alert("구매자강등 성공!");
						$(id_input).attr("disabled", true);
					}
				},
				error: function(error){ alert("미구현"); }
			});
			
		});//end of 수정하기 버튼 클릭시 이벤트 처리
		
	});


</script>


</head>



<body>
     <div class="popup" >
     <div class="popup_in"><a id="popup_link" href="">지금 바로 가입하고 상품을 구입시 
  <span>아이패드</span> Get!</a></div><button id="popup_close"><i class="lni lni-close"></i></button>
  
     </div>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/admin_header.jsp" />  
<!-- ************************************************ -->
    

  

	
<div class = "align-center">
<h3>회원목록</h3>
<hr/>
  
<table border="1px">
	<tr>
		<th>회원번호</th><th>이름</th><th>아이디</th><th>등급</th><th>판매자등업</th><th>구매자강등</th>
		<th>전화번호</th><th>가입일시</th><th>삭제여부</th><th>번호</th><th>DB삭제여부</th>
	</tr>
	
	<c:forEach var="MembersVo" items="${memberList}">
		<tr>
			<td>${MembersVo.midx}</td><td>${MembersVo.m_name}</td>
			<td>${MembersVo.m_id}</td>
				
			<td>${MembersVo.m_grade}  </td>	
			<td><input type="radio" id="m_grade${MembersVo.midx}"  value="${MembersVo.m_grade }" size="5"  class ="adminUpdateInfo" name="${MembersVo.midx}"/>등업</td>	
	
			<td><input type="radio" id="m_grade${MembersVo.midx}"  value="${MembersVo.m_grade }" size="5"  class ="adminUpdateInfo0" name="${MembersVo.midx}"/>강등</td>	
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
	
</div>

	







	
	
	
	
	
<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>



</html>