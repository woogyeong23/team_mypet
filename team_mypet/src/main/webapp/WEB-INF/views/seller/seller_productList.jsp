<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>판매리스트</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	   
	<!-- css************************************************ -->
	    <jsp:include page="../../include/head.jsp" />  
	<!-- ************************************************ -->

	 <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/sidebar.css" rel="stylesheet">


</head>

<body>
	<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->
	
	
<main class="container">
<aside>
	<!-- 사이더와 js************************************************ -->
    <jsp:include page="../../include/sidebar.jsp" />  
</aside>
<article >
<div class="container px-3 py-4" id="hanging-icons" >
		<div class="row">

	<div class="col-12">
    
    
        <h3 class="pb-1 border-bottom" >최근 주문내역</h3>
                
          
                
                
            </div>        
        
        <table class="table">
						<tr>
						<td >
							<h4 class="title" >구매후기</h4>
						</td>
						
						<!-- 후기정렬 -->
						<td style="align:left; ">
							<select style="border-radius: 5px">
								<option value="" selected>최신순</option>
								<option value="">별점낮은순</option>
								<option value="">별점높은순</option>
							</select>
						</td>
						<td style="align:left;">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="imgCheckbox">
								<label>사진후기만보기</label>
							</div>
						</td>
						<td align="right">
						<div class="review-button">
								<button class="btn" style="width: 100px; height:40px">리뷰작성</button>
						</div>
						</td>
						</tr>
						</table>
</div>
 	</div>		
			
						
</article>
		<!-- 
		<table border="1px" style="width:200px">
		<c:forEach var="productVo" items="${productListMap}">
			<tr>
				<td>${productVo.p_idx}</td><td><a href="${pageContext.request.contextPath}/seller_productDetail.do?p_idx=${productVo.p_idx}">${productVo.p_name}</a></td><td>${productVo.p_content}</td><td>${productVo.p_category_small}</td>
			</tr>
		</c:forEach>
		</table>
		 -->
		
		
 	
</main>
	
	
	
	
	
	<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
	<!-- ************************************************ -->
	
</body>

</html>        