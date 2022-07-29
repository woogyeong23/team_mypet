<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최신순</title>
<!-- css***************************************************** -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ******************************************************** -->
</head>

<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ******************************************************** -->

<section class="trending-product section" style="margin-top: 12px;">
    <div class="container">
	<div class="row">
                <c:forEach var="productVo" items="${productList}">
				<!-- Start Single Product -->
                <div class="col-lg-3">
                    <div class="single-product">
                    	<div class="product-image">
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
                <!-- End Single Product -->
    </div>
	</div>
	</section>
	

	
<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
	
</body>
</html>