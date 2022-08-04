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
   
  </head>
  <body>

    <!-- 헤더와 js************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->

<main class="Mcontainer">
<aside>
	<!-- 사이더와 js************************************************ -->
    <jsp:include page="../../include/sidebar.jsp" />  
</aside>
<article >
<div class="title-style no-mt clf">
<a href="#" class="txt fl">펫 정보 관리</a>
</div>
<form name="petmodiForm" action="${pageContext.request.contextPath}/petmodiProcess.do" method="post">
	<table class="table-style-head-left">
		<tbody>
			<tr>
				<th>
				이름
				</th>
				<td>
				<div class="input-text size-m">
				<input type="text" name="pet_name" value="" required>
				</div>
				</td>
			</tr>
			<tr>
				<th>
				성별	
				</th>
				<td>
				<select name="pet_gender">
				<option  value="1" selected>수컷
				</option>
				<option  value="2">암컷
				</option>
				</select>
				
				</td>
			</tr>
			<tr>
				<th>
				나이
				</th>
				<td>
				<div class="input-text size-s">
				<input type="text" name="pet_age" value="" required>
				</div>
				</td>
			</tr>
			<tr>
				<th>
				타입
				</th>
				<td>
				
				<input type="radio" name="pet_type" value="1">강아지
				<input type="radio" name="pet_type" value="2">고양이
				
				
				</td>
			</tr>
			<tr>
				<th>
				종
				</th>
				<td>
				<div class="input-text size-s">
				<input type="text" name="pet_breed" value="" required>
				</div>
				</td>
				<td>
				</td>
			</tr>
			
		</tbody>
		
	</table>
	<div class="form-submit ta-c">
	<input type="hidden" name="midx" value="${midx}">
	<input type="submit" value="펫 정보 수정하기" class="btn btn-m btn-point">
	</div>
	
</form>
</article>
</main>



<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
     
  </body>
</html>