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
    	$("#id_find").click(function(){
    		let m_name = $("#m_name").val();
    		$.ajax({
    			type : "post",
    			url : "${pageContext.request.contextPath}/idfindProcess.do",
    			data : {"m_name":m_name
    				},
    			success : function(data){
    				if(data==null){
    					$(".id_finded").html("등록되어 있지 않은 이름입니다.").css("color","red");

    				}else{
    					result="아이디는 :"+data+"입니다.";
    					$(".id_finded").text(result).css("color","green");

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
    <h1 class="h3 mb-3 fw-normal">아이디 찾기</h1>

    <div class="form-floating">
      <input type="text" name="m_name" value="" maxlength="20" class="form-control" id="m_name">
      <label for="m_name">name</label>
    </div>
    
    <span class="id_finded">gdgdgdg
    </span>
    
    <button  type="button" class="w-100 btn btn-lg btn-primary" id="id_find">아이디 찾기</button>
    
    </form>
</main>         
		
</body>
</html>        