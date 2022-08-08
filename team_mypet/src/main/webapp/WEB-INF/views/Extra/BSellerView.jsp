<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기작가 자세히 보기 페이지</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
<style type="text/css">
body {
    font-family: 'Nanum Barun Gothic', sans-serif;
    font-size: 12px;
}

.content{
    max-width:719px;
    position: initial;
    z-index: initial;
    margin-top: 0;
    padding-bottom: 32px;
    background: #fff;
}
.quick-profile{
     width: 526px;
    padding: 55px 0px 36px;
    background-color: #ffffff;
    margin: 0 auto;
    }
   
    .artist-home .artist-contents {
    background-color: #f5f5f5;
    padding-bottom: 65px;
}

.quick-profile .profile-area {
    display: flex;
    padding: 0 6px;
}

</style>
</head>
<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ************************************************ -->

 <div class="artist-home">
 
         <section class="quick-profile">
         <div class="profile-area"></div>
         <div></div>
<div> 작가(판매자 idx) : ${SSV.seller_idx} </div>
<div> 작가 intro : ${SSV.seller_intro}</div>
<div> 작가 시작일 : ${SSV.seller_openday}</div>
<div> 작가 평균 별점 : ${SSV.seller_starsavg}</div>
<div> 작가 매출액 : ${SSV.seller_total}</div>
<div> 작가 상품 찜 갯수? : ${SSV.seller_wishcnt}</div>
<div> 작가 주문 횟수? : ${SSV.seller_ordercnt}</div>
<div> 작가 팔로우수 : ${SSV.seller_followcnt}</div>
         </section>
<section class="artist-contents">





 <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title" style="background-color:#FFFFFF ">
                        <h2>프로필 OR INTRO</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    ${SSV.seller_intro}
                    <!-- End Single Product -->
                </div>
            </div>
        </div>
    </section>




 <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title" style="background-color:#FFFFFF ">
                        <h2>판매 작품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
             <c:forEach var="bp" items="${BSPList}" end="7">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product">
                        <div class="product-image">
                            <img src="${pageContext.request.contextPath}/resources/Home/images/${bp.p_ori_filename}" alt="#">
                            <div class="button">
                                <a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
                            </div>
                        </div>
                        <div class="product-info">
                            <span class="category">${bp.p_category_idx}</span>
                            <h4 class="title">
                                <a href="#">${bp.p_name}</a>
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
                                <span>${bp.p_price}</span>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Product -->
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    
    
    
    
    <!-- Start Trending Product Area -->
    <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>실시간 후기</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            
            <c:forEach var="al" items="${aList}">
                     
                    <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product">
                        <div class="product-image">
                        
                            <img src="${pageContext.request.contextPath}/resources/image/${al.p_ori_filename}" alt="상품 이미지">
                            <div class="button">
                                <a href="#" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
                            </div>
                        </div>
                        <div class="product-info">
                            <span class="category">${al.p_category_idx}</span>
                            <h4 class="title">
                                <a href="">${al.p_name}</a>
                            </h4>
                            <ul class="review">
                            <c:forEach begin="1" end="${al.review_stars}">
                              <li><i class="lni lni-star-filled"></i></li>
                             </c:forEach>
                             
                             <c:forEach begin="1" end="${5-al.review_stars}">
                              <li><i class="lni lni-star"></i></li>
                             </c:forEach>
                                <li><span>${al.review_stars} 점</span></li>
                            </ul>
                            <div class="price">
                                <span>1,000,000 원</span>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Product -->
                </div>
              </c:forEach>      
         </div>
        </div>
    </section>

    










</section>
</div>
 


<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />
    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>