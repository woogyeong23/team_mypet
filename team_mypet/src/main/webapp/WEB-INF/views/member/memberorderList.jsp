<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>

 <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->


    <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/sidebar.css" rel="stylesheet">
    <link href="resources/assets/css/cart.css" rel="stylesheet">
    
<style>
html, body{
height: 100%;
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
#span{
width: 580px;

}
section {
height: 100%;
padding-bottom: 60px;
}
</style>
</head>
<body>

    <!-- 헤더와 js************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->
<div id="wrap">
<main class="container">

	<!-- 사이더와 js************************************************ -->
    <jsp:include page="../../include/sidebar.jsp" />  

<section>
<div class="container px-3 py-4" id="hanging-icons" >
    <h3 class="pb-1 border-bottom" >주문목록</h3>
<c:forEach items="${ordersList}" var="ordersList" varStatus="status">


<div class="card mb-1" style="max-width: 100%;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="${pageContext.request.contextPath}/resources/product/${ordersList.p_sys_filename}" class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><span>주문번호 : </span><a href="${pageContext.request.contextPath}/memberorder.do?orders_idx=${ordersList.orders_idx}">${ordersList.orders_idx}</a></h5>
        <p class="card-text"><span >수령인 : </span>${ordersList.orders_name}</p>
        <p class="card-text"><span >받을 주소 : </span>${ordersList.orders_addr1}</p>
        <p class="cart-text"><small class="text-muted">Last updated 3 mins ago</small></p>
      </div>
    </div>
  </div>
</div>

</c:forEach>
</div>
</section>
</main>
</div>

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
      
  </body>
</html>