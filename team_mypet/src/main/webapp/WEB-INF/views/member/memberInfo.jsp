<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html> 
    <html>
  <head>

 <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
<style>
html, body{
height: 100%
}

#wrap {
min-height: 100%;
position: relative;
padding-bottom: 60px;
}

footer {
position: relative;
transform:translatY(-100%);
}


</style>

    <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/sidebar.css" rel="stylesheet">
   
  </head>
  <body>

    <!-- 헤더와 js************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->
<div id="wrap">
<main class="container">
<aside>
	<!-- 사이더와 js************************************************ -->
    <jsp:include page="../../include/sidebar.jsp" />  
</aside>
<article>
<div class="container px-3 py-4" id="hanging-icons" >
    <h3 class="pb-1 border-bottom" >내 정보</h3>
   
    
    
         
		      
        
        
</div>
 
    </article>
</main>

</div>

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
     
  </body>
</html>