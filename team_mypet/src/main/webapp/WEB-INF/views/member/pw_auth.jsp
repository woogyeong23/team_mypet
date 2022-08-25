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
  
    <img class="mb-4" src="resources/assets/images/logo/mypetLogo.png" alt="" width="250" height="200" >
	<input type="hidden" name ="num" value="${num }">
		<div class=content>
		<div class="form-floating">
      <input type="text" name="email_injeung" value="" maxlength="20" class="form-control">
      <label for="email_injeung">인증번호</label>
      <div class="error"> </div>
    </div>
		
		
		</div><br><br>
		   <button class="w-100 btn btn-lg btn-primary" id="check" type="submit">인증</button>
 
</form>
</main>         
		
</body>
</html>        