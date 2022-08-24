<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EventView</title>
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
<h4 style="text-align:center;">&nbsp;&nbsp; 2022 마이펫 추석 이벤트 전 제품 할인 60%</h4>
<br>
<br>
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/Event 0823(1).jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/2222222222222222222.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/3333333333333333.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/4444444444444444.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/5555555555555.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/6666666666666666.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/777777777777777777.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/88888888888888888.gif">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/9999999999999.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/1010101010101010.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/tlqdlf.jpg">
</div>
</div>

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>
</html>