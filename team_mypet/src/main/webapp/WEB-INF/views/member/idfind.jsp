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
     $(function findid(){
    	 
    	$("#id_find").click(function(){
    		let m_name = $("#m_name").val();
    		
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
      <input type="text" name="m_name" value="" maxlength="20" class="form-control" id="floatingInput">
      <label for="floatingInput">name</label>
    </div>
    
    <button class="w-100 btn btn-lg btn-primary" id="id_find">아이디 찾기</button>
    <div style="height:20px" ><span id="id_finded" style="font-size:12px;">gdgd</span></div>
    </form>
</main>         
		
</body>
</html>        