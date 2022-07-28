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
</head>
<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ************************************************ -->
 

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
                        <div class="product-image">
                            <img src="${pageContext.request.contextPath}/resources/Community/upload/${cv.cm_img}" alt="커뮤니티 이미지">
                            <div class="button">
                                <a href="${pageContext.request.contextPath}/CBView.do?cm_idx=${cv.cm_idx}" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
                            </div>
                        </div>
                        <div class="product-info">
                            <span class="category">Watches</span>
                            <h4 class="title">
                                <a href="${pageContext.request.contextPath}/cbView.do?cm_idx=${cv.cm_idx}">${cv.cm_subject}</a>
                            </h4>
                            <ul class="review">
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star"></i></li>
                                <li><span>4.0 Review(s)</span></li>
                            </ul>
                            <div class="price">
                                <span>$199.00</span>
                            </div>
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