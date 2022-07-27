<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 작성 확인 페이지</title>
<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
</head>
<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ************************************************ -->
<h3 style="text-align:center"> 커뮤니티 글 작성 확인 페이지</h3>
<div><img alt="커뮤니티 이미지" src="${pageContext.request.contextPath}/resources/Community/upload/${img}"/></div>
<div>작성자 : ${writer}</div>
<div>제목 : ${subject}</div>
<div>내용 : ${content}</div>
<a href="${pageContext.request.contextPath}/CBList.do">커뮤니티 리스트</a>




<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>
</html>