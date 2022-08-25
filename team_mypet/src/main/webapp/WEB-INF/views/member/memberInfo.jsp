<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
    <!DOCTYPE html>  
    <html>
  <head>


 <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->


    <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/sidebar.css" rel="stylesheet">

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
<div class="container px-3 py-4" id="hanging-icons" stlye="width:100%">
    <h3 class="pb-1 border-bottom" >내 정보</h3>
    <div class="row g-3 py-4 row-cols-3 row-cols-lg-4">
      <div class="col d-flex align-items-start">
        <div>
          <h4>적립금</h4>
          <a href="${pageContext.request.contextPath}/memberpoint.do">
            <input type="hidden" name="m_point" value="${membersVo.m_point}">
            <fmt:formatNumber pattern="###,###,###원" value="${membersVo.m_point}"/>
          </a>
        </div>
      </div>
      <div class="col d-flex align-items-start">
        <div class="icon-square bg-light text-dark flex-shrink-0 me-2">
        </div>
        <div>
          <h4>회원등금</h4>
          <a href="${pageContext.request.contextPath}/membergrade.do">
            Silver
          </a>
        </div>
      </div>
      <div class="col d-flex align-items-start">
        <div class="icon-square bg-light text-dark flex-shrink-0 me-2">
        </div>
        <div>
          <h4>주문배송</h4>
          <a href="${pageContext.request.contextPath}/memberorders.do">
            0 건
          </a>
        </div>
      </div>
      <div class="col d-flex align-items-start">
        <div class="icon-square bg-light text-dark flex-shrink-0 me-2">
        </div>
        <div>
          <h4>교환/환불</h4>
          <a href="${pageContext.request.contextPath}/memberrefund.do" >
            0 건
          </a>
        </div>
      </div>
    </div>
    
    <hr>
    </div>
</section>
</main>


</div>

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
     
  </body>
</html>