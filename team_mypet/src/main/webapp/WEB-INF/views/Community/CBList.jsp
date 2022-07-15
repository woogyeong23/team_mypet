<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 리스트</title>
<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
<link rel="stylesheet" href="resources/CommunityCSS/CBList.css">
</head>
<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ************************************************ -->
  <div class="support-grid"></div>

  <div class="band">

   <c:forEach var="cv" items="${commuList}">
    <div class="item-1">
          <a href="주소" class="card">
            <div class="thumb" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/flex-1.jpg);"></div>
            <article>
              <h1>International Artist Feature: Malaysia</h1>
              <span>Mary Winkler</span>
            </article>
          </a>
    </div>
    
    </c:forEach>
  


</div>
  
 <c:if test="${m_id != null}">
 <div class="InsertBtn"><a href="${pageContext.request.contextPath}/cbInsert"><button type="button" class="btn btn-success" color="#aeddff">+</button></a></div>
</c:if>  

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>
</html>