<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<!--                                     <h3><span>ㄱㅇㅈㄱㅇㅈㅇㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅈㅈㅇㅇㅈㅇㅈㅇㅇㅈㅈㅇㅈㅈㅇ</span> 1,000,000 원</h3> -->
<!--                                     <div class="button"> -->
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

    <!-- Start Trending Product Area -->
    <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>지금 가장 핫한 간식</h2>
                        <p>강의실 컴퓨터는 수시로 포맷을 진행하고 있습니다. 개인자료는 꼭 USB 또는 e-mail로 백업 해주세요.</p>
                    </div>
                </div>
            </div>
            <div class="row">
              <c:forEach var="hv" items="${HomeList}" varStatus="status" end="4">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product">
                        <div class="product-image">
                            <img src="${pageContext.request.contextPath}/resources/Home/images/${hv.p_ori_filename}" alt="#">
                            <div class="button">
                                <a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
                            </div>
                        </div>
                        <div class="product-info">
                            <span class="category">${hv.p_name}</span>
                            <h4 class="title">
                                <a href="product-grids.html">${hv.p_name}</a>
                            </h4>
                            <ul class="review">
<%--                             <c:forEach items="${hv. }"> --%> <!-- 별점 구현 보류 -->
                            
<%--                             </c:forEach> --%>
                           
                            
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
                                <li><i class="lni lni-star-filled"></i></li>
<!--                                 <li><span>5.0 </span></li> -->
                            </ul>
                            <div class="price">
                                <span>${hv.p_price}</span>
                            </div>
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
                        <h2>마감 임박!</h2>
                        <p>강의실 컴퓨터는 수시로 포맷을 진행하고 있습니다. 개인자료는 꼭 USB 또는 e-mail로 백업 해주세요.</p>
                    </div>
                </div>
            </div>
            <div class="row">
              <c:forEach var="hv" items="${HomeList}" varStatus="status" end="4">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product">
                        <div class="product-image">
                            <img src="${pageContext.request.contextPath}/resources/Home/images/${hv.p_ori_filename}" alt="#">
                            <div class="button">
                                <a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
                            </div>
                        </div>
                        <div class="product-info">
                            <span class="category">${hv.p_name}</span>
                            <h4 class="title">
                                <a href="#">${hv.p_name}</a>
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
                                <span>${hv.p_price}</span>
                            </div>
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
                        <h2>띠링~ 신상품입니다.</h2>
                    </div>
                </div>
            </div>
            <div class="row">
              <c:forEach var="hv" items="${HomeList}" varStatus="status" end="4">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product">
                        <div class="product-image">
                            <img src="${pageContext.request.contextPath}/resources/Home/images/${hv.p_ori_filename}" alt="#">
                            <div class="button">
                                <a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
                            </div>
                        </div>
                        <div class="product-info">
                            <span class="category">${hv.p_name}</span>
                            <h4 class="title">
                                <a href="product-grids.html">${hv.p_name}</a>
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
                                <span>${hv.p_price}</span>
                            </div>
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
                        <h2>간식도둑 상품!</h2>
                        <p>강의실 컴퓨터는 수시로 포맷을 진행하고 있습니다. 개인자료는 꼭 USB 또는 e-mail로 백업 해주세요.</p>
                    </div>
                </div>
            </div>
            <div class="row">
              <c:forEach var="hv" items="${HomeList}" varStatus="status" end="4">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product">
                        <div class="product-image">
                            <img src="${pageContext.request.contextPath}/resources/Home/images/${hv.p_ori_filename}" alt="#">
                            <div class="button">
                                <a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
                            </div>
                        </div>
                        <div class="product-info">
                            <span class="category">${hv.p_name}</span>
                            <h4 class="title">
                                <a href="product-grids.html">${hv.p_name}</a>
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
                                <span>${hv.p_price}</span>
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
    <jsp:include page="../include/footer.jsp" />  
</body>

</html>