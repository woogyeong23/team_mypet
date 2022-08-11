<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

 

<head>
   
<!-- css************************************************ -->
    <jsp:include page="../include/head.jsp" />
   <!--  nav sticky -->
    <style type="text/css">
    #naver.fixed{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	background-color:#FFFFF0
    }
    
     /*  nav sticky */

    
    .popup{
   width:100%; 
   height:40px;
    margin: 0 auto; 
   position: relative; 
   background-color: #D9D7F1;
    }
    
   .popup_in{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
    }
    
    
    #popup_close{
    background-color: #D9D7F1;
    border: none;
    float: right;
    color: #FFFFFF;
    margin-right: 300px;
    margin-top:10px;
    }
    
    #popup_link{
    color: #FFFFFF;
    }
 
    
    </style>
<!-- ************************************************ -->

<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {
	  //nav
	  var lnb = $("#naver").offset().top;
	 
	  $(window).scroll(function() {
	   
	    var window = $(this).scrollTop();
	    
	    if(lnb <= window) {
	      $("#naver").addClass("fixed");
	    }else{
	      $("#naver").removeClass("fixed");
	    }
	  });
	  //nav
	  
	  
	  
	  
	  // topbar event popup 지우기
	  $('#popup_close').click(function(){
	        $('.popup').stop().slideUp()
	    });
	    
	});
	
	
	
</script>
</head>


</head>
<body>
     <div class="popup" >
     <div class="popup_in"><a id="popup_link" href="">지금 바로 가입하고 상품을 구입시 
  <span>아이패드</span> Get!</a></div><button id="popup_close"><i class="lni lni-close"></i></button>
  
     </div>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../include/header.jsp" />  
<!-- ************************************************ -->
    <!-- Start Hero Area -->
    <section class="hero-area">
<!--         <div class="container"> -->
            <div class="row">
                <div class="col-lg-12 col-12">
                    <div class="slider-head">
                        <!-- Start Hero Slider -->
                        <div class="hero-slider">
                            <!-- Start Single Slider -->
                            <a href="#">
                            <div class="single-slider" style="background-image: url(resources/assets/images/hero/rkstlrEVENT01.jpg);">
                                
<!--                                 <div class="content"> -->
                                  
<!--                                     <h2><span>ㄱㅇㅈㄱㅇㅈㅇㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅇㅈㅇㅈㅇㅇㅈㅈㅇㅈㅈㅇ</span> -->
<!--                                        ㄱㅇㅈㄱㅇㅈㅇㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅇㅈㅇㅈㅇㅇㅈㅈㅇㅈㅈㅇ -->
<!--                                     </h2> -->
<!--                                     <p>ㄱㅇㅈㄱㅇㅈㅇㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅇㅈㅇㅈㅇㅇㅈㅈㅇㅈㅈㅇ -->
<!--                                         ㄱㅇㅈㄱㅇㅈㅇㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅇㅈㅇㅈㅇㅇㅈㅈㅇㅈㅈㅇ</p> -->
<!--                         

             <div class="button"> -->
<!--                                         <a href="product-grids.html" class="btn">Shop Now</a> -->
<!--                                     </div> -->
<!--                                 </div> -->

                            </div>  </a>
                            <!-- End Single Slider -->
                            <!-- Start Single Slider -->
                            <a href="#">
                            <div class="single-slider"
                                style="background-image: url(resources/assets/images/hero/EventDetail_02.jpg);">
<!--                                 <div class="content"> -->
<!--                                     <h2><span>ㄱㅇㅈㄱㅇㅈㅇㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅇㅈㅇㅈㅇㅇㅈㅈㅇㅈㅈㅇ</span> -->
<!--                                        ㄱㄴㄷㄷㄹㅇㅇㅇㅇㅇㅇㅇㅇ -->
<!--                                     </h2> -->
<!--                                     <p>ㄱㅇㅈㄱㅇㅈㅇㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅇㅈㅇㅈㅇㅇㅈㅈㅇㅈㅈㅇ -->
<!--                                         ㄱㅇㅈㄱㅇㅈㅇㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅇㅈㅇㅈㅇㅇㅈㅈㅇㅈㅈㅇ</p> -->
<!--                                     <h3><span>ㄱㅇㅈㄱㅇㅈㅇㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅇㅈㅇㅈㅇㅇㅈㅈㅇㅈㅈㅇ</span> 1,000,000 원</h3> -->
<!--                                     <div class="button"> -->
<!--                                         <a href="product-grids.html" class="btn">클릭</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
                            </div>
                            </a>
                            <!-- End Single Slider -->
                        </div>
                        <!-- End Hero Slider -->
                    </div>
                </div>
<!--                 <div class="col-lg-4 col-12"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-lg-12 col-md-6 col-12 md-custom-padding"> -->
<!--                             Start Small Banner -->
<!--                             Start Small Banner -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
            </div>
<!--         </div> -->
    </section>
    <!-- End Hero Area -->
<!-- 최신순 -->
    <!-- Start Trending Product Area -->
    <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                      <h2><a href="#">지금 가장 핫한 간식&nbsp; <i class="lni lni-chevron-right" ></i></a></h2>
                      <p>adfsafasfsdfsdfasdf</p>
                    </div>
                </div>
            </div>
            <div class="row">
               <c:forEach var="hv" items="${HomeList}" varStatus="status" end="3">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product" style="border:none;">
                    <a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${hv.p_idx}">
                        <div class="product-image" style="height: 320px; ">
                            <img style="height:100%" src="${pageContext.request.contextPath}/resources/product/${hv.p_sys_filename}" alt="${hv.p_name}">
                                <c:if test="${hv.p_discount != 0}"><!-- member_grade: 0(일반회원), 1(관리자), 2(슈퍼관리자) -->
									<span class="sale-tag">-${hv.p_discount}%</span>
								</c:if>
                        </div>
                        </a>
                        
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
                                <a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${hv.p_idx} ">
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
							  <span><fmt:formatNumber value="${hv.p_disprice}" pattern="#,###"/>원</span>
								<c:if test="${hv.p_disprice != 0}">
									<span class="discount-price"><fmt:formatNumber value="${hv.p_price}" pattern="#,###" />원</span>
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
  <!-- 할인율 순 -->
      <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                       <h2><a href="#">마감 임박!</a></h2>
                    </div>
                </div>
            </div>
            <div class="row">
               <c:forEach var="hv" items="${HomeList2}" varStatus="status" end="3">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product" style="border:none;">
                    <a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${hv.p_idx}">
                        <div class="product-image" style="height: 320px; ">
                            <img style="height:100%" src="${pageContext.request.contextPath}/resources/product/${hv.p_sys_filename}" alt="${hv.p_name}">
                                <c:if test="${hv.p_discount != 0}"><!-- member_grade: 0(일반회원), 1(관리자), 2(슈퍼관리자) -->
									<span class="sale-tag">-${hv.p_discount}%</span>
								</c:if>
                        </div>
                        </a>
                        
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
    
                            <span class="category" style="margin-top:5px">
                        		<c:choose>
										<c:when test="${hv.p_status == 0}">판매중</c:when>
										<c:when test="${hv.p_status == 1}">품절</c:when>
										<c:when test="${hv.p_status == 2}">삭제</c:when>
								</c:choose>
                           </span>
                            <h4 class="title">
                                <a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${hv.p_idx} ">
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
                                <a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${hv.p_idx} ">
							  <span><fmt:formatNumber value="${hv.p_disprice}" pattern="#,###"/>원</span>
								<c:if test="${hv.p_disprice != 0}">
									<span class="discount-price"><fmt:formatNumber value="${hv.p_price}" pattern="#,###" />원</span>
							   </c:if></a>
							</div>
                            
                            <br>
							<span class="category">최초 등록일: 
							<fmt:formatDate value="${hv.p_wday}" pattern="yyyy-MM-dd"/>												</span>
							<span class="category">마지막 수정일: <fmt:formatDate value="${hv.p_modifyday}" pattern="yyyy-MM-dd"/></span>
                       </div>
                        
                    </div>
                    <!-- End Single Product -->
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    
    
    <!-- 별점순 -->
      <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2><a href="#">신상품입니다.</a></h2>
                    </div>
                </div>
            </div>
            <div class="row">
               <c:forEach var="hv" items="${HomeList3}" varStatus="status" end="3">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product" style="border:none;">
                    <a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${hv.p_idx}">
                        <div class="product-image" style="height: 320px; ">
                            <img style="height:100%" src="${pageContext.request.contextPath}/resources/product/${hv.p_sys_filename}" alt="${hv.p_name}">
                                <c:if test="${hv.p_discount != 0}"><!-- member_grade: 0(일반회원), 1(관리자), 2(슈퍼관리자) -->
									<span class="sale-tag">-${hv.p_discount}%</span>
								</c:if>
                        </div>
                        </a>
                        
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
    
                            <span class="category" style="margin-top:5px">
                        		<c:choose>
										<c:when test="${hv.p_status == 0}">판매중</c:when>
										<c:when test="${hv.p_status == 1}">품절</c:when>
										<c:when test="${hv.p_status == 2}">삭제</c:when>
								</c:choose>
                           </span>
                            <h4 class="title">
                                <a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${hv.p_idx} ">
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
                                  <a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${hv.p_idx} ">
							  <span><fmt:formatNumber value="${hv.p_disprice}" pattern="#,###"/>원</span>
								<c:if test="${hv.p_disprice != 0}">
									<span class="discount-price"><fmt:formatNumber value="${hv.p_price}" pattern="#,###" />원</span>
							   </c:if></a>
							</div>
                            
                            <br>
							<span class="category">최초 등록일: 
							<fmt:formatDate value="${hv.p_wday}" pattern="yyyy-MM-dd"/>												</span>
							<span class="category">마지막 수정일: <fmt:formatDate value="${hv.p_modifyday}" pattern="yyyy-MM-dd"/></span>
                       </div>
                        
                    </div>
                    <!-- End Single Product -->
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    
    
    <!-- 리뷰 갯수 순 -->
      <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2><a href="#">간식도둑 상품!</a></h2>
                        <p>강의실 컴퓨터는 수시로 포맷을 진행하고 있습니다. 개인자료는 꼭 USB 또는 e-mail로 백업 해주세요.</p>
                    </div>
                </div>
            </div>
            <div class="row">
               <c:forEach var="hv" items="${HomeList4}" varStatus="status" end="3">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product" style="border:none;">
                    <a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${hv.p_idx}">
                        <div class="product-image" style="height: 320px; ">
                            <img style="height:100%" src="${pageContext.request.contextPath}/resources/product/${hv.p_sys_filename}" alt="${hv.p_name}">
                                <c:if test="${hv.p_discount != 0}"><!-- member_grade: 0(일반회원), 1(관리자), 2(슈퍼관리자) -->
									<span class="sale-tag">-${hv.p_discount}%</span>
								</c:if>
                        </div>
                        </a>
                        
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
    
                            <span class="category" style="margin-top:5px">
                        		<c:choose>
										<c:when test="${hv.p_status == 0}">판매중</c:when>
										<c:when test="${hv.p_status == 1}">품절</c:when>
										<c:when test="${hv.p_status == 2}">삭제</c:when>
								</c:choose>
                           </span>
                            <h4 class="title">
                                <a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${hv.p_idx} ">
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
                                  <a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${hv.p_idx} ">
							  <span><fmt:formatNumber value="${hv.p_disprice}" pattern="#,###"/>원</span>
								<c:if test="${hv.p_disprice != 0}">
									<span class="discount-price"><fmt:formatNumber value="${hv.p_price}" pattern="#,###" />원</span>
							   </c:if></a>
							</div>
                            
                            <br>
							<span class="category">최초 등록일: 
							<fmt:formatDate value="${hv.p_wday}" pattern="yyyy-MM-dd"/>												</span>
							<span class="category">마지막 수정일: <fmt:formatDate value="${hv.p_modifyday}" pattern="yyyy-MM-dd"/></span>
                       </div>
                        
                    </div>
                    <!-- End Single Product -->
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    
    
  <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2><a href="#">간식도둑 상품!</a></h2>
                        <p>강의실 컴퓨터는 수시로 포맷을 진행하고 있습니다. 개인자료는 꼭 USB 또는 e-mail로 백업 해주세요.</p>
                    </div>
                </div>
            </div>
            <div class="row">
               <c:forEach var="hv" items="${HomeList5}" varStatus="status" end="3">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product" style="border:none;">
                    <a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${hv.p_idx}">
                        <div class="product-image" style="height: 320px; ">
                            <img style="height:100%" src="${pageContext.request.contextPath}/resources/product/${hv.p_sys_filename}" alt="${hv.p_name}">
                                <c:if test="${hv.p_discount != 0}"><!-- member_grade: 0(일반회원), 1(관리자), 2(슈퍼관리자) -->
									<span class="sale-tag">-${hv.p_discount}%</span>
								</c:if>
                        </div>
                        </a>
                        
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
    
                            <span class="category" style="margin-top:5px">
                        		<c:choose>
										<c:when test="${hv.p_status == 0}">판매중</c:when>
										<c:when test="${hv.p_status == 1}">품절</c:when>
										<c:when test="${hv.p_status == 2}">삭제</c:when>
								</c:choose>
                           </span>
                            <h4 class="title">
                                <a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${hv.p_idx} ">
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
                                  <a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${hv.p_idx} ">
							  <span><fmt:formatNumber value="${hv.p_disprice}" pattern="#,###"/>원</span>
								<c:if test="${hv.p_disprice != 0}">
									<span class="discount-price"><fmt:formatNumber value="${hv.p_price}" pattern="#,###" />원</span>
							   </c:if></a>
							</div>
                            
                            <br>
							<span class="category">최초 등록일: 
							<fmt:formatDate value="${hv.p_wday}" pattern="yyyy-MM-dd"/>												</span>
							<span class="category">마지막 수정일: <fmt:formatDate value="${hv.p_modifyday}" pattern="yyyy-MM-dd"/></span>
                       </div>
                        
                    </div>
                    <!-- End Single Product -->
                </div>
                </c:forEach>
            </div>
        </div>
    </section>


<!-- 푸터와 js************************************************ -->
    <jsp:include page="../include/footer.jsp" />  
</body>

</html>