<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 리스트</title>
<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
<link rel="stylesheet" href="resources/Community/CBList.css">

<style type="text/css">
.box {
    width: 34px;
    height: 34px; 
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

#dd{
    display: flex;
    justify-content: space-between;
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
                        <h1 class="page-title">커뮤니티</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/home.do"><i class="lni lni-home"></i>Home</a></li>
                        <li><a href="#">커뮤니티</a></li>
<!--                         <li>Single Product</li> -->
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
  
    <div style="margin-top:70px; margin-left:17%; width:30%; background-color:#e8f5e9; font-size:">
    <ul>
    <li style="display: inline-block;"><a href=""><span>조회수순</span></a></li>
    <li style="display: inline-block;"><a href=""><span>최신순</span></a></li>
    <li style="display: inline-block;"><a href=""><span>좋아요순</span></a></li>
    <li style="display: inline-block;"><a href=""><span>댓글순</span></a> </li>
    </ul>
    </div>
    <div style="width:100%"><hr></div>
 

 <!-- Start Trending Product Area -->
    <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>커뮤니티</h2>
                        <p>강의실 컴퓨터는 수시로 포맷을 진행하고 있습니다. 개인자료는 꼭 USB 또는 e-mail로 백업 해주세요.</p>
                    </div>
                </div>
            </div>
            <div class="row">
            
            <c:forEach var="cv" items="${commuList}">
                     
                    <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                   
                    <div class="single-product">
                  <div id="dd" >
                <div>
                   <div class="box">
    <img class="profile" src="${pageContext.request.contextPath}/resources/Extra/img/${cv.m_profile}">
                   </div>
                     <div style="float:left">
                   <span class="category" style="color:black">${cv.cm_writer}</span>
                   <br>
                   <span class="category">${cv.cm_wday}</span>       
                              </div>
                              </div>
                                 <div style="margin-right:10px; margin-top:5px;">
                                    View <span>${cv.cm_view_cnt}</span>
                                 </div>
                              </div>
                              
                       
                        <div class="product-image" style="height: 320px;">
                        <img style="height:100%" src="${pageContext.request.contextPath}/resources/Community/upload/${cv.cm_img}" alt="커뮤니티 이미지">
                        </div>
                        
                        <div class="product-info">
                            <h4 class="title" style="overflow: hidden;">
                                <a href="${pageContext.request.contextPath}/CBView.do?cm_idx=${cv.cm_idx}">${cv.cm_subject}</a>
                            </h4>
                        </div>
                        <div style="width:100%; position:relative">
                             <hr>
                        </div>
                        
                        <div style="display:flex; height: 30px;">
                        
                       
                       
                        <div style="margin-left:10px; position:relative; float:left">
                        
                        <i class="lni lni-heart"></i> 좋아요<span>${cv.community_like_cnt}</span>
                        </div>
                        
                        <div style="margin-left:20px; position:relative">
                        <i class="lni lni-bubble"></i> 댓글 <span>${cv.cm_comment_cnt}</span>
                        </div>
                        
                        
                      </div>
                        
                    </div>
                    <!-- End Single Product -->
                </div>
              </c:forEach>      
         </div>
        </div>
    </section>
  




  
 <c:if test="${m_id != null}">
 <div id="side_menu"><a href="${pageContext.request.contextPath}/CBInsert.do"><button type="button" class="btn btn-success" color="#aeddff"><i class="lni lni-pencil"></i></button></a></div>
</c:if>  

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>
</html>