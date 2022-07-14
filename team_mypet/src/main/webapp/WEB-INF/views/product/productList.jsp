<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
</head>

<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ************************************************ -->
	
	
	<!-- 소현 -->
	<section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
          
	<div class="row">
    	
	<c:forEach var="productVo" items="${productList}">
		<div class="col-lg-3">
				<div class="product-info">
                        <div class="product-image">
                        	<span>${product_imgVo.p_ori_filename}</span>
                            <span class="seller">${productVo.seller_idx}</span>
                            <h4 class="p_name">
                                <a href="productView.jsp">${productVo.p_name}</a>
                            </h4>
                            <ul class="star">
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                            </ul>
                            <div class="price">
                                <span>${productVo.p_price}</span>
                            </div>
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