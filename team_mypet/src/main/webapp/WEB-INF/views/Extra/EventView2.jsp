<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EventView2</title>
<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
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
                        <h1 class="page-title">이벤트</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/home.do"><i class="lni lni-home"></i>Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/EventList">이벤트</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
   <div class="col-12">
<div style="margin-top:54px;margin-bottom:108px; margin-left:25%; max-width: 850px; background:#FFFFFF">
<h4 style="text-align:center">잘 차려진 여름한상!</h4>
<br>
<br>
<p>
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/summerEvent1.jpg">
</p>
<p>
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/summerEvent2.jpg">
</p>
<p>
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/summerEvent3.jpg">
</p>
<p>
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/summerEvent4.jpg">
</p>
<p>
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/summerEvent5.jpg">
</p>
<p>
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/summerEvent6.jpg">
</p>

</div>
</div> 

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>
</html>