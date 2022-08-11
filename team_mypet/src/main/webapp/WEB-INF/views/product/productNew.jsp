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
    
        <!-- 홈 > 최신순 링크  -->
    		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  				<ol class="breadcrumb" style="font-size: 15px">
  					 <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home.do">홈</a></li>
   					 <li class="breadcrumb-item active" aria-current="page"><a href="${pageContext.request.contextPath}/productNew.do">최신상품</a></li>	 
  					 
   				</ol>
			</nav>
		<!-- 홈 > 최신순 링크 끝 -->
    
    
	<div class="row">
                <c:forEach var="productVo" items="${productList}">
				<!-- Start Single Product -->
                <div class="col-lg-3">
                    <div class="single-product">
                    	<div class="product-image">
                    	<a href="productView.do?p_idx=${productVo.p_idx}">
                    			<img src="${pageContext.request.contextPath}/resources/product/${productVo.p_sys_filename}" width="300px" height="300px">
						</a>
                        </div>
                        
                        <div class="product-info">
                            <span class="seller">${productVo.m_nick}</span>
                            <h4 class="p_name">${productVo.p_name}</h4>
                            <div class="price">
                                <span>${productVo.p_price}원</span>
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