<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />
    <link rel="stylesheet" href="assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
<title>마이펫 후기작성</title>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>



<!-- css***************************************************** -->
    <jsp:include page="../../include/head.jsp" />  
<!-- **************************************************** -->
 
<style type="text/css">
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
.section {
    padding-top: 20px;
}
input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
#file {
  display: none;
}
.filebtn{
  padding: 9px 13px;
  background-color:#99ccff;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}

#nickbox {
    display: inline-block;
    text-transform: capitalize;
    font-size: 17px;
    font-weight: 600;
    border: none;
    border-radius: 3px;
    padding-top:10px;
    height: 40px;
    width: 20%;
    text-align: right;
    float: right;
    }
</style>
</head>

<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ******************************************************** -->
<section class="trending-product section" style="margin-top: 12px;">
    <div class="container">
    
    <center><h2>구매후기</h2></center>
    <br>
    
    <div class="col-lg-12">
    <div class="single-product" style="border: none;">
    <div class="product-info">
    
    <form class="mb-3" name="myform" id="myform" method="post">
    <table style="width: 100%;">
    <tr>
    <td style="text-align: left; width: 10%"><img src="${pageContext.request.contextPath}/resources/product/${reviewContent.p_sys_filename}" alt="상품 이미지" width="100" height="100">
    <td style="font-size: 30px; color: black; font-weight: bold; width: 50%">${reviewContent.p_name}<br>
    <td style="text-align: right; ">
                           			
    
    <ul class="review">
                               <c:forEach begin="1" end="${reviewContent.avg_reviews_stars}" step="1">
									<li><i class="lni lni-star-filled"></i></li>
								</c:forEach>
								<c:if test="${reviewContent.avg_reviews_stars%5 > 0}">
								   <li><i class="lni lni-star-half"></i></li>
								</c:if>
							   <c:forEach begin="1" end="${5-reviewContent.avg_reviews_stars}" step="1">
							      <li><i class="lni lni-star-empty"></i></li>
							   </c:forEach>	
							</ul>
	</td>
    </tr>
    </table>
    </form>
    
    </div>
    </div>
    
    </div>
<div style="padding-bottom: 10px; height: 200px; border: 1px solid gray; border-radius: 4px; padding-top: 10px;">${reviewContent.review_content}</div>
<span id="nickbox">작성자 : ${reviewContent.review_nick}</span>
<span style="padding-top: 10px; font-size: 17px; font-weight: 600; ">작성일 : <fmt:formatDate value="${reviewContent.review_wday}" pattern="yyyy-MM-dd" /></span><br>
	<center><input type="button" value="돌아가기" onclick="javascript:history.back()" style="background-color: grey; color: white; padding-top:10px; border: none; border-radius: 4px; width: 90px; height: 40px"></center>

	</div>
	</section>
<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
	
</body>
</html>