<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>관리자페이지</title>
</head>
<body>
<h2>Hello, Administrator!</h2>

<h3>  관리자 페이지입니다... </h3>

<hr/>

	<a href="${pageContext.request.contextPath}/memberList.do">회원목록보기</a><p/>
	<a href="${pageContext.request.contextPath}/home.do">메인페이지</a>

</body>
</html>
