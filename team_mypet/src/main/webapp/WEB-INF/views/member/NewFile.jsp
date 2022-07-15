<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

@charset "UTF-8";

     html,
body {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f9fbd9;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input {
  margin-bottom: 5px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}



</style>

</head>
 <body class="text-center">
<main class="form-signin">
<form name="joinForm" action="${pageContext.request.contextPath}/joinProcess.do" method="post">
  	<a href="${pageContext.request.contextPath}/home.do">
    <img class="mb-4" src="resources/assets/images/DC.png" alt="" width="300" height="200" >
    </a>
    <h1 class="h3 mb-3 fw-normal" style="text-align:center">회원가입</h1>
    
    <div class="form-floating">
      <input type="email" name="m_id" value="" maxlength="80" class="form-control" id="floatingInput">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password"  name="m_pwd"  value="" maxlength="20" class="form-control" id="floatingPwd">
      <label for="floatingPassword">Password</label>
    </div>
     <div class="form-floating">
      <input type="text" name="m_birth" value="" maxlength="80" class="form-control" id="floatingBirth">
      <label for="floatingInput">birth</label>
    </div>
    <div class="form-floating">
      <input type="text"  name="m_addr"  value="" maxlength="20" class="form-control" id="floatingArrd">
      <label for="floatingtext">addr</label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" id="login_member"type="submit">회원가입</button>
  </form>
</main>         

</body></html>        