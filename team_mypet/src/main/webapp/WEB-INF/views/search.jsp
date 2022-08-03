<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
              <c:forEach var="sv" items="${SearchList}">
             
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product">
                        <div class="product-image">
                            <img src="${pageContext.request.contextPath}/resources/Home/images/${sv.p_ori_filename}" alt="#">
                            <div class="button">
                                <a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
                            </div>
                        </div>
                        <div class="product-info">
                            <span class="category">${sv.p_name}</span>
                            <h4 class="title">
                                <a href="product-grids.html">${sv.p_name}</a>
                            </h4>
                            <ul class="review">
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li> 
                                <li><span>5.0 Review(s)</span></li>
                            </ul>
                            <div class="price">
                                <span>${sv.p_price}</span>
                            </div>
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