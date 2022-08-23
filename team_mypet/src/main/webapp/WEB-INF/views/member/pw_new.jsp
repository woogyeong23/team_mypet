<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호 설정</title>
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
<form action="${pageContext.request.contextPath}/pw_new.do" method="POST" class="content">
	<div class="textbox">
		<input id="m_pwd" name="m_pwd" type="password"><label>새비밀번호</label>
		<div class="error">
 				Invalid password
		</div> 
	</div>
	<div class="textbox">
		<input id="m_pwd2" type="password" onchange="isSame();"><label>새비밀번호 확인</label>
		<div class="error">
				Invalid password
		</div>
	</div>
	<span id=same></span>
	<br><br>
	<input type="submit" id="check" value="비밀번호변경">
	<input type="hidden" name="m_id" value="${m_id}">
</form>
</main>         
		
</body>
</html>        