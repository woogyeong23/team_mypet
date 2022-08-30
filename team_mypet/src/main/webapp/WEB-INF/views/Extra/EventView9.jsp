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
<h4 style="text-align:center;">2022펫스티벌 의류 전 제품 할인 55%</h4>
<br>
<br>
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/ev1/20220620_event_petstival_01.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/ev1/20220620_event_petstival_02.gif">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/ev1/event_02.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/ev1/event_03.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/ev1/event_04.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/ev1/copy-1655369045-event_05.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/ev1/event_06.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/ev1/event_07.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/ev1/20220620_event_petstival_05.jpg">
<img alt="이벤트!!!!!!!!" src="${pageContext.request.contextPath}/resources/Extra/ev1/20220620_event_petstival_06.jpg">
</div>
</div>

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>
</html>