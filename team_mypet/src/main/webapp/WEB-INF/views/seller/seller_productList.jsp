<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>판매리스트</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	   
	<!-- css************************************************ -->
	    <jsp:include page="../../include/head.jsp" />  
	<!-- ************************************************ -->
</head>

<body>
	<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->
	
	
	<section class="trending-product section">
	hi
		<table border="1px">
		<c:forEach var="productVo" items="${productListMap}">
			<tr>
				<td>${productVo.p_name}</td><td>${productVo.p_content}</td><td>${productVo.p_category_small}</td>
			</tr>
		</c:forEach>
		</table>
	</section>
	
	
	<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
	<!-- ************************************************ -->
	
</body>

</html>        