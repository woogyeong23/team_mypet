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


.reviewbox {
  display: flex;
  justify-content: space-between;
}
.reviewb {
 display: flex;
  justify-content: space-between;
}
.v-line {
  border-left : thin solid #d3d3d3;
  height : 175px;
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
				<div class="col-lg-3 col-12">

					<div class="product-sidebar">

							<!-- 사이더와 js************************************************ -->
						    <jsp:include page="../../include/seller_sidebar.jsp" />  




					</div>

				</div>
				<!-- content -->
				<div class="col-lg-9 col-12">
					<div class="product-grids-head">
						<div class="product-grid-topbar">
							<div class="row align-items-center">
									<div class="row">
										<!-- 검색창 -->
										<div class="col-12">
											<nav>
											  <div class="container-fluid">
											    <form class="d-flex" role="search">
											    <select class="form-select" id="searching"  style="height: 40px; width: 130px; margin-right: 5px; margin-top: 0">
													<option>전체</option>
													<option>상품명</option>
													<option>상품번호</option>
												</select>
											      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="height: 40px; margin-top: 5px; margin-top: 0">
											      <button class="btn btn-outline-success" type="submit" style="height: 40px; margin-top: 5px; margin-top: 0"; >Search</button>
											    </form>
											  </div>
											</nav>
										</div>
										<!-- /검색창 -->
										<div class="col-12" style="margin-top:10px">
											<!-- 정렬 -->
											<div style="float:right;" >
													<select class="form-select" id="sorting" >
														<option>최신순</option>
														<option>판매량순</option>
														<option>높은가격순</option>
														<option>낮은가격순</option>
														<option>구매후기순</option>
														<option>별점순</option>
													</select>
											</div>
											<!-- /정렬 -->
											<!-- 상태 -->
											<div style=" float:right; margin-right:5px;">
											<select class="form-select" id="status" >
													<option>전체</option>
													<option>판매중</option>
													<option>품절</option>
													<option>삭제</option>
												</select>
											</div>
											<!-- /상태 -->
											<!-- 카테고리 -->
											<div style=" float:right; margin-right:5px;">
											<select class="form-select" id="category" >
													<option>전체</option>
													<option>강아지</option>
													<option>강아지-껌</option>
													<option>강아지-스낵</option>
													<option>강아지-뼈/육포</option>
													<option>강아지-스틱</option>
													<option>강아지-프리미엄</option>
													<option>강아지-통살</option>
													<option>고양이</option>
													<option>고양이-츄르</option>
													<option>고양이-스낵</option>
													<option>고양이-캣잎</option>
													<option>고양이-프리미엄</option>
													<option>고양이-스틱</option>
												</select>
											</div>
											<!-- /카테고리 -->
										
											<span style="margin-bottom:10px">Showing: 1 - 12 items</span>
										</div>
										<nav>
											<div class="nav nav-tabs" id="nav-tab" role="tablist">
												<button class="nav-link active" id="nav-grid-tab" data-bs-toggle="tab" data-bs-target="#nav-grid" type="button" role="tab" aria-controls="nav-grid" aria-selected="true"><i class="lni lni-grid-alt"></i></button>
												<button class="nav-link" id="nav-list-tab" data-bs-toggle="tab" data-bs-target="#nav-list" type="button" role="tab" aria-controls="nav-list" aria-selected="false"><i class="lni lni-list"></i></button>
											</div>
										</nav>
										
									</div>
								</div>
							
						</div>
					</div>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-grid" role="tabpanel" aria-labelledby="nav-grid-tab">
							<div class="row">
								<div class="col-lg-4 col-md-6 col-12">
	
									<div class="single-product">
										<div class="product-image">
											<img src="assets/images/products/product-1.jpg" alt="#">
												<div class="button">
													<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
												</div>
										
										</div>
										<div class="product-info">
										<span class="category">Watches</span>
										<h4 class="title">
										<a href="product-grids.html">Xiaomi Mi Band 5</a>
										</h4>
										<ul class="review">
										<li><i class="lni lni-star-filled"></i></li>
										<li><i class="lni lni-star-filled"></i></li>
										<li><i class="lni lni-star-filled"></i></li>
										<li><i class="lni lni-star-filled"></i></li>
										<li><i class="lni lni-star"></i></li>
										<li><span>4.0 Review(s)</span></li>
										</ul>
											<div class="price">
											<span>$199.00</span>
											
											</div>
										</div>
									</div>
	
	
	|
								</div>
								<div class="col-lg-4 col-md-6 col-12">
	
									<div class="single-product">
										<div class="product-image">
											<img src="assets/images/products/product-2.jpg" alt="#">
											<span class="sale-tag">-25%</span>
												<div class="button">
													<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
												</div>
										</div>
										<div class="product-info">
											<span class="category">Speaker</span>
											<h4 class="title">
											<a href="product-grids.html">Bluetooth Speaker</a>
											</h4>
											<ul class="review">
											<li><i class="lni lni-star-filled"></i></li>
											<li><i class="lni lni-star-filled"></i></li>
											<li><i class="lni lni-star-filled"></i></li>
											<li><i class="lni lni-star-filled"></i></li>
											<li><i class="lni lni-star-filled"></i></li>
											<li><span>5.0 Review(s)</span></li>
											</ul>
											<div class="price">
												<span>$275.00</span>
												<span class="discount-price">$300.00</span>
											</div>
										</div>
									</div>
										
								</div>
<div class="col-lg-4 col-md-6 col-12">

<div class="single-product">
<div class="product-image">
<img src="assets/images/products/product-3.jpg" alt="#">
<div class="button">
<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
</div>
</div>
<div class="product-info">
<span class="category">Camera</span>
<h4 class="title">
<a href="product-grids.html">WiFi Security Camera</a>
</h4>
<ul class="review">
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><span>5.0 Review(s)</span></li>
</ul>
<div class="price">
<span>$399.00</span>
</div>
</div>
</div>

</div>
<div class="col-lg-4 col-md-6 col-12">

<div class="single-product">
<div class="product-image">
<img src="assets/images/products/product-4.jpg" alt="#">
<span class="new-tag">New</span>
<div class="button">
<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
</div>
</div>
<div class="product-info">
<span class="category">Phones</span>
<h4 class="title">
<a href="product-grids.html">iphone 6x plus</a>
</h4>
<ul class="review">
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
 <li><span>5.0 Review(s)</span></li>
</ul>
<div class="price">
<span>$400.00</span>
</div>
</div>
</div>

</div>
<div class="col-lg-4 col-md-6 col-12">

<div class="single-product">
<div class="product-image">
<img src="assets/images/products/product-5.jpg" alt="#">
<div class="button">
<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
</div>
</div>
<div class="product-info">
<span class="category">Headphones</span>
<h4 class="title">
<a href="product-grids.html">Wireless Headphones</a>
</h4>
<ul class="review">
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><span>5.0 Review(s)</span></li>
</ul>
<div class="price">
<span>$350.00</span>
</div>
</div>
</div>

</div>
<div class="col-lg-4 col-md-6 col-12">

<div class="single-product">
<div class="product-image">
<img src="assets/images/products/product-6.jpg" alt="#">
<div class="button">
<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
</div>
</div>
<div class="product-info">
<span class="category">Speaker</span>
<h4 class="title">
<a href="product-grids.html">Mini Bluetooth Speaker</a>
</h4>
<ul class="review">
<li><i class="lni lni-star-filled"></i></li>
 <li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star"></i></li>
<li><span>4.0 Review(s)</span></li>
</ul>
<div class="price">
<span>$70.00</span>
</div>
</div>
</div>

</div>
<div class="col-lg-4 col-md-6 col-12">

<div class="single-product">
<div class="product-image">
<img src="assets/images/products/product-7.jpg" alt="#">
<span class="sale-tag">-50%</span>
<div class="button">
<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
</div>
</div>
<div class="product-info">
<span class="category">Headphones</span>
<h4 class="title">
<a href="product-grids.html">Wireless Headphones</a>
</h4>
<ul class="review">
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star"></i></li>
<li><span>4.0 Review(s)</span></li>
</ul>
<div class="price">
<span>$100.00</span>
<span class="discount-price">$200.00</span>
</div>
</div>
</div>

</div>
<div class="col-lg-4 col-md-6 col-12">

<div class="single-product">
<div class="product-image">
<img src="assets/images/products/product-8.jpg" alt="#">
<div class="button">
<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
</div>
 </div>
<div class="product-info">
<span class="category">Laptop</span>
<h4 class="title">
<a href="product-grids.html">Apple MacBook Air</a>
</h4>
<ul class="review">
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><span>5.0 Review(s)</span></li>
</ul>
<div class="price">
<span>$899.00</span>
</div>
</div>
</div>

</div>
<div class="col-lg-4 col-md-6 col-12">

<div class="single-product">
<div class="product-image">
<img src="assets/images/products/product-2.jpg" alt="#">
<span class="sale-tag">-25%</span>
<div class="button">
<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
</div>
</div>
<div class="product-info">
<span class="category">Speaker</span>
<h4 class="title">
<a href="product-grids.html">Bluetooth Speaker</a>
</h4>
<ul class="review">
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><span>5.0 Review(s)</span></li>
</ul>
<div class="price">
<span>$275.00</span>
<span class="discount-price">$300.00</span>
</div>
</div>
</div>

</div>
</div>
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
</div>
<div class="tab-pane fade" id="nav-list" role="tabpanel" aria-labelledby="nav-list-tab">
<div class="row">
<div class="col-lg-12 col-md-12 col-12">

<div class="single-product">
<div class="row align-items-center">
<div class="col-lg-4 col-md-4 col-12">
<div class="product-image">
<img src="assets/images/products/product-1.jpg" alt="#">
<div class="button">
<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to
Cart</a>
</div>
</div>
</div>
<div class="col-lg-8 col-md-8 col-12">
<div class="product-info">
<span class="category">Watches</span>
<h4 class="title">
<a href="product-grids.html">Xiaomi Mi Band 5</a>
</h4>
<ul class="review">
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star"></i></li>
<li><span>4.0 Review(s)</span></li>
</ul>
<div class="price">
<span>$199.00</span>
</div>
</div>
</div>
</div>
</div>

</div>
<div class="col-lg-12 col-md-12 col-12">

<div class="single-product">
<div class="row align-items-center">
<div class="col-lg-4 col-md-4 col-12">
<div class="product-image">
<img src="assets/images/products/product-2.jpg" alt="#">
<span class="sale-tag">-25%</span>
<div class="button">
<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to
Cart</a>
</div>
</div>
</div>
<div class="col-lg-8 col-md-8 col-12">
<div class="product-info">
<span class="category">Speaker</span>
<h4 class="title">
<a href="product-grids.html">Big Power Sound Speaker</a>
</h4>
<ul class="review">
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><span>5.0 Review(s)</span></li>
</ul>
<div class="price">
<span>$275.00</span>
<span class="discount-price">$300.00</span>
</div>
</div>
</div>
</div>
</div>

</div>
<div class="col-lg-12 col-md-12 col-12">

<div class="single-product">
<div class="row align-items-center">
<div class="col-lg-4 col-md-4 col-12">
<div class="product-image">
<img src="assets/images/products/product-3.jpg" alt="#">
<div class="button">
<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to
Cart</a>
 </div>
</div>
</div>
<div class="col-lg-8 col-md-8 col-12">
<div class="product-info">
<span class="category">Camera</span>
<h4 class="title">
<a href="product-grids.html">WiFi Security Camera</a>
</h4>
<ul class="review">
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><span>5.0 Review(s)</span></li>
</ul>
<div class="price">
<span>$399.00</span>
</div>
</div>
</div>
</div>
</div>

</div>
<div class="col-lg-12 col-md-12 col-12">

<div class="single-product">
<div class="row align-items-center">
<div class="col-lg-4 col-md-4 col-12">
<div class="product-image">
<img src="assets/images/products/product-4.jpg" alt="#">
<span class="new-tag">New</span>
<div class="button">
<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to
Cart</a>
</div>
</div>
</div>
<div class="col-lg-8 col-md-8 col-12">
<div class="product-info">
<span class="category">Phones</span>
<h4 class="title">
<a href="product-grids.html">iphone 6x plus</a>
</h4>
<ul class="review">
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
 <li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><span>5.0 Review(s)</span></li>
</ul>
<div class="price">
<span>$400.00</span>
</div>
</div>
</div>
</div>
</div>

</div>
<div class="col-lg-12 col-md-12 col-12">

<div class="single-product">
<div class="row align-items-center">
<div class="col-lg-4 col-md-4 col-12">
<div class="product-image">
<img src="assets/images/products/product-7.jpg" alt="#">
<span class="sale-tag">-50%</span>
<div class="button">
<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to
Cart</a>
</div>
</div>
</div>
<div class="col-lg-8 col-md-8 col-12">
<div class="product-info">
<span class="category">Headphones</span>
<h4 class="title">
<a href="product-grids.html">PX7 Wireless Headphones</a>
</h4>
<ul class="review">
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star-filled"></i></li>
<li><i class="lni lni-star"></i></li>
<li><span>4.0 Review(s)</span></li>
</ul>
<div class="price">
<span>$100.00</span>
<span class="discount-price">$200.00</span>
</div>
</div>
</div>
</div>
</div>

</div>
</div>
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
</div>
</div>
</div>
</div>
</div>
</div>
</section>
	
	
	
	
	
	
	<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
	<!-- ************************************************ -->
	
</body>
</html>        