<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>판매상세내역</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- css************************************************ -->
	    <jsp:include page="../../include/head.jsp" />  
	<!-- ************************************************ -->

	 <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/sidebar.css" rel="stylesheet">
    <!-- css************************************************ -->
    <jsp:include page="../../include/membermodi.jsp" />  
    
	    
	<style>
		html, body{
			height: 100%
		}
		
		#wrap {
			min-height: 100%;
			position: relative;
			padding-bottom: 60px;
		}
		
		footer {
			position: relative;
			transform:translatY(-100%);
		}
		
	
	</style>

</head>

<body>
<div id="wrap">

	<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->
	
	
	
	
	<section class="product-grids section">
	
		<div class="container">
			<div class="row">
			
				<!-- sidebar -->
				<div class="col-md-3 col-12">
					<div class="product-sidebar">
							<!-- 사이더와 js************************************************ -->
						    <jsp:include page="../../include/seller_sidebar.jsp" />  
					</div>
				</div>
				<!-- /sidebar -->
				
				<!-- content -->
				<div class="col-md-9 col-12">
					<div class="tab-content" id="nav-tabContent">
						<h3 class="pb-1 border-bottom" style="margin-bottom:10px">판매상품 상세내역</h3>
						<form name="frm" action="${pageContext.request.contextPath}/seller_productModif.do?p_idx=${productVo.p_idx}" method="post"  enctype="multipart/form-data">
						
							<table class="table-style-head-left" style="margin-left:0;">
								<tbody>
									<tr>
								 		<th>상품명</th><td><a href="${pageContext.request.contextPath}/productView.do?p_idx=${productVo.p_idx}">${productVo.p_name }</a></td>
								 	</tr>
								 	<tr>
								 		<th>상품번호</th><td>${productVo.p_idx }</td>
								 	</tr>
									<tr>
								 		<th style="width:120px">상태</th>
								 			<td>
								 				<c:choose>
								 					<c:when test="${productVo.p_status ==0}">판매중</c:when>
								 					<c:when test="${productVo.p_status ==1}">품절</c:when>
								 					<c:when test="${productVo.p_status ==2}">삭제</c:when>
								 				</c:choose>
								 			</td>
								 	</tr>
								 	<tr>
								 		<th>분류</th>
								 		<td>
								 			<c:choose>
								 				<c:when test="${productVo.p_category_idx ==1}">강아지 > 개껌</c:when>
								 				<c:when test="${productVo.p_category_idx ==2}">강아지 > 스낵</c:when>
								 				<c:when test="${productVo.p_category_idx ==3}">강아지 > 뼈/육포</c:when>
								 				<c:when test="${productVo.p_category_idx ==4}">강아지 > 스틱</c:when>
								 				<c:when test="${productVo.p_category_idx ==5}">강아지 > 프리미엄</c:when>
								 				<c:when test="${productVo.p_category_idx ==6}">강아지 > 통살</c:when>
								 				<c:when test="${productVo.p_category_idx ==7}">고양이 > 츄르</c:when>
								 				<c:when test="${productVo.p_category_idx ==8}">고양이 > 스낵</c:when>
								 				<c:when test="${productVo.p_category_idx ==9}">고양이 > 캣잎</c:when>
								 				<c:when test="${productVo.p_category_idx ==10}">고양이 > 통살</c:when>
								 				<c:when test="${productVo.p_category_idx ==11}">고양이 > 프리미엄</c:when>
								 				<c:when test="${productVo.p_category_idx ==12}">고양이 > 스틱</c:when>
								 			</c:choose>
								 		</td>
								 	</tr>
								 	
								 	
							
									 <tr>
								 		<th>상품 이미지들</th>
								 		<td>
											<c:forEach var="product_imgVo" items="${productVo.product_imgs}">		 		
								 				<img src="${pageContext.request.contextPath}/resources/product/${product_imgVo.p_sys_filename }" style="width:100px; height:100px;"/>
								 			</c:forEach>
								 		</td>
								 	</tr>
									
							
								 	<tr>
								 		<th>크기</th>
								 		<td>
								 			<c:choose>
								 				<c:when test="${productVo.p_size ==0}">소형</c:when>
								 				<c:when test="${productVo.p_size ==1}">중형</c:when>
								 				<c:when test="${productVo.p_size ==2}">대형</c:when>
								 			</c:choose>
								 		</td>
								 	</tr>
								 	<tr>
								 		<th>재고-주문제작</th><td>${productVo.p_stock }</td>
								 	</tr>
								 	<tr>
								 		<th>재고-제한수량</th><td>${productVo.p_limit_cnt }</td>
								 	</tr>
								 	<tr>
								 		<th>제품상세정보</th><td>${productVo.p_content }</td>
								 	</tr>
								 	<tr>
								 		<th>원가격</th><td><fmt:formatNumber value="${productVo.p_price }" pattern="#,###" />원</td>
								 	</tr>
								 	<tr>
								 		<th>할인률</th><td>${productVo.p_discount }</td>
								 	</tr>
								 	<tr>
								 		<th>할인 적용 가격</th><td><fmt:formatNumber value="${productVo.p_disprice }" pattern="#,###" />원</td>
								 	</tr>
								 	<tr>
								 		<th>적립금</th><td>${productVo.p_point }</td>
								 	</tr>
								 	<tr>
								 		<th>일반 배송비</th><td><fmt:formatNumber value="${productVo.p_dvprice }" pattern="#,###" />원</td>
								 	</tr>
								 	<tr>
								 		<th>추가배송비</th><td><fmt:formatNumber value="${productVo.p_add_dvprice }" pattern="#,###" />원</td>
								 	</tr>
								 	<tr>
								 		<th>무료배송</th><td>같은 판매자 상품 <fmt:formatNumber value="${productVo.p_free_dvprice }" pattern="#,###" />원 이상 구매시 </td>
								 	</tr>
								 	<tr>
								 		<th>택배사</th><td>${productVo.p_dvcompany }</td>
								 	</tr>
								 	<tr>
								 		<th>성분표시</th><td>${productVo.p_ingerdient }</td>
								 	</tr>
								 	<tr>
								 		<th>배송/환불정보</th><td>${productVo.p_cancle_info }</td>
								 	</tr>
								 	<tr>
								 		<th>등록일</th><td><fmt:formatDate value="${productVo.p_wday }" pattern="yyyy-MM-dd"/></td>
								 	</tr>
								 	
								 	<tr>
								 		<th>마지막 수정일</th><td><fmt:formatDate value="${productVo.p_modifyday }" pattern="yyyy-MM-dd"/>	</td>
								 	</tr>
								
								</tbody>
								
									
							</table>
							<br>
							<input type="button"  class="btn btn-light" onclick="history.back(-1)" value="뒤로가기">
							<input type="submit" class="btn btn-light" value="수정">
						</form>
						
						
						
					</div>
				</div>
				<!-- /content -->
				
			</div>
		</div>
	</section>
	
</div>

	
	
	
	
	
	<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
	<!-- ************************************************ -->
	
</body>
</html>        