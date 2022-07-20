<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>

<body>

<h3>로그인</h3>

 <!-- Test를 위해 임의로 만든 코드 (login.jsp) -->
<form name="loginForm" action="${pageContext.request.contextPath}/loginProcess.do" method="post">
	<input type="text" name="m_id" value="" maxlength="80" placeholder="아이디(이메일)" /><br/>
	<input type="password" name="m_pwd"  value="" maxlength="20" placeholder="비밀번호"><br/>            
	<input type="submit" value="로그인">
	<input type="reset"  value="취소">
</form> 
 
  <!--  )Test를 위해 임의로 만든 코드  -->

</body></html>        
