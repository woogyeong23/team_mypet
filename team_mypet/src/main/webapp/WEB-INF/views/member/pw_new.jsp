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

<script>



//비밀번호 확인
$(document).ready(function(){
	$('#m_pwd').blur(function(){
		$('#successPwChk2').text('');
		
	}); 
	
	$('#m_pwd2').blur(function(){ //keyup은 중복이 안되는 듯함;
		if($('#m_pwd').val()!= $('#m_pwd2').val()){
			result = "비밀번호가 일치하지 않습니다.";
	  		$(".successPwChk2").html(result).css("color","red");
	  		$("#m_pwd").val("").trigger("focus");
	  		$(".pwChk").val(false);

	 	}else{
			result = "비밀번호가 일치 합니다.";
		  	$('.successPwChk2').html(result).css("color","green");
	  		$(".pwChk").val(true);
	 	}return;
	});
 }); 

</script>

</head>

 <body class="text-center">
 
<main class="form-signin">
<form action="${pageContext.request.contextPath}/pw_new.do" method="POST" class="content">

    <img class="mb-4" src="resources/assets/images/logo/mypetLogo.png" alt="" width="250" height="200" >

		<div class="form-floating">
      <input type="password" id="m_pwd" name="m_pwd" maxlength="20" class="form-control">
      <label>새비밀번호</label>
		<span class="point successPwChk"></span>
	</div>
	<div class="form-floating">
      <input type="password" id="m_pwd2" onchange="isSame();" name="m_pwd2" maxlength="20" class="form-control">
      <label>새비밀번호 확인</label>
		
		<span class="point successPwChk2"></span>
		<input type="hidden" class="pwChk" />
	</div>
	<span id=same></span>
	<br><br>
	 <button class="w-100 btn btn-lg btn-primary" id="check" type="submit">비밀번호변경</button>
 <input type="hidden" name="m_id" value="${m_id}">
</form>
</main>         
		
</body>
</html>        