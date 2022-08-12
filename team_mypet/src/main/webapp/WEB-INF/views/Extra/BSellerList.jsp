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
                <div class="col-12">
                    <div class="section-title">
                        <h2>인기작가</h2>
                        <p>많은 사람들의 인기를 받고 있는 작가님을 소개합니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">    
            <c:forEach var="bs" items="${BestSellerList}">
                     
                    <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product">
                  <div id="dd" >
                <div>
                   <div class="box">
            <img class="profile" src="${pageContext.request.contextPath}/resources/seller/${bs.seller_img}">
            
                   </div>
                     <div style="float:left">
                   <span class="category" style="color:black">${bs.m_nick}</span>
                   <br>
                   <span class="category"></span>       
                              </div>
                              </div>
                                 <div style="margin-right:10px; margin-top:5px;">
                                    View <span></span>
                                 </div>
                              </div>
                              
                       
                        <div class="product-image" style="height: 320px;">
                        <c:if test="${bs.p_sys_filename == ''}">
                            ${bs.setP_sys_filename("image.jpg")}
                        </c:if>

                        <img style="height:100%" src="${pageContext.request.contextPath}/resources/product/${bs.p_sys_filename}" alt="${bs.p_name}">
                        </div>
                        <div class="product-info">
                            <h4 class="title" style="overflow: hidden;">
                                <a href="${pageContext.request.contextPath}/BSellerView.do?seller_idx=${bs.seller_idx}">${bs.seller_intro}</a>
                            </h4>
                        </div>
                        <div style="width:100%; position:relative">
                             <hr>
                        </div>
                        
                        <div style="display:flex; height: 30px;">
                        
                       
                       
                        <div style="margin-left:10px; position:relative; float:left">
                        
                      <ul class="bs_review">
                         <c:forEach begin="1" end="${bs.seller_starsavg}">
                            <li><i class="lni lni-star-filled"></i></li>
                         </c:forEach>                  
                              <c:forEach begin="1" end="${5-bs.seller_starsavg}">
                                 <li><i class="lni lni-star"></i></li>
                               </c:forEach>
                            <li><span>${bs.seller_starsavg}</span></li> 
                        </ul>
                        </div>
                        
                        <div style="margin-left:20px; position:relative">
                        <i class="lni lni-bubble"></i> 댓글 <span></span>
                        </div>
                        
                        
                      </div>
                        
                    </div>
                    <!-- End Single Product -->
                </div>
              </c:forEach> 
      <figure class="snip1425">
  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample19.jpg" alt="작가 이미지" />
  <figcaption><i class="ion-podium"></i>
    <h4>작가 이름</h4>
    <h2>작가 인트로</h2>
  </figcaption>     
         </div>
        </div>
    </section>
    
   
    
    
 





<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>
</html>