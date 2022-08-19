<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BestSellerList 페이지 입니다.</title>

<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
<link rel="stylesheet" href="resources/Extra/bsCss.css">
<style type="text/css">


.box {
    width: 70px;
    height: 70px; 
    border-radius: 70%;
    overflow: hidden;
    float:left;
    background: #BDBDBD;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.bs_review li{
display: inline-block;
}
.bs_review li i{
  color: #fecb00;
  font-size: 13px;
}
.bs_review li i span {
  display: inline-block;
  margin-left: 4px;
  color: #888;
  font-size: 13px;
}
#follow{
    background-color: rgb(255, 255, 255);
    min-width: 63px;
    width: 63px;
    height: 28px;
    font-size: 12px;
    color: #fae100;
    border: 1px solid #fae100;
    border-radius: 4px;
    margin-top:10px;
}
.more{
background-color: rgb(255, 255, 255);
min-width: 80px;
    width: 80px;
     height: 28px;
    font-size: 12px;
    color: black;
     border: 1px solid black;
    border-radius: 4px;
    margin-top:10px;
}
.p_img{
font-size: 0;
    width: 168.25px;
    height: 168.25px;
    display: block;
    float: left;     background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
}
</style>
<script>
/* Demo purposes only */
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);
</script>


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
                        <h1 class="page-title">인기작가</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/home.do"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="#">인기작가</a></li>
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

              
              
   <c:forEach var="bs" items="${BestSellerList}">
                       <div class="col-lg-3 col-md-6 col-12">
      <figure class="snip1425" style="margin-bottom:50px; min-height:230px; max-height: 315px; border-radius:20px;">
  <img src="${pageContext.request.contextPath}/resources/seller/${bs.seller_img}" alt="작가 이미지" />
  <figcaption style="border-radius:20px;">
    <i class="lni lni-user"></i>
    <h5>${bs.m_nick} 작가님</h5>
    <p>
    팔로워 <span style="font-weight:600;">${bs.seller_followcnt}     </span>     
    별점 <span style="font-weight:600;">${bs.seller_starsavg}</span></p>
  </figcaption>
  <a href="${pageContext.request.contextPath}/BSellerView.do?seller_idx=${bs.seller_idx}"></a>
  </figure>
  </div>
  </c:forEach>
 
  
<!--   <figure class="snip1425"> -->
<!--   <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample19.jpg" alt="sq-sample19" /> -->
<!--   <figcaption><i class="ion-podium"></i> -->
<!--     <h4>Gunther</h4> -->
<!--     <h2>Beard</h2> -->
<!--   </figcaption> -->
<!--   <a href="#"></a> -->
<!-- </figure>      -->
         </div>
        </div>
    </section>
    
   
    
    
 





<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>
</html>