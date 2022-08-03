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
<link rel="stylesheet" href="resources/Community/CBList.css">

<style type="text/css">
.box {
    width: 34px;
    height: 34px; 
    border-radius: 70%;
    overflow: hidden;
    float:left;
    background: #BDBDBD;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

#dd{
    display: flex;
    justify-content: space-between;
    }
</style>

</head>
<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ************************************************ -->
    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">커뮤니티</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/home.do"><i class="lni lni-home"></i>Home</a></li>
                        <li><a href="#">커뮤니티</a></li>
<!--                         <li>Single Product</li> -->
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
 

 <!-- Start Trending Product Area -->
    <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>커뮤니티</h2>
                        <p>강의실 컴퓨터는 수시로 포맷을 진행하고 있습니다. 개인자료는 꼭 USB 또는 e-mail로 백업 해주세요.</p>
                    </div>
                </div>
            </div>
            <div class="row">
            
            <c:forEach var="cv" items="${commuList}">
                     
                    <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                   
                    <div class="single-product">
                  <div id="dd" >
                <div>
                   <div class="box">
    <img class="profile" src="${pageContext.request.contextPath}/resources/Community/upload/${cv.cm_img}">
                   </div>
                     <div style="float:left">
                   <span class="category" style="color:black">${cv.cm_writer}</span>
                   <br>
                   <span class="category">${cv.cm_wday}</span>       
                              </div>
                              </div>
                              <div><input type="button" value="팔로우"></div>
                              </div>
                              
                   
                        <div class="product-image">
                        <img src="${pageContext.request.contextPath}/resources/Community/upload/${cv.cm_img}" alt="커뮤니티 이미지">
                        </div>
                        <div class="product-info">
                            
                            <h4 class="title" style="overflow: hidden;">
                                <a href="${pageContext.request.contextPath}/CBView.do?cm_idx=${cv.cm_idx}">${cv.cm_subject}</a>
                            </h4>
                        </div>
                    </div>
                    <!-- End Single Product -->
                </div>
              </c:forEach>      
         </div>
        </div>
    </section>
  




  
 <c:if test="${m_id != null}">
 <div id="side_menu"><a href="${pageContext.request.contextPath}/CBInsert.do"><button type="button" class="btn btn-success" color="#aeddff">+</button></a></div>
</c:if>  

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>
</html>