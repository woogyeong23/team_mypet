<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기작가 자세히 보기 페이지</title>
<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ************************************************ -->
<div> 작가(판매자 idx) : ${SSV.seller_idx} </div>
<div> 작가 intro : ${SSV.seller_intro}</div>
<div> 작가 시작일 : ${SSV.seller_openday}</div>
<div> 작가 평균 별점 : ${SSV.seller_starsavg}</div>
<div> 작가 매출액 : ${SSV.seller_total}</div>
<div> 작가 상품 찜 갯수? : ${SSV.seller_wishcnt}</div>
<div> 작가 주문 횟수? : ${SSV.seller_ordercnt}</div>
<div> 작가 팔로우수 : ${SSV.seller_followcnt}</div>

<button type="button" class="btn btn-primary">Primary</button>
<button type="button" class="btn btn-primary">Primary</button>
<button type="button" class="btn btn-primary">Primary</button>
<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />
    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>