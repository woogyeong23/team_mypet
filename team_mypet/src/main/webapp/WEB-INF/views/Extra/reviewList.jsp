<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 후기 리스트 페이지</title>
<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
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
                        <h1 class="page-title">실시간 후기</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/home.do"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="#">실시간 후기</a></li>
<!--                         <li>Single Product</li> -->
                    </ul>
                </div>
            </div>
        </div>
    </div>


<!-- Start Trending Product Area -->
    <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>실시간 후기</h2>
                        <p>실시간으로 올라오는 후기로 상품에 대한 반응을 살펴보세요.</p>
                    </div>
                </div>
            </div>
            <div class="row">
            
            <c:forEach var="rv" items="${reviewList}">
                     
                    <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product">
                        <div class="product-image">
                        
                            <img style="height:100%" src="${pageContext.request.contextPath}/resources/product/${hv.p_sys_filename} alt="상품 이미지">
                            <div class="button">
<!--                                 <a href="#" class="btn"><i class="lni lni-cart"></i> Add to Cart</a> -->
                            </div>
                        </div>
                        <div class="product-info">
                            <span class="category">${rv.p_name}</span>
                            <h4 class="title">
                                <a href="${pageContext.request.contextPath}/productView.do?p_idx=${rv.p_idx}">${rv.p_name}</a>
                            </h4>
                            <p>${rv.review_content}</p>
                            <ul class="review">
                            <c:forEach begin="1" end="${rv.review_stars}">
                              <li><i class="lni lni-star-filled"></i></li>
                             </c:forEach>
                             
                             <c:forEach begin="1" end="${5-rv.review_stars}">
                              <li><i class="lni lni-star"></i></li>
                             </c:forEach>
                                <li><span>${rv.review_stars} 점</span></li>
                            </ul>
                           <div class="price">
							  <span><fmt:formatNumber value="${rv.p_disprice}" pattern="#,###"/>원</span>
								<c:if test="${rv.p_disprice != 0}">
									<span class="discount-price"><fmt:formatNumber value="${rv.p_price}" pattern="#,###" />원</span>
							   </c:if>
							</div>
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
</body>
</html>