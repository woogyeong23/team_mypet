
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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


.content{
    max-width:719px;
    position: initial;
    z-index: initial;
    margin-top: 0;
    padding-bottom: 32px;
    background: #fff;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
   
    .artist-home .artist-contents {
    background-color: #f5f5f5;
    padding-bottom: 65px;
}

.quick-profile .profile-area {
    display: flex;
    padding: 0 6px;
}

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


button {
    border: 0 none;
    background: transparent;
    cursor: pointer;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    display: inline-block;
    padding: 0;
    margin: 0;
    justify-content: center;
    align-items: center;
    font-weight: bold;
    line-height: 1.5;
}

.following{
background-color: rgb(255, 255, 255);
 min-width: 65%;
  width: 65%;
  height: 36px; 
 font-size: 14px;
  color: rgb(51, 51, 51);
   border: 1px solid rgb(217, 217, 217); 
 border-radius: 4px;
 margin-top: 20px;
}



.follow {
    background-color: rgb(255, 123, 48);
    min-width: 65%;
    width: 65%;
    height: 36px;
    font-size: 14px;
    color: rgb(255, 255, 255);
    border: 1px solid rgb(255, 123, 48);
    border-radius: 4px;
    margin-top: 20px;
}
  button.follow {
    background-color: #ff7b30;
    color: #ffffff;
    width: 65%;
    border: none;
}

  button {
    border-radius: 4px;
    height: 36px;
    font-size: 14px;
    font-weight: bold;
    line-height: 1.5;
    display: flex;
    justify-content: center;
    align-items: center;
}

button.follow {
    border: 1px solid #ff7b30;
}


a, button, .tab, input {
  -webkit-tap-highlight-color: transparent;
}


.bs_review li{
  display: inlin-block;
  float: left;
}
.bs_review li i {
 color: #fecb00;
  font-size: 13px;
}   
.bs_review li span{
  display: inline-block;
  margin-left: 4px;
  color: #888;
  font-size: 13px;
}  
     





</style>

<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#fl").click(function(){
		
		let midx = "${midx}";
		let seller_idx = "${SSV.seller_idx}";
		
		$.ajax({
			type: 'post',
			url: "${pageContext.request.contextPath}/Follow.do",
			data: {"midx" : midx, "seller_idx" : seller_idx},
			
			success: function(data){
				if(data == "Y") {
					alert("해당 작가님을 팔로우 하였습니다.");
					location.reload();
				}else{
					alert("해당 작가 팔로우를 실패 하였습니다.");
				}
			},
			error : function(error){ alert(error); }
	 });
	
	});
	
	
	$("#ufl").click(function(){
		
		let midx = "${midx}";
		let seller_idx = "${SSV.seller_idx}";
		
		$.ajax({
			type: 'post',
			url: "${pageContext.request.contextPath}/Unfollow.do",
			data: {"midx" : midx, "seller_idx" : seller_idx},
			
			success: function(data){
				if(data == "Y") {
					alert("해당 작가님을 언팔로우 하였습니다.");
					location.reload();
				}else{
					alert("언팔로우 하는데 실패 하였습니다.");
				}
			},
			error : function(error){ alert(error); }
	 });
	
	});
	

	
	
	
});
</script>
</head>
<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ************************************************ -->
<div style="display: flex; width:100%; height: 500px;">
   <div style="position:relative; top:40%; left:35%">
     <div style="position:relative; float:left; width:150px; height: 150px; border-radius: 70%; overflow: hidden;">
   <img class="profile" src="${pageContext.request.contextPath}/resources/seller/${SSV.seller_img}">
     </div>
   
     <div class="review-area"style="position:relative; float:left; margin-left:30px;">
     <span style="font-size: 16px;font-weight: bold; color: #333333;">
     ${SSV.m_nick}</span>
     <br>
     
     <p>  ${SSV.m_nick}님의 오픈일 : <fmt:formatDate value="${SSV.seller_openday}" pattern="yyyy-MM-dd"/></p>
 <div style="position:relative">
 <ul class="bs_review">
       <c:forEach begin="1" end="${SSV.seller_starsavg}">
       <li><i class="lni lni-star-filled"></i></li>
       </c:forEach>
       
       <c:forEach begin="1" end="${5-SSV.seller_starsavg}">
       <li><i class="lni lni-star"></i></li>
       </c:forEach>
       
       <li><span>${SSV.seller_starsavg}</span></li>
</ul>
</div>
 <br>
 <br>
     <div style="position:relative; float:left;">
     <p>팔로워</p>
       <span style="font-size: 16px;font-weight: bold; color: #333333; margin-left:20px;">
       ${SSV.seller_followcnt}</span>
       <p></p>
     </div>
   
     
      <div style="position:relative; margin-left:100px;">
      <p>상품 찜</p>
       <span style="font-size: 16px;font-weight: bold; color: #333333; margin-left:20px;">
       ${SSV.seller_followcnt}</span>
      </div>
      <p>${SSV.seller_intro}</p>
        
<c:choose>
   <c:when test="${midx == null}">
<button type="button" class="follow" id=""
style="background-color: rgb(255, 123, 48); min-width: 65%; width: 65%; 
height: 36px; font-size: 14px; color: rgb(255, 255, 255); border: 1px solid rgb(255, 123, 48); 
border-radius: 4px;">
<i class="lni lni-plus"></i>
    팔로우
</button>
   </c:when>
        <c:when test="${followCNT != 0}">
<button type="button" class="following" id="ufl">
<i class="lni lni-checkmark"></i>
    팔로우하는 작가
</button>
        </c:when>
   <c:otherwise>
<button type="button" class="follow" id="fl">
<i class="lni lni-plus"></i>
    팔로우
</button>
   </c:otherwise>
</c:choose>
     </div>
   </div>
</div>

 <div class="artist-home">
 <div style="width:100%; color:#000000">
   <hr> 
   </div>        
<section class="artist-contents">


 <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title" style="background-color:#FFFFFF ">
                        <h2>판매중인 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            <c:choose>
            <c:when test="${BSPCount == 0 }">
             <div class="result">
                    <div class="result_in">
                    <h1 style="color:rgb(181, 181, 181); text-align:center"><i class="lni lni-empty-file"></i></h1>
                               <br>
                   <h5 style="color: rgb(181, 181, 181);">작가(판매자)님이 판매중인 상품이 없습니다.</h5>
                   </div>
                    </div>
            </c:when>
       <c:otherwise>
          <p>총 <span class="result_span">${BSPCount}</span>개의 상품을 판매하고 있어요</p>
              <c:forEach var="hv" items="${BSPList}" end="7">
              <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product" style="border:none;">
                    <c:choose>
                    <c:when test="${hv.p_discount != 0}">
                      <a href="${pageContext.request.contextPath}/productView.do?p_idx=${hv.p_idx}&seller_idx=${hv.seller_idx}">
                        <div class="product-image" style="height: 320px; ">
                            <img style="height:100%" src="${pageContext.request.contextPath}/resources/product/${hv.p_sys_filename}" alt="${hv.p_name}">
									<span class="sale-tag">-${hv.p_discount}%</span>
                        </div>
                        </a>
                    </c:when>
                    <c:otherwise>
                      <a href="${pageContext.request.contextPath}/productView.do?p_idx=${hv.p_idx}&seller_idx=${hv.seller_idx}">
                        <div class="product-image" style="height: 320px; width:245px; ">
                            <img style="height:100%" src="${pageContext.request.contextPath}/resources/product/${hv.p_sys_filename}" alt="${hv.p_name}">
                        </div>
                        </a>
                    </c:otherwise>
                    </c:choose>
                  
                        
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
                                <a href="${pageContext.request.contextPath}/productView.do?p_idx=${hv.p_idx}&seller_idx=${hv.seller_idx}">
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
                                  <a href="${pageContext.request.contextPath}/productView.do?p_idx=${hv.p_idx}&seller_idx=${hv.seller_idx}">
							  <span style="color:rgb(51, 51, 51);"><fmt:formatNumber value="${hv.p_disprice}" pattern="#,###"/>원</span>
								<c:if test="${hv.p_discount != 0}">
									<span class="discount-price"><fmt:formatNumber value="${hv.p_price}" pattern="#,###" />원</span>
							   </c:if>
							   </a>
							</div>
                            
                            <br>
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
            
             <c:choose>
            <c:when test="${BSRCount == 0 }">
              <div class="result">
                    <div class="result_in">
                    <h1 style="color:rgb(181, 181, 181); text-align:center"><i class="lni lni-empty-file"></i></h1>
                               <br>
                   <h5 style="color: rgb(181, 181, 181);">작가(판매자)님의 상품에 대한 리뷰가 없습니다.</h5>
                   </div>
                    </div>
            
            
                </c:when>
       <c:otherwise>
           <p>총 <span class="result_span">${BSRCount}</span>개의 리뷰가 있어요</p>
           
           
         <c:forEach var="rv" items="${aList}" end="7">
                     
                    <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product">
                        <div class="product-image">
                        
                            <img style="height:100%" src="${pageContext.request.contextPath}/resources/product/${rv.p_sys_filename}" alt="${rv.p_name}">
                            <div class="button">
<!--                                 <a href="#" class="btn"><i class="lni lni-cart"></i> Add to Cart</a> -->
                            </div>
                        </div>
                        <div class="product-info">
                            <span class="category">${rv.p_name}</span>
                            <h4 class="title"><a href="${pageContext.request.contextPath}/productView.do?p_idx=${rv.p_idx}&seller_idx=${rv.seller_idx}">${rv.p_name}</a></h4>
                            </div>
                        <div class="product-info" style="background:#f5f5f5; ">
                            <ul class="review">
                            <c:forEach begin="1" end="${rv.review_stars}">
                              <li><i class="lni lni-star-filled"></i></li>
                             </c:forEach>
                             
                             <c:forEach begin="1" end="${5-rv.review_stars}">
                              <li><i class="lni lni-star"></i></li>
                             </c:forEach>
                                <li><span>|  ${rv.review_nick}</span></li>
                            </ul>
                               <p>${rv.review_content}</p>
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

    










</section>
</div>
 


<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />
    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

</html>