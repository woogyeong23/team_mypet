<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html> 
  <head>

 <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->

    <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/sidebar.css" rel="stylesheet">
    <!-- css************************************************ -->
    <jsp:include page="../../include/membermodi.jsp" />  
<!-- ************************************************ -->
   
   
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	$(function(){
		//수정하기 버튼 클릭시 이벤트 처리
		$(".updatemember").click(function(){
			let midx = $(this).attr("name");
			//회원번호
			let id_input = "#member_grade"+member_idx;
			//회원등급 + 회원번호
			let member_grade = $(id_input).val();
			//회원등급 + 회원번호 = 회원등급
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/membermodiProc.do",
				data:{
					"member_idx":member_idx,
					,
				},
				success:function(data){
					if(data =="N"){
						alert("회원등급 수정 실패!");
					}else{
						alert("회원등급 수정 성공!");
						$(id_input).attr("disabled",true);
					}
				},
				error: function(error){alert("회원등급 수정 중 에러 발생!");}
				
			});
			
			
		}); //end of 수정하기 버튼 클릭 시 이벤트 처리
		//삭제하기 버튼 클릭시 이벤트 처리
		$("#adminDeleteInfo").click(function(){
			
			let member_idx_arr = new Array();
			
			//삭제 체크박스를 체크한 jQuery객체들로부터 member_idx 값을 배열에 저장
			$("input:checked").each(function(index,item){
				member_idx_arr[index] = $(item).val();	
			});
			
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/adminDeleteInfo.do",
				data:{"member_idx_arr": member_idx_arr
			},
				success:function(data){
					
					if(data =="N"){
						alert("회원등급 삭제 실패!");
					}else{
						$("tr:has(input:checked)").remove();
					}
				},
				error: function(error){alert("회원삭제 중 에러 발생!");}
				
			});
			
			
		});//end of 삭제하기 버튼 클릭 시 이벤트 처리

	});

</script>
   
   
   
  </head>
  <body>
  

    <!-- 헤더와 js************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->




<main>

	<aside>
		<!-- 사이더************************************************ -->
	    <jsp:include page="../../include/sidebar.jsp" />  
	    <!-- 사이더************************************************ -->
	    
	</aside>
	
	
	<article>
	<div class="title-style no-mt clf">
	<a href="#" class="txt fl">회원 정보 관리</a>
	</div>
	<form name="membermodiForm" action="${pageContext.request.contextPath}/membermodiProcess.do" method="post">
		<table class="table-style-head-left">
			<tbody>
				<tr>
					<th>
					프로필사진
					</th>
					<td>
					<div class="input-text size-m">
					<input type="file" name="m_file" value="${membersVo.m_profile}" class="profileUpload.do" required>
					</div>
					</td>
				</tr>
				<tr>
					<th>
					이름
					</th>
					<td>	
					<div class="input-text size-m">
					<input type="text" name="m_name" value="${membersVo.m_name}" required>
					</div>
					</td>
				</tr>
				<tr>
					<th>
					닉네임	
					</th>
					<td>
					<div class="input-text size-m">
					<input type="text" name="m_nick" value="${membersVo.m_nick}" required>
					</div>
					</td>
				</tr>
				<tr>
					<th>
					이메일
					</th>
					<td>
					<span id="m_id">${membersVo.m_id}</span>
					</td>
				</tr>
				<tr>
					<th>
					전화번호
					</th>
					<td>
					<div>	
						<span id="m_phone" data-phone="m_phone">${membersVo.m_phone}</span>
							<div class="button">
	                    		<a class="btn">변경하기</a>
                    		</div>
					</div>
					</td>
				</tr>
				<tr>
					<th>
					생년월일
					</th>
					<td>
					<div class="input-text size-s">
					<input type="text" name="m_birth" value="${membersVo.m_birth}" placeholder="1997-01-01" required>
					</div>
					</td>
				</tr>
				<tr>
					<th>
					주소
					</th>
					<td>
					<div class="input-text size-m">
					<input type="text" name="m_addr" value="${membersVo.m_addr}" required>
					</div>
					</td>
				</tr>
				<tr>
					<th>
					계좌번호
					</th>
					<td>
					<div class="input-text size-m">
					<input type="text" name="m_account" value="${membersVo.m_account}" required>
					</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="ta-r mt10"> 
		<a href="${pageContext.request.contextPath}/memberdel.do" class="btn btn-s btn-white">회원탈퇴</a>
		</div>
		<div class="form-submit ta-c" id="button">
		<input type="hidden" name="midx" value="${membersVo.midx}"> 
		    <button class="w-100 btn btn-lg btn-primary" id="memberupdate"type="submit" name="">회원 정보 수정하기</button>
		</div>
	</form>
	</article>
</main>







<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
     
  </body>
</html>