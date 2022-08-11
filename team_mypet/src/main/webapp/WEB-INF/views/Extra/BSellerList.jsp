
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
<style type="text/css">
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
                        <p>강의실 컴퓨터는 수시로 포맷을 진행하고 있습니다. 개인자료는 꼭 USB 또는 e-mail로 백업 해주세요.</p>
                    </div>
                </div>
            </div>
            <div class="row">
 

     </div>
     
    <!--  <ul> -->
     
     <c:set var="seller_idx" value="${BestSEllerList[0].seller_idx}"/>
     <!-- <div class="BSL_flex" style="display:flax; height:230px;"> 
        -->
    
     <%-- <c:forEach var="bsv" items="${BestSellerList}" > --%>

       <!--  <li style="height:230px; position:relative;"> -->
      <%-- <div class="BSL_flex" style="display:flax; height:230px;">
 
      <div style="position:relative; top:50%; float:left; margin-left: 50px; width:96px; height: 96px; border-radius: 70%; overflow: hidden;">
      		<img class="profile" src="${pageContext.request.contextPath}/resources/Extra/img/${bsv.seller_img}" alt="${bsv.m_nick}">
      </div>
      <div style="position:relative; top:50%; float:left; margin-left: 25px; font:14px;">
	      <a style="color:black" href="${pageContext.request.contextPath}/BSellerView.do?seller_idx=${bsv.seller_idx}"><span class="category">${bsv.m_nick}</span></a>
	      <br>
	       <ul class="bs_review">
	         <c:forEach begin="1" end="${bsv.seller_starsavg}">
	            <li><i class="lni lni-star-filled"></i></li>
	         </c:forEach>                  
	         <c:forEach begin="1" end="${5-bsv.seller_starsavg}">
	              <li><i class="lni lni-star"></i></li>
	         </c:forEach>
	              <li><span>${bsv.seller_starsavg}</span></li>
	       </ul>
	       <br>
	       <a style="color:black" href="${pageContext.request.contextPath}/BSellerView.do?seller_idx=${bsv.seller_idx}">${bsv.seller_intro}</a>
	       <br>
	       <input type="button" id="follow" value="+ 팔로우">
	       <a style="color:black" href="${pageContext.request.contextPath}/BSellerView.do?seller_idx=${bsv.seller_idx}">
	       <input type="button" class="more" value="작품 더보기"></a>
      </div>
   
      <div style="position:relative; top:50%; float:left; margin-left: 24px;"> --%>
     
     
    <ul>
    
    
    <li style="height:230px; position:relative;"> 
     <div class="BSL_flex" style="display:flax; height:230px;">
 
      <div style="position:relative; top:50%; float:left; margin-left: 50px; width:96px; height: 96px; border-radius: 70%; overflow: hidden;">
      		<img class="profile" src="${pageContext.request.contextPath}/resources/Extra/img/${bsv.seller_img}" alt="${bsv.m_nick}">
      </div>
      <div style="position:relative; top:50%; float:left; margin-left: 25px; font:14px;">
	      <a style="color:black" href="${pageContext.request.contextPath}/BSellerView.do?seller_idx=${bsv.seller_idx}"><span class="category">${bsv.m_nick}</span></a>
	      <br>
	       <ul class="bs_review">
	         <c:forEach begin="1" end="${bsv.seller_starsavg}">
	            <li><i class="lni lni-star-filled"></i></li>
	         </c:forEach>                  
	         <c:forEach begin="1" end="${5-bsv.seller_starsavg}">
	              <li><i class="lni lni-star"></i></li>
	         </c:forEach>
	              <li><span>${bsv.seller_starsavg}</span></li>
	       </ul>
	       <br>
	       <a style="color:black" href="${pageContext.request.contextPath}/BSellerView.do?seller_idx=${bsv.seller_idx}">${bsv.seller_intro}</a>
	       <br>
	       <input type="button" id="follow" value="+ 팔로우">
	       <a style="color:black" href="${pageContext.request.contextPath}/BSellerView.do?seller_idx=${bsv.seller_idx}">
	       <input type="button" class="more" value="작품 더보기"></a>
      </div>
     
    
    <c:forEach var="bsv" items="${BestSellerList}">
	     <c:choose>
	     <c:when test="${seller_idx ==bsv.seller_idx}">
	      <li style="float:right;height:200px;width: 150px; position:relative; display: inline-block;"><a href="#">
	      <img src="${pageContext.request.contextPath}/resources/product/${bsv.p_sys_filename}" alt="해당사진">
	      </a>
	      </li>
	     </c:when>
	     <c:otherwise>
	     	</ul>
	       	<c:set var="seller_idx" value="${bsv.seller_idx}"/>
	       	<ul>
	       	<li style="height:230px; position:relative;"> 
     <div class="BSL_flex" style="display:flax; height:230px;">
 
      <div style="position:relative; top:50%; float:left; margin-left: 50px; width:96px; height: 96px; border-radius: 70%; overflow: hidden;">
      		<img class="profile" src="${pageContext.request.contextPath}/resources/Extra/img/${bsv.seller_img}" alt="${bsv.m_nick}">
      </div>
      <div style="position:relative; top:50%; float:left; margin-left: 25px; font:14px;">
	      <a style="color:black" href="${pageContext.request.contextPath}/BSellerView.do?seller_idx=${bsv.seller_idx}"><span class="category">${bsv.m_nick}</span></a>
	      <br>
	       <ul class="bs_review">
	         <c:forEach begin="1" end="${bsv.seller_starsavg}">
	            <li><i class="lni lni-star-filled"></i></li>
	         </c:forEach>                  
	         <c:forEach begin="1" end="${5-bsv.seller_starsavg}">
	              <li><i class="lni lni-star"></i></li>
	         </c:forEach>
	              <li><span>${bsv.seller_starsavg}</span></li>
	       </ul>
	       <br>
	       <a style="color:black" href="${pageContext.request.contextPath}/BSellerView.do?seller_idx=${bsv.seller_idx}">${bsv.seller_intro}</a>
	       <br>
	       <input type="button" id="follow" value="+ 팔로우">
	       <a style="color:black" href="${pageContext.request.contextPath}/BSellerView.do?seller_idx=${bsv.seller_idx}">
	       <input type="button" class="more" value="작품 더보기"></a>
      </div>
     </li>
	       	
	     </c:otherwise>
	     </c:choose>
     </c:forEach>
     </ul>
  <%--   
    </div>
   
    <!-- </li> -->
    </c:forEach>
 
 <!-- </ul>   --> 
    
    
           </div>
        </div> --%>
    </section>
    
    
 





<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>
</html>