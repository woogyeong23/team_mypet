<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html> 
    <html>
  <head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#petDelete").click(function(){
			let p_idx = $(this).attr("name");
			
			$ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/petDelete.do",
				data:{"p_idx":p_idx},
				success:function(data){
					if(data =="N"){
						alert("삭제 실패!");
					}else{
						alert("삭제 성공!");
						$("tr:has(input:checked)").remove();
					}
				},
				error: function(error){alert("회원등급 수정 중 에러 발생!");}
				
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

<main class="container">
<aside>
	<!-- 사이더와 js************************************************ -->
    <jsp:include page="../../include/sidebar.jsp" />  
</aside>
<aside>
<div class="title-style no-mt clf">
<a href="#" class="txt fl">펫 정보 관리</a>
</div>
<c:forEach var="petVo" items="${petVoList}">
<br>
<form>
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
		
			
	</table>
	<button type="submit" name="${petVo.pet_idx}" class="btn btn-s btn-point" style="text-align:right" id="petDelete">삭제하기</button>

	<input type="hidden" name="midx" value="${petVo.midx}">
	<input type="hidden" name="midx" value="${petVo.pet_idx}">	
	<div class="form-submit ta-c">
	<button type="submit" name="" class="btn btn-m btn-point">수정하기 </button>
	</div>
</form>
	</c:forEach>

</aside>
</main>

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->

  </body>
</html>