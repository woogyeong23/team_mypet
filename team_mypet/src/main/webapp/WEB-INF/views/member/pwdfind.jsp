<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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

  <form name="pwdfindForm" action="${pageContext.request.contextPath}/pw_auth.do" method="post">
  	<a href="${pageContext.request.contextPath}/home.do">
    <img class="mb-4" src="resources/assets/images/DC.png" alt="" width="250" height="200" >
    </a>
    <h1 class="h3 mb-3 fw-normal">비밀번호 찾기</h1>

    <div class="form-floating">
      <input type="email" name="m_id" maxlength="80" class="form-control" id="m_id" required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="text"  name="m_phone" maxlength="20" class="form-control" id="m_phone">
      <label for="floatingInput">phone</label>
    </div>

    <button class="w-100 btn btn-lg btn-primary" id="pwdfind" type="submit">비밀번호 찾기</button>
  </form>
</main>         
		
</body>
</html>        