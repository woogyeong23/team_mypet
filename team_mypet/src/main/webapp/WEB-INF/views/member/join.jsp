<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

</style>

    
    <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
        <jsp:include page="../../include/login.jsp" />
    
<!-- ************************************************ -->
</head>

 <body class="text-center">
<main class="form-signin">
<form name="joinForm" action="${pageContext.request.contextPath}/joinKakao.do">
  	<a href="${pageContext.request.contextPath}/home.do">
    <img class="mb-4" src="resources/assets/images/logo/mypetLogo.png" alt="" width="300" height="200" >
    </a>
    <h1 class="h3 mb-3 fw-normal" style="text-align:center">회원가입</h1>

    <button class="w-100 btn btn-lg btn-primary" id="login_member"type="submit">카카오로 회원가입</button>
  </form>
  <form name="joinForm" action="${pageContext.request.contextPath}/joinEm.do">
    <button class="w-100 btn btn-lg btn-primary" id="login_member"type="submit">이메일로 회원가입</button>
  </form>
</main>         

</body></html>        