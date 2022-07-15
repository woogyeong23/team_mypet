<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
	
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/sign-in/">
    <!-- Bootstrap core CSS -->

    <style>
    
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

</style>
    
    <!-- Custom styles for this template -->
    	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
     <script>
  
    </script>
    
    <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
        <jsp:include page="../../include/login.jsp" />
    
<!-- ************************************************ -->

</head>

 <body class="text-center">
 
<main class="form-signin">
  <form name="loginForm" action="${pageContext.request.contextPath}/loginProcess.do" method="post">
  	<a href="${pageContext.request.contextPath}/home.do">
    <img class="mb-4" src="resources/assets/images/DC.png" alt="" width="250" height="200" >
    </a>
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <input type="email" name="m_id" value="" maxlength="80" class="form-control" id="floatingInput">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password"  name="m_pwd"  value="" maxlength="20" class="form-control" id="floatingPassword">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" id="remember-me" ${checked}> Remember me
		<a href="${pageContext.request.contextPath}/idfind.do">아이디찾기/</a>
		<a href="${pageContext.request.contextPath}/pwdfind.do">비밀번호찾기</a>
		<a href="${pageContext.request.contextPath}/join.do">회원가입</a>
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" id="login_member"type="submit">Sign in</button>
  </form>
</main>         
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>        