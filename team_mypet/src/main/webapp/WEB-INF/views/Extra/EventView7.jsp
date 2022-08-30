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
<h4 style="text-align:center;">마이펫 상반기 결산 주말특가! 베스트제품 최대 50% 할인</h4>
<br>
<br>
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/event0000.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/weekend_ev_02.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/weekend_ev_03.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/weekend_ev_04.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/weekend_ev_05.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/weekend_ev_06.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/weekend_ev_07.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/weekend_ev_08.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/weekend_ev_09.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/weekend_ev_10.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/weekend_ev_11.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/ev_11.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/weekend_ev_12(3).jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/weekend_ev_13.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/weekend_ev_14.jpg">
</div>
</div>

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>
</html>