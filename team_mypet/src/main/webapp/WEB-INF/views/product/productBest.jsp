<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기순</title>
<!-- css***************************************************** -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ******************************************************** -->
</head>

<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ******************************************************** -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">인기상품</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/home.do"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/productBest.do">인기상품</a></li>
<!--                         <li>Single Product</li> -->
                    </ul>
                </div>
            </div>
        </div>
    </div>

	<section class="trending-product section" style="margin-top: 12px;">
    <div class="container">
    
   			
   			
	<div class="row">
      <c:forEach var="productVo" items="${productList}">
	     <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product" style="border:none;">
                    <a href="${pageContext.request.contextPath}/productView.do?p_idx=${productVo.p_idx}&seller_idx=${productVo.seller_idx}">
                    <div class="product-image" style="height: 320px;">
                            <img style="height:100%" src="${pageContext.request.contextPath}/resources/product/${productVo.p_sys_filename}" alt="${productVo.p_name}">
                                <c:if test="${productVo.p_discount != 0}"><!-- member_grade: 0(일반회원), 1(관리자), 2(슈퍼관리자) -->
									<span class="sale-tag">-${productVo.p_discount}%</span>
								</c:if>
                    </div>
                    </a>
                    
                        
                        <div class="product-info">
                          <span>
								<c:choose>
								   <c:when test="${productVo.p_category_idx == 1}">강아지 > 개껌</c:when>
								   <c:when test="${productVo.p_category_idx == 2}">강아지 > 스낵</c:when>
								   <c:when test="${productVo.p_category_idx == 3}">강아지 > 뼈/육포</c:when>
								   <c:when test="${productVo.p_category_idx == 4}">강아지 > 스틱</c:when>
								   <c:when test="${productVo.p_category_idx == 5}">강아지 > 프리미엄</c:when>
								   <c:when test="${productVo.p_category_idx == 6}">강아지 > 통살</c:when>
							       
							       <c:when test="${productVo.p_category_idx == 7}">고양이 > 츄르</c:when>
								   <c:when test="${productVo.p_category_idx == 8}">고양이 > 스낵</c:when>
								   <c:when test="${productVo.p_category_idx == 9}">고양이 > 캣잎</c:when>
								   <c:when test="${productVo.p_category_idx == 10}">고양이 > 통살</c:when>
								   <c:when test="${productVo.p_category_idx == 11}">고양이 > 프리미엄</c:when>
								   <c:when test="${productVo.p_category_idx == 12}">고양이 > 스틱</c:when>
								</c:choose>
							</span>
    
                            
                            <h4 class="title">
                                <a href="${pageContext.request.contextPath}/productView.do?p_idx=${productVo.p_idx} ">
                                ${productVo.p_name}</a>
                            </h4>
                            <ul class="review">
                               <c:forEach begin="1" end="${productVo.avg_reviews_stars}" step="1">
									<li><i class="lni lni-star-filled"></i></li>
								</c:forEach>
								<c:if test="${productVo.avg_reviews_stars%5 > 0}">
								   <li><i class="lni lni-star-half"></i></li>
								</c:if>
							   <c:forEach begin="1" end="${5-productVo.avg_reviews_stars}" step="1">
							      <li><i class="lni lni-star-empty"></i></li>
							   </c:forEach>	
							</ul>
							
                           <%-- <div class="price">
                            <c:if test="${productVo.p_disprice != 0}">
							  <span><fmt:formatNumber value="${productVo.p_disprice}" pattern="#,###"/>원</span>
									<span class="discount-price"><fmt:formatNumber value="${productVo.p_price}" pattern="#,###" />원</span>
							   </c:if>
							   <c:if test="${productVo.p_disprice == 0}">
								   <span><fmt:formatNumber value="${productVo.p_price}" pattern="#,###"/>원</span>
							   </c:if>
							</div> --%>
                            
                            <div class="price">
							  <span><fmt:formatNumber value="${productVo.p_disprice}" pattern="#,###"/>원</span>
								<c:if test="${productVo.p_discount != 0}">
									<span class="discount-price"><fmt:formatNumber value="${productVo.p_price}" pattern="#,###" />원</span>
							   </c:if>
							</div>
                            
                            <br>
                       </div>
                        
                    </div>
                    <!-- End Single Product -->
                </div>
                </c:forEach>              
       </div>
	
	</div>
	</section>
	

	
<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
	
</body>
</html>