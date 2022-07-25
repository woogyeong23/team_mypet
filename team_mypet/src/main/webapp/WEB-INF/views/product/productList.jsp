<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<!-- css***************************************************** -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ******************************************************** -->
</head>

<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ******************************************************** -->
	
	<!-- 소현 -->
	<section class="trending-product section" style="margin-top: 12px;">
    <div class="container">
    		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  				<ol class="breadcrumb" style="font-size: 15px">
  					 <li class="breadcrumb-item"><a href="#">홈</a></li>
   					 <li class="breadcrumb-item active" aria-current="page">강아지</li>
  					 <li class="breadcrumb-item active" aria-current="page">개껌</li>
  				</ol>
			</nav>
	<div class="row">
                <c:forEach var="productVo" items="${productList}">
				<!-- Start Single Product -->
                <div class="col-lg-3">
                    <div class="single-product">
                    	<div class="product-image" style="position: relative;">
                    	<a href="productView.do">
                    	<c:choose>
                    		<c:when test="${productVo.p_sys_filename == null}">
                    	  		<img src="${pageContext.request.contextPath}/resources/assets/images/products/image.jpg" width="300px" height="300px">
                       		</c:when>
							<c:otherwise> 
								<img src="${pageContext.request.contextPath}/resources/assets/images/products/${productVo.p_sys_filename}" width="300px" height="300px">
							</c:otherwise>
						</c:choose>
						</a>
						<!--                             
						<div class="button">
                        <a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
                        </div> 
                        -->
                        <div style="position: absolute; left: 4px; top: 4px;"> </div> <!-- 찜하기버튼 -->
                        </div>
                        
                        <div class="product-info">
                            <span class="seller">${productVo.m_nick}</span>
                            <h4 class="p_name">${productVo.p_name}</h4>
                            <div class="price">
                                <span>${productVo.p_price}</span>
                            </div>
                            <ul class="review">
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star"></i></li>
                            </ul>
                        </div>
                    </div> 
                </div>
				</c:forEach>
    </div>
	</div>
	</section>
	
	
	
	
	<!-- 소현 -->
	
<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
		
</body>
</html>