<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>주문리스트</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- css************************************************ -->
	    <jsp:include page="../../include/head.jsp" />  
	<!-- ************************************************ -->

	 <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/sidebar.css" rel="stylesheet">
    
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
					<h1 class="pb-1 border-bottom" style="margin-bottom:10px">주문내역</h1>
					
					<!-- 세부검색 -->
					<form class="d-flex" action="${pageContext.request.contextPath}/seller_ordersList.do" method="post">
					
					<div class="product-grids-head">
						<div class="product-grid-topbar">
							<div class="row align-items-center">
									<div class="row">
										<!-- 검색창 -->
										<div class="col-12">
											<nav>
											  <div class="container-fluid">
											    <div class="d-flex" >
											    <select class="form-select" name="searching" id="searching"  style="height: 40px; width: 130px; margin-right: 5px; margin-top: 0">
													<option value="searchTotal" <c:if test="${searchInfo.get('searching') == 'searchTotal'}">selected</c:if>>전체</option>
													<option value="searchName" <c:if test="${searchInfo.get('searching') == 'searchName'}">selected</c:if>>이름</option>
													<option value="searchEmail" <c:if test="${searchInfo.get('searching') == 'searchEmail'}">selected</c:if>>이메일</option>
												</select>
											      <input class="form-control me-2" name ="keyword" type="search" value="${searchInfo.get('keyword') }" aria-label="Search" style="height: 40px; margin-top: 5px; margin-top: 0">
											      <button class="btn btn-outline-success" type="submit" style="width:100px; height: 40px; margin-top: 5px; margin-top: 0;" >검색</button>
											    </div>
											  </div>
											</nav>
										</div>
										<!-- /검색창 -->
										<div class="col-12" style="margin-top:10px">
										
											<!-- 상태 -->
											<div style=" float:right; margin-right:5px; ">
											<select class="form-select" name = "status" id="status" >
													<option value="00" <c:if test="${searchInfo.get('status') == '00'}">selected</c:if>>전체</option>
													<option value="0" <c:if test="${searchInfo.get('status') == '0'}">selected</c:if>>입금대기</option>
													<option value="1" <c:if test="${searchInfo.get('status') == '1'}">selected</c:if>>결제완료</option>
													<option value="2" <c:if test="${searchInfo.get('status') == '2'}">selected</c:if>>준비중</option>
													<option value="3" <c:if test="${searchInfo.get('status') == '3'}">selected</c:if>>배송중</option>
													<option value="4" <c:if test="${searchInfo.get('status') == '4'}">selected</c:if>>배송완료</option>
													<option value="5" <c:if test="${searchInfo.get('status') == '5'}">selected</c:if>>구매확정</option>
													<option value="6" <c:if test="${searchInfo.get('status') == '6'}">selected</c:if>>부분배송</option>
												</select>
											</div>
											<!-- /상태 -->
											<!-- 상품별 -->
											<div style=" float:right; margin-right:5px;">
											<select class="form-select" name = "product" id="product" >
												<option value="00" <c:if test="${searchInfo.get('product') == '00'}">selected</c:if>>전체</option>
												<c:forEach var="productVo" items="${productVoList}">
													<option value="${productVo.p_idx}" <c:if test="${searchInfo.get('product') eq productVo.p_idx}"  >selected</c:if>>${productVo.p_name}</option>
												</c:forEach>
												
												</select>
											</div>
											<!-- /상품별 -->
											<!-- 검색결과 -->
											<span style="margin-bottom:10px"><h6 style="display: inline-block;">
												<c:if test="${searchInfo.get('searching') == 'searchTotal'}">전체 </c:if>
												<c:if test="${searchInfo.get('searching') == 'searchName'}">상품명 </c:if>
												<c:if test="${searchInfo.get('searching') == 'searchEmail'}">상품번호 </c:if>
												
												 > '${searchInfo.get('keyword')}' </h6> 에 대한 검색결과: ()</span>
											<!-- /검색결과 -->
										</div>
										
									</div>
								</div>
						</div>
					</div>
					</form>
					<!-- /세부검색 -->
					<div class="my-items">


					
					<!-- 검색결과 -->
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">주문번호</th>
					      <th scope="col">상품명</th>
					      <th scope="col">고객 이메일/이름</th>
					      <th scope="col">상태</th>
					      <th scope="col">가격</th>
					      <th scope="col">주문날짜</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider">
					    <c:forEach var="OrdersVo" items="${ordersVoList}">
							<tr>
						      <!-- <th scope="row">1</th> -->
						      <td><a href="${pageContext.request.contextPath}/seller_ordersDetail.do?orders_idx=${OrdersVo.orders_idx}&midx=${OrdersVo.midx}">${OrdersVo.orders_idx}</a></td>
						      <td>
						      	<c:forEach var="DetailVo" items="${OrdersVo.details}">
									${DetailVo.p_name}.
								</c:forEach>
						      </td>
						      <td>${OrdersVo.m_name}/${OrdersVo.m_id}</td>
						      <td>
						     	 <c:choose>
						     	 	<c:when test="${OrdersVo.orders_status == 0}">입금대기</c:when>
									<c:when test="${OrdersVo.orders_status == 1}">결제완료</c:when>
									<c:when test="${OrdersVo.orders_status == 2}">준비중</c:when>
									<c:when test="${OrdersVo.orders_status == 3}">배송중</c:when>
									<c:when test="${OrdersVo.orders_status == 4}">배송완료</c:when>
									<c:when test="${OrdersVo.orders_status == 5}">구매확정</c:when>
									<c:when test="${OrdersVo.orders_status == 6}">부분배송</c:when>
								</c:choose>
						      </td>
						      <td><fmt:formatNumber value="${OrdersVo.bundleprice }" pattern="#,###" />원</td>
						      <td>${OrdersVo.orders_day}</td>
						    </tr>
						</c:forEach>
					    
					  </tbody>
					</table>
					<!-- /검색결과 -->







			
					
					</div>
				</div>
			</div>
		</div>
	</section>
	
</div>

	
	
	
	
	
	<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
	<!-- ************************************************ -->
	
</body>
</html>        