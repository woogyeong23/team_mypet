<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event List</title>
<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
<style>
.outer ul li{
 margin: 30px 0px;
 font-size: 18px; 
 line-height: normal; 
}



 details summary::marker{
  font-size:0;
 }
 
 .side_nav nav ul li{
  	display: block;
    font-size: 18px;
    color: rgba(0,0,0,0.56);
    margin: 15px 0px;
 } 
 
 .side_nav nav ul li a{
 text-decoration: none;   
 color: rgba(0,0,0,0.56);
 }
 
  .side_nav nav{
    display: block;
    float: left;
    width: 150px;
    padding-left: 10px;
  }
  
  .cur{
  color:rgb(237,73,86);
  font-weight: bold;
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
                        <h1 class="page-title">고객센터</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/home.do"><i class="lni lni-home"></i>Home</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
       <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                
               
                    <div class="section-title">

                        <h2><span class="cur">EVENT</span></h2>
                     
                    </div>
                    
                    <div style="display:flex; position:relative">
                  
                    <div class="col-lg-3 col-md-2 d-xs-none">
                        <div class="side_nav"style="float:left;">
                   <nav>
                   <b style=" padding: 5px 0px 35px 1px; font-weight: 500; font-size: 28px; line-height: 35px;
    color: rgb(51, 51, 51);
    letter-spacing: -1px;"> 고객센터 </b>
                       <ul>
                   		    <li><a href="${pageContext.request.contextPath}/Notice">공지사항</a></li>
                   		    <li><a href="#"><span class="cur">이벤트</span></a></li> 
                   			<li><a href="${pageContext.request.contextPath}/MostQuery">자주하는 질문</a></li> 
                   			<li><a href="#">1:1문의</a></li>
                   			<li><a href="#">입점문의</a></li>  
                       </ul>
                    </nav>
                    </div>
                     </div>
                    
                                
                    
                    
                    
             <div class="col-lg-8 col-md-8 col-12">
               <div style="width:100%; float:right;">
                      
                        <p style="color:#000000"><a href="${pageContext.request.contextPath}/EventList" style="color:#BBBBBB;"><b>진행중인 이벤트</b></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" style="font-weight:700; color:#ffc303;">종료된 이벤트</a></p>

                    </div>     
      <div class="outer">
      <ul style="margin-top:40px;">
			<li style="width:100%;">
			<a href="${pageContext.request.contextPath}/EventView6">
				<img style="border-radius: 10px;" alt="이미지 사진" src="${pageContext.request.contextPath}/resources/Extra/img/Event (end 1).jpg">
			</a>
			</li>
			
		
			<li style="width:100%">
			<a href="${pageContext.request.contextPath}/EventView7">
				<img style="border-radius: 10px;" alt="이벤트 사진" src="${pageContext.request.contextPath}/resources/Extra/img/Event (end 3.jpg">
			</a>
			</li>
			
		    <li style="width:100%">
			<a href="${pageContext.request.contextPath}/EventView9">
				<img style="border-radius: 10px;" alt="이벤트 사진" src="${pageContext.request.contextPath}/resources/Extra/img/Event (end 5).jpg">
			</a>
			</li>
			
			  <li style="width:100%; border-radius: 10px;">
			<a href="${pageContext.request.contextPath}/EventView10">
				<img style="border-radius: 10px;" alt="이벤트 사진" src="${pageContext.request.contextPath}/resources/Extra/img/f471d056ccc1064981416c51e3eeaa96.jpg">
			</a>
			</li>
			
			
		    <li style="width:100%">
			<a href="${pageContext.request.contextPath}/EventView8">
				<img style="border-radius: 10px;" alt="이벤트 사진" src="${pageContext.request.contextPath}/resources/Extra/img/5252525252525.jpg">
			</a>
			</li>
				
        </ul>
       </div>  
                </div>

                </div>
            </div>
            </div>
            </section>
            <div class="col-lg-1 col-md-2 d-xs-none"></div>
 

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />
    
</body>
</html>