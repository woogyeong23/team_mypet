<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 작성 확인 페이지</title>
<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
<style>
#dd{
    display: flex;
    justify-content: space-between;
    padding-bottom: 30px;
    }
</style>
</head>
<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ************************************************ -->

<h3 style="text-align:center"> 커뮤니티 글 작성 미리보기</h3>
<div style="margin:30px 400px 64px 400px;">
<%-- <div><img alt="커뮤니티 이미지" src="${pageContext.request.contextPath}/resources/Community/upload/${img}"/></div> --%>
<%-- <div>작성자 : ${writer}</div> --%>
<%-- <div>제목 : ${subject}</div> --%>
<%-- <div>내용 : ${content}</div> --%>



<div id="dd" >
                <div>
                    <div style="float:left">
                   <span style="margin-left: 15px; font-size:1.3em; color:black; margin-top:10px; top:60%">${writer}</span>
                   </div>
               </div>
                             
       </div>

                       
                 <div>
                        <c:if test="${img != ''}">
                         <img class="ckr" alt="${img}" src="${pageContext.request.contextPath}/resources/Community/upload/${img}">
                        </c:if>

                </div>
               <div style="padding-top:20px; padding-bottom:30px;">
                        <div style="text-align:center; color:black; font-size:1.3em">${subject}</div>
                        <div style="color:black">${content}</div>
               </div>
               <a href="${pageContext.request.contextPath}/CBList.do"><button type="button">커뮤니티 리스트</button></a>
               </div>




<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>
</html>