<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
					<!-- 세부검색 -->
					<form class="d-flex" action="${pageContext.request.contextPath}/seller_productList.do" method="get">
					
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
													<option value="searchName" <c:if test="${searchInfo.get('searching') == 'searchName'}">selected</c:if>>상품명</option>
													<option value="searchNum" <c:if test="${searchInfo.get('searching') == 'searchNum'}">selected</c:if>>상품번호</option>
												</select>
											      <input class="form-control me-2" name ="keyword" type="search" value="${searchInfo.get('keyword') }" aria-label="Search" style="height: 40px; margin-top: 5px; margin-top: 0">
											      <button class="btn btn-outline-success" type="submit" style="width:100px; height: 40px; margin-top: 5px; margin-top: 0;" >검색</button>
											    </div>
											  </div>
											</nav>
										</div>
										<!-- /검색창 -->
										<div class="col-12" style="margin-top:10px">
											<!-- 정렬 -->
											<div style="float:right;" >
													<select class="form-select" name = "sorting" id="sorting" >
														<option value="newest"  <c:if test="${searchInfo.get('sorting') == 'newest'}">selected</c:if>>최신순</option>
														<option value="sales"  <c:if test="${searchInfo.get('sorting') == 'sales'}">selected</c:if>>판매량순</option>
														<option value="highPrice" <c:if test="${searchInfo.get('sorting') == 'highPrice'}">selected</c:if>>높은가격순</option>
														<option value="lowPrice" <c:if test="${searchInfo.get('sorting') == 'lowPrice'}">selected</c:if>>낮은가격순</option>
														<option value="reviews" <c:if test="${searchInfo.get('sorting') == 'reviews'}">selected</c:if>>구매후기순</option>
														<option value="stars" <c:if test="${searchInfo.get('sorting') == 'stars'}">selected</c:if>>별점순</option>
													</select>
											</div>
											<!-- /정렬 -->
											<!-- 상태 -->
											<div style=" float:right; margin-right:5px;">
											<select class="form-select" name = "status" id="status" >
													<option value="0" <c:if test="${searchInfo.get('status') == '0'}">selected</c:if>>전체</option>
													<option value="1" <c:if test="${searchInfo.get('status') == '1'}">selected</c:if>>판매중</option>
													<option value="2" <c:if test="${searchInfo.get('status') == '2'}">selected</c:if>>품절</option>
													<option value="3" <c:if test="${searchInfo.get('status') == '3'}">selected</c:if>>삭제</option>
												</select>
											</div>
											<!-- /상태 -->
											<!-- 카테고리 -->
											<div style=" float:right; margin-right:5px;">
											<select class="form-select" name = "category" id="category" >
													<option value="0" <c:if test="${searchInfo.get('category') == '0'}">selected</c:if>>전체</option>
													<option value="00" <c:if test="${searchInfo.get('category') == '00'}">selected</c:if>>강아지</option>
													<option value="1" <c:if test="${searchInfo.get('category') == '1'}">selected</c:if>>강아지-껌</option>
													<option value="2" <c:if test="${searchInfo.get('category') == '2'}">selected</c:if>>강아지-스낵</option>
													<option value="3" <c:if test="${searchInfo.get('category') == '3'}">selected</c:if>>강아지-뼈/육포</option>
													<option value="4" <c:if test="${searchInfo.get('category') == '4'}">selected</c:if>>강아지-스틱</option>
													<option value="5" <c:if test="${searchInfo.get('category') == '5'}">selected</c:if>>강아지-프리미엄</option>
													<option value="6" <c:if test="${searchInfo.get('category') == '6'}">selected</c:if>>강아지-통살</option>
													<option value="01" <c:if test="${searchInfo.get('category') == '01'}">selected</c:if>>고양이</option>
													<option value="7" <c:if test="${searchInfo.get('category') == '7'}">selected</c:if>>고양이-츄르</option>
													<option value="8" <c:if test="${searchInfo.get('category') == '8'}">selected</c:if>>고양이-스낵</option>
													<option value="9" <c:if test="${searchInfo.get('category') == '9'}">selected</c:if>>고양이-캣잎</option>
													<option value="10" <c:if test="${searchInfo.get('category') == '10'}">selected</c:if>>고양이-통살</option>
													<option value="11" <c:if test="${searchInfo.get('category') == '11'}">selected</c:if>>고양이-프리미엄</option>
													<option value="12" <c:if test="${searchInfo.get('category') == '12'}">selected</c:if>>고양이-스틱</option>
												</select>
											</div>
											<!-- /카테고리 -->
											<!-- 검색결과 -->
											<span style="margin-bottom:10px"><h6 style="display: inline-block;">
												<c:if test="${searchInfo.get('searching') == 'searchTotal'}">전체 </c:if>
												<c:if test="${searchInfo.get('searching') == 'searchNum'}">상품번호 </c:if>
												<c:if test="${searchInfo.get('searching') == 'searchName'}">상품명 </c:if>
												 > '${searchInfo.get('keyword')}' </h6> 에 대한 검색결과: ()</span>
											<!-- /검색결과 -->
										</div>
										<!-- 보기방식 -->
										<nav>
											<div class="nav nav-tabs" id="nav-tab" role="tablist">
												<button class="nav-link active" id="nav-grid-tab" data-bs-toggle="tab" data-bs-target="#nav-grid" type="button" role="tab" aria-controls="nav-grid" aria-selected="true"><i class="lni lni-grid-alt"></i></button>
												<button class="nav-link" id="nav-list-tab" data-bs-toggle="tab" data-bs-target="#nav-list" type="button" role="tab" aria-controls="nav-list" aria-selected="false"><i class="lni lni-list"></i></button>
											</div>
										</nav>
										<!-- /보기방식 -->
									</div>
								</div>
						</div>
					</div>
					</form>
					<!-- /세부검색 -->
					
					
					<!-- 검색결과 -->
					<div class="tab-content" id="nav-tabContent">
						<!-- 일반카드형식 뷰 -->
						<div class="tab-pane fade show active" id="nav-grid" role="tabpanel" aria-labelledby="nav-grid-tab">
							<!-- 일반카드 -->
							<div class="row">
								<c:forEach var="productVo" items="${productListMap}">
							
									<div class="col-lg-4 col-md-6 col-12">
										<div class="single-product">
											<div class="product-image">
												<img src="${pageContext.request.contextPath}/resources/assets/images/products/${productVo.p_sys_filename}">
												<c:if test="${productVo.p_discount != 0}"><!-- member_grade: 0(일반회원), 1(관리자), 2(슈퍼관리자) -->
													<span class="sale-tag">-${productVo.p_discount}%</span>
												</c:if>
											</div>
											<div class="product-info">
												<span>
													<c:choose>
														<c:when test="${productVo.p_category_idx == 1}">강아지 > 개껌</c:when>
														<c:when test="${productVo.p_category_idx == 2}">강아지 > 스낵</c:when>
														<c:when test="${productVo.p_category_idx == 3}">강아지 > 뼈/육포</c:when>
														<c:when test="${productVo.p_category_idx == 4}">강아지 > 스틱</c:when>
														<c:when test="${productVo.p_category_idx == 5}">강아지 > 프리미엄</c:when>
														<c:when test="${productVo.p_category_idx == 6}">강아지 > 통살</c:when>
														<c:when test="${productVo.p_category_idx == 7}">고양이 > 츄르</c:when>
														<c:when test="${productVo.p_category_idx == 8}">고양이 > 스낵</c:when>
														<c:when test="${productVo.p_category_idx == 9}">고양이 > 캣잎</c:when>
														<c:when test="${productVo.p_category_idx == 10}">고양이 > 통살</c:when>
														<c:when test="${productVo.p_category_idx == 11}">고양이 > 프리미엄</c:when>
														<c:when test="${productVo.p_category_idx == 12}">고양이 > 스틱</c:when>
													</c:choose>
												</span>
												<span class="category" style="margin-top:5px">
													<c:choose>
														<c:when test="${productVo.p_status == 0}">판매중</c:when>
														<c:when test="${productVo.p_status == 1}">품절</c:when>
														<c:when test="${productVo.p_status == 2}">삭제</c:when>
													</c:choose>
												</span>
												<h4 class="title">
													<a href="product-grids.html">${productVo.p_name}</a>
												</h4>
												<ul class="review">
												<c:forEach var="cnt" begin="1" end="${productVo.avg_reviews_stars}" step="1">
													<li><i class="lni lni-star-filled"></i></li>
												</c:forEach>
												<c:if test="${productVo.avg_reviews_stars%5 > 0}">
													<li><i class="lni lni-star-half"></i></li>
												</c:if>
												<c:forEach var="cnt" begin="1" end="${5-productVo.avg_reviews_stars}" step="1">
													<li><i class="lni lni-star-empty"></i></li>
												</c:forEach>	
													<li>
														<span>
															<c:if test="${productVo.cnt_reviews != 0}">
																<fmt:formatNumber value="${productVo.avg_reviews_stars}" pattern=".0"/>
															</c:if>
																Review(${productVo.cnt_reviews})
														</span>
													</li>
												</ul>
												<div class="price">
													<span><fmt:formatNumber value="${productVo.p_disprice}" pattern="#,###" />원</span>
													<c:if test="${productVo.p_discount != 0}">
														<span class="discount-price"><fmt:formatNumber value="${productVo.p_price}" pattern="#,###" />원</span>
													</c:if>
												</div>
												<br>
												<span class="category">최초 등록일: 
													<fmt:formatDate value="${productVo.p_wday}" pattern="yyyy-MM-dd"/>												</span>
												<span class="category">마지막 수정일: <fmt:formatDate value="${productVo.p_modifyday}" pattern="yyyy-MM-dd"/></span>
											</div>
										</div>
									</div>
		
								</c:forEach>
							</div>		
							<!-- /일반카드 -->
							<!-- 일반카드 페이징 -->
							<div class="row">
								<div class="col-12">
									<div class="pagination left">
										<ul class="pagination-list">
											<li><a href="javascript:void(0)">1</a></li>
											<li class="active"><a href="javascript:void(0)">2</a></li>
											<li><a href="javascript:void(0)">3</a></li>
											<li><a href="javascript:void(0)">4</a></li>
											<li><a href="javascript:void(0)"><i class="lni lni-chevron-right"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- 일반카드 페이징 -->
						</div>
						<!-- /일반카드형식 뷰 -->
						<!-- 일자카드형식 뷰 -->
						<div class="tab-pane fade" id="nav-list" role="tabpanel" aria-labelledby="nav-list-tab">
							<!-- 일자카드 -->
							<div class="row">
								<c:forEach var="productVo" items="${productListMap}">
									<div class="col-lg-12 col-md-12 col-12">
									
										<div class="single-product">
											<div class="row align-items-center">
												<div class="col-lg-4 col-md-4 col-12">
													<div class="product-image">
														<img src="${pageContext.request.contextPath}/resources/assets/images/products/${productVo.p_sys_filename}">
														<c:if test="${productVo.p_discount != 0}"><!-- member_grade: 0(일반회원), 1(관리자), 2(슈퍼관리자) -->
															<span class="sale-tag">-${productVo.p_discount}%</span>
														</c:if>
											</div>
												</div>
												<div class="col-lg-8 col-md-8 col-12">
													<div class="product-info">
														<span>
															<c:choose>
																<c:when test="${productVo.p_category_idx == 1}">강아지 > 개껌</c:when>
																<c:when test="${productVo.p_category_idx == 2}">강아지 > 스낵</c:when>
																<c:when test="${productVo.p_category_idx == 3}">강아지 > 뼈/육포</c:when>
																<c:when test="${productVo.p_category_idx == 4}">강아지 > 스틱</c:when>
																<c:when test="${productVo.p_category_idx == 5}">강아지 > 프리미엄</c:when>
																<c:when test="${productVo.p_category_idx == 6}">강아지 > 통살</c:when>
																<c:when test="${productVo.p_category_idx == 7}">고양이 > 츄르</c:when>
																<c:when test="${productVo.p_category_idx == 8}">고양이 > 스낵</c:when>
																<c:when test="${productVo.p_category_idx == 9}">고양이 > 캣잎</c:when>
																<c:when test="${productVo.p_category_idx == 10}">고양이 > 통살</c:when>
																<c:when test="${productVo.p_category_idx == 11}">고양이 > 프리미엄</c:when>
																<c:when test="${productVo.p_category_idx == 12}">고양이 > 스틱</c:when>
															</c:choose>
														</span>
														<span class="category" style="margin-top:5px">
															<c:choose>
																<c:when test="${productVo.p_status == 0}">판매중</c:when>
																<c:when test="${productVo.p_status == 1}">품절</c:when>
																<c:when test="${productVo.p_status == 2}">삭제</c:when>
															</c:choose>
														</span>
														<h4 class="title">
															<a href="product-grids.html">${productVo.p_name}</a>
														</h4>
														<ul class="review">
														<c:forEach var="cnt" begin="1" end="${productVo.avg_reviews_stars}" step="1">
															<li><i class="lni lni-star-filled"></i></li>
														</c:forEach>
														<c:if test="${productVo.avg_reviews_stars%5 > 0}">
															<li><i class="lni lni-star-half"></i></li>
														</c:if>
														<c:forEach var="cnt" begin="1" end="${5-productVo.avg_reviews_stars}" step="1">
															<li><i class="lni lni-star-empty"></i></li>
														</c:forEach>	
															<li>
																<span>
																	<c:if test="${productVo.cnt_reviews != 0}">
																		<fmt:formatNumber value="${productVo.avg_reviews_stars}" pattern=".0"/>
																	</c:if>
																		Review(${productVo.cnt_reviews})
																</span>
															</li>
														</ul>
														<div class="price">
															<span><fmt:formatNumber value="${productVo.p_price}" pattern="#,###" />원</span>
															<c:if test="${productVo.p_disprice != 0}">
																<span class="discount-price"><fmt:formatNumber value="${productVo.p_disprice}" pattern="#,###" />원</span>
															</c:if>
														</div>
														<br>
														<span class="category">최초 등록일: 
															<fmt:formatDate value="${productVo.p_wday}" pattern="yyyy-MM-dd"/>												</span>
														<span class="category">마지막 수정일: <fmt:formatDate value="${productVo.p_modifyday}" pattern="yyyy-MM-dd"/></span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<!-- /일자카드 -->
							<!-- 일자카드 페이징 -->
							<div class="row">
								<div class="col-12">
								
									<div class="pagination left">
										<ul class="pagination-list">
											<li><a href="javascript:void(0)">1</a></li>
											<li class="active"><a href="javascript:void(0)">2</a></li>
											<li><a href="javascript:void(0)">3</a></li>
											<li><a href="javascript:void(0)">4</a></li>
											<li><a href="javascript:void(0)"><i class="lni lni-chevron-right"></i></a></li>
										</ul>
									</div>
								
								</div>
							</div>
							<!-- /일자카드 페이징 -->
						</div>	
						<!-- /일자카드형식 뷰 -->
					</div>
					<!-- /검색결과 -->







			
					
					
					<!-- 검색결과 -->
				</div>
				<!-- content -->
			</div>
		</div>
	</section>
	
</div>

	
	
	
	
	
	<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
	<!-- ************************************************ -->
	
</body>
</html>        