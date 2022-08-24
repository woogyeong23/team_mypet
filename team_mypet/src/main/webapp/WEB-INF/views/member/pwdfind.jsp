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

  
    	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
     <script>
     
     $(document).ready(function(){
    	$("#pwd_find").click(function(){
    		let m_id = $("#m_id").val();
    		let m_phone = $("#m_phone").val();

    		$.ajax({
    			type : "post",
    			url : "${pageContext.request.contextPath}/pwdFindProcess.do",
    			data : {"m_id":m_id, "m_phone":m_phone},
    			success : function(data){
    				if(data==null){
    					$(".pwd_finded").html("등록되어 있지 않은 아이디 및 핸드폰번호입니다.").css("color","red");

    				}else{
    					result="비밀번호는 :"+data+"입니다.";
    					$(".pwd_finded").text(result).css("color","green");

    				}
    					
    			},
    			error: function(error){alert(error);}
    		});
    	});  	 
     });
    </script>
    
    <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
    <jsp:include page="../../include/login.jsp" />
    <!-- ************************************************ -->

</head>

 <body class="text-center">
 
<main class="form-signin">
  <form>
  	<a href="${pageContext.request.contextPath}/home.do">
    <img class="mb-4" src="resources/assets/images/DC.png" alt="" width="250" height="200" >
    </a>
    <h1 class="h3 mb-3 fw-normal">비밀번호 찾기</h1>

    <div class="form-floating">
      <input type="email" name="m_id" value="" maxlength="80" class="form-control" id="floatingInput">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="text"  name="m_phone"  value="" maxlength="20" class="form-control" id="floatingInput">
      <label for="floatingInput">phone</label>
    </div>

    <span class="pwd_finded">
    </span>
    <button class="w-100 btn btn-lg btn-primary" id="pwd_find" type="button" >비밀번호 찾기</button>
  </form>
</main>         
		
</body>
</html>        