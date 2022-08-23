<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 인증번호 확인</title>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

  
    	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
    <jsp:include page="../../include/login.jsp" />
    <!-- ************************************************ -->

</head>

 <body class="text-center">
 
<main class="form-signin">

  <form action="${pageContext.request.contextPath}/pw_set.do" method="post">
	<input type="hidden" name ="num" value="${num }">
		<div class=content>
			<div class="textbox">
			<input type="text" name="email_injeung" placeholder="인증번호를 입력하세요"><label>인증번호 </label>
			<div class="error"> </div>
		</div><br><br>
			<input type="submit" id="check" value="확인">
</form>
</main>         
		
</body>
</html>        