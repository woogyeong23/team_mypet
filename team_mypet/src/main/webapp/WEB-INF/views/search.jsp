<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 검색 결과 페이지</title>
<!-- css************************************************ -->
    <jsp:include page="../include/head.jsp" />  
<!-- ************************************************ -->
<style type="text/css">
.result_span{
    display: inline-block;
    overflow: hidden;
    max-width: 840px;
    color: rgb(95, 0, 128);
    text-align: center;
    white-space: nowrap;
    text-overflow: ellipsis;
    vertical-align: top;
}

.result{
position: relative;
width:100%;
height: 400px;
}

.result_in{
position: absolute;
top: 50%;
left: 50%;
transform: translate(-50%,-50%);
}



</style>

</head>
<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../include/header.jsp" />  
<!-- ************************************************ -->
<h3 style="text-align:center"></h3>

<!-- Start Trending Product Area -->
    <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2><span class="result_span">'${keyword}'</span>에 대한 검색 결과</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:choose>
                    <c:when test="${resultCount == 0}">
                    <div class="result">
                    <div class="result_in">
                    <h1 style="color:rgb(181, 181, 181); text-align:center"><i class="lni lni-search-alt"></i></h1>
                               <br>
                   <h5 style="color: rgb(181, 181, 181);">검색된 상품이 없습니다.</h5>
                   </div>
                    </div>
                    </c:when>
                    
             <c:otherwise>
             <p>총 <span class="result_span">${resultCount}</span> 건</p>
              <c:forEach var="hv" items="${SearchList}">
       <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product" style="border:none;">
                    <c:choose>
                    <c:when test="${hv.p_discount != 0}">
                      <a href="${pageContext.request.contextPath}/productView.do?p_idx=${hv.p_idx}&seller_idx=${hv.seller_idx}">
                        <div class="product-image" style="height: 320px; ">
                            <img style="height:100%" src="${pageContext.request.contextPath}/resources/product/${hv.p_sys_filename}" alt="${hv.p_name}">
									<span class="sale-tag">-${hv.p_discount}%</span>
                        </div>
                        </a>
                    </c:when>
                    <c:otherwise>
                      <a href="${pageContext.request.contextPath}/productView.do?p_idx=${hv.p_idx}&seller_idx=${hv.seller_idx}">
                        <div class="product-image" style="height: 320px; width:245px; ">
                            <img style="height:100%" src="${pageContext.request.contextPath}/resources/product/${hv.p_sys_filename}" alt="${hv.p_name}">
                        </div>
                        </a>
                    </c:otherwise>
                    </c:choose>
                  
                        
                        <div class="product-info">
                          <span>
								<c:choose>
								   <c:when test="${hv.p_category_idx == 1}">강아지 > 개껌</c:when>
								   <c:when test="${hv.p_category_idx == 2}">강아지 > 스낵</c:when>
								   <c:when test="${hv.p_category_idx == 3}">강아지 > 뼈/육포</c:when>
								   <c:when test="${hv.p_category_idx == 4}">강아지 > 스틱</c:when>
								   <c:when test="${hv.p_category_idx == 5}">강아지 > 프리미엄</c:when>
								   <c:when test="${hv.p_category_idx == 6}">강아지 > 통살</c:when>
							       
							       <c:when test="${hv.p_category_idx == 7}">고양이 > 츄르</c:when>
								   <c:when test="${hv.p_category_idx == 8}">고양이 > 스낵</c:when>
								   <c:when test="${hv.p_category_idx == 9}">고양이 > 캣잎</c:when>
								   <c:when test="${hv.p_category_idx == 10}">고양이 > 통살</c:when>
								   <c:when test="${hv.p_category_idx == 11}">고양이 > 프리미엄</c:when>
								   <c:when test="${hv.p_category_idx == 12}">고양이 > 스틱</c:when>
								</c:choose>
							</span>
    
                            
                            <h4 class="title">
                                <a href="${pageContext.request.contextPath}/productView.do?p_idx=${hv.p_idx}&seller_idx=${hv.seller_idx}">
                                ${hv.p_name}</a>
                            </h4>
                            <ul class="review">
                               <c:forEach begin="1" end="${hv.avg_reviews_stars}" step="1">
									<li><i class="lni lni-star-filled"></i></li>
								</c:forEach>
								<c:if test="${hv.avg_reviews_stars%5 > 0}">
								   <li><i class="lni lni-star-half"></i></li>
								</c:if>
							   <c:forEach begin="1" end="${5-hv.avg_reviews_stars}" step="1">
							      <li><i class="lni lni-star-empty"></i></li>
							   </c:forEach>	
								
							</ul>
                            <div class="price">
                                  <a href="${pageContext.request.contextPath}/productView.do?p_idx=${hv.p_idx}&seller_idx=${hv.seller_idx}">
							  <span style="color:rgb(51, 51, 51);"><fmt:formatNumber value="${hv.p_disprice}" pattern="#,###"/>원</span>
								<c:if test="${hv.p_discount != 0}">
									<span class="discount-price"><fmt:formatNumber value="${hv.p_price}" pattern="#,###" />원</span>
							   </c:if>
							   </a>
							</div>
                            
                            <br>
                       </div>
                        
                    </div>
                    <!-- End Single Product -->
                </div>
                </c:forEach>
                
  
                
                     </c:otherwise>
                    
                    </c:choose>
            </div>
        </div>
    </section>







<!-- 푸터와 js************************************************ -->
    <jsp:include page="../include/footer.jsp" />  
<!-- ************************************************ -->
</body>
</html>