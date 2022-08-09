<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html> 
    <html>
  <head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(function(){
		$("#petDelete").click(function(){
			
			let pet_idx_arr = new Array();
			
			$("input:checked").each(function(index,item){
				
				pet_idx_arr[index] = $(item).val();
				
			});

			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/petdelete.do",
				data:{"pet_idx_arr":pet_idx_arr},
				success:function(data){
					if(data =="Y"){
						alert("삭제 실패!");
					}else{
						alert("삭제 성공!");
						$("table:has(input:checked)").remove();
					}
				},
				error: function(error){alert("삭제 중 에러 발생!");}
				
			});
			
		});
	
	
		$("#petUpdate").click(function(){
			let pet_idx = $(this).attr("name");
			
			
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/petUpdate.do",
				data:{"pet_idx":pet_idx},
				success:function(data){
					if(data =="Y"){
						alert("수정 실패!");
					}else{
						alert("수정 성공!");
					}
				},
				error: function(error){alert("회원등급 수정 중 에러 발생!");}
				
			});
			
		});
	});
	
});
</script>
 <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->

    <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/sidebar.css" rel="stylesheet">
    <!-- css************************************************ -->
    <jsp:include page="../../include/membermodi.jsp" />  
<!-- ************************************************ -->
   
  </head>
  <body>

    <!-- 헤더와 js************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->

<main class="content">
<aside>
	<!-- 사이더와 js************************************************ -->
    <jsp:include page="../../include/sidebar.jsp" />  
</aside>
<article>

<div class="title-style no-mt clf">
<a href="#" class="txt fl">펫 정보 관리</a>
</div>

<br>
<c:forEach var="petVo" items="${petVoList}">
			<input type="checkbox" value="${petVo.pet_idx}">
	<table class="table-style-head-left">
			
		<tbody>
			<tr>
				<th>
				이름
				</th>
				<td>
				<div class="input-text size-m">
				<input type="text" name="pet_name" value="${petVo.pet_name}" required>
				</div>
				</td>
			</tr>
			<tr>
				<th>
				성별	
				</th>
				<td>
				<input type="text" name="pet_gender" value="${petVo.pet_gender}">
				
				</td>
			</tr>
			<tr>
				<th>
				나이
				</th>
				<td>
				<div class="input-text size-s">
				<input type="text" name="pet_age" value="${petVo.pet_age}" required>
				</div>
				</td>
			</tr>
			<tr>
				<th>
				타입
				</th>
				<td>
				<input type="text" name="pet_type" value="${petVo.pet_type}">
				</td>
			</tr>
			<tr>
				<th>
				종
				</th>
				<td>
				<div class="input-text size-s">
				<input type="text" name="pet_breed" value="${petVo.pet_breed}" required>
				</div>
				</td>
			</tr>
		</tbody>
		<tr>
			<td>
				<button class="btn btn-m btn-point" id="petUpdate">수정하기 </button>
			</td>
			<td>
				<button class="btn btn-m btn-point" id="petDelete">삭제하기</button>
			</td>
		</tr>
	</table> 
	<input type="hidden" name="midx" value="${petVo.midx}">
	<input type="hidden" name="midx" value="${petVo.pet_idx}">	
	</c:forEach>


</article>

</main>

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->

  </body>
</html>