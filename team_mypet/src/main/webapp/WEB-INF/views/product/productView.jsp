<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />

    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />

<title>제품상세페이지</title>

<style>

.chat-button {
  background-color:#fae100;
  border-radius: 4px 4px 4px 4px;
  overflow: hidden;
  width: 50%;
  height: 40px;
  padding: 0;
  color:white;
  border-color: blue;
  border: 0;
  font-weight: bold;
  font-size: 18px;
}

.seller {
	color: #99ccff;
}

.order-button .btn {
  display: inline-block;
  text-transform: capitalize;
  font-size: 14px;
  font-weight: 600;
  padding: 0px;
  background-color: #99CCFF;
  color: #fff;
  border: none;
  -webkit-transition: 0.2s;
  transition: 0.2s;
  border-radius: 3px;
  position: relative;
  z-index: 1;
  margin-right: 7px;
  overflow: hidden;
  height: 46px; 
  width:100%;
  text-align: center;
}

.order-button .btn:hover {
  color: #fff;
  background-color: #081828;
  -webkit-box-shadow: 0px 4px 4px #0000000f;
  box-shadow: 0px 4px 4px #0000000f;
}

.review-button .btn {
  display: inline-block;
  text-transform: capitalize;
  font-size: 14px;
  font-weight: 600;
  padding: 0px;
  background-color: #99CCFF;
  color: #fff;
  border: none;
  -webkit-transition: 0.2s;
  transition: 0.2s;
  border-radius: 3px;
  position: relative;
  z-index: 1;
  margin-right: 7px;
  overflow: hidden;
  height: 46px; 
  width:100%;
  text-align: center;
}

.count {
  display: flex;
  justify-content: space-between;
}
.total {
  display: flex;
  justify-content: space-between;
}


</style>




<!-- css***************************************************** -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ******************************************************** -->
</head>

<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ******************************************************** -->



<section class="item-details section">
	<div class="container">
		<div class="top-area">
			<div class="row align-items-center">
				<!-- 상품이미지 -->
				<div class="col-lg-6 col-md-12 col-12">
					<div class="product-images">
						<main id="gallery"> 
							<div class="main-img">
								<img src="${pageContext.request.contextPath}/resources/assets/images/product-details/01.jpg" id="current" alt="#">
							</div>
							<div class="images">
								<img src="${pageContext.request.contextPath}/resources/assets/images/product-details/01.jpg" class="img" alt="#">
								<img src="${pageContext.request.contextPath}/resources/assets/images/product-details/02.jpg" class="img" alt="#">
								<img src="${pageContext.request.contextPath}/resources/assets/images/product-details/03.jpg" class="img" alt="#">
								<img src="${pageContext.request.contextPath}/resources/assets/images/product-details/04.jpg" class="img" alt="#">
								<img src="${pageContext.request.contextPath}/resources/assets/images/product-details/05.jpg" class="img" alt="#">
							</div>
						</main>
					</div>
				</div>
				<!-- 상품이미지 옆 박스 -->
				<div class="col-lg-6 col-md-12 col-12">
					<div class="product-info">
						<table style="width: 100%; margin: 0px 0px 20px;">
							<tr>
								<td><h4 class="seller">개츄>></h4></td>
								<td style="text-align: right; "><button class="chat-button">판매자와채팅</button></td>
							</tr>
						</table>
							<p style="font-size: 40px; color: black; margin: 0px 0px 50px;">강아지껌</p>
							<h3 class="price">4,000원<span>6,000원</span><span style="color: red; font-size:15px; text-decoration: none; ">30%</span></h3>

						<div style="padding-bottom: 20px">
							<p>적립금<span style="padding-left: 10px">5%</span></p>
							<p>배송비<span style="padding-left: 10px">1,500원(5만원이상 무료배송)</span></p>
						</div>


						<hr>
						<div class="count">
							<div>
								수량 : <input type="hidden" name="p_price" value="5500">
								<input type="button" value=" + " name="add" style="width: 25px" >
								<input type="text" name="amount" value="1" size="3" max="">
								<input type="button" value=" - " name="min" style="width: 25px" >
							</div>
								<span>5,500 원</span> <!-- ${p_price} -->
						</div>	
						<hr>

						<div class="total">
							구매가능수량 50개
							<span>총 금액<span style="color:red; font-size: 20px; padding-left: 20px">4,000원</span></span>
						</div>

						<div class="bottom-content">
							<div class="row align-items-end">
								<div class="col-lg-4 col-md-4 col-12">
									<div class="button cart-button">
										<button class="btn" style="width:100%;">장바구니</button>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-12">
									<div class="order-button">
										<button class="btn">구매하기</button>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-12">
									<div class="wish-button">
										<button class="btn"><i class="lni lni-heart"></i></button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="product-details-info">
			<div class="single-block">
				<div class="row">
					<div class="col-lg-6 col-12">
						<div class="info-body custom-responsive-margin">
							<h4>Details</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</p>
						</div>
					</div>
				</div>
			</div>
			<div class="single-block">
			<div class="row">
				<div class="col-lg-12 col-12">
					<div class="reviews">
						<h4 class="title">Latest Reviews</h4>
						
						<div class="col-lg-3 col-md-3 col-12">
							<div class="review-button">
								<button class="btn">리뷰작성</button>
							</div>
						</div>
							<div class="single-review">
								<img src="assets/images/blog/comment1.jpg" alt="#">
									<div class="review-info">
										<ul class="stars">
										<li><i class="lni lni-star-filled"></i></li>
										<li><i class="lni lni-star-filled"></i></li>
										<li><i class="lni lni-star-filled"></i></li>
										<li><i class="lni lni-star-filled"></i></li>
										<li><i class="lni lni-star-filled"></i></li>
										</ul>
										<span style="color: #99ccff;">강아지껌</span>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod</p>
									</div>
							</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		
		
	</div>
</section>


    <!-- ========================= JS here ========================= -->
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/tiny-slider.js"></script>
    <script src="assets/js/glightbox.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script type="text/javascript">
        const current = document.getElementById("current");
        const opacity = 0.6;
        const imgs = document.querySelectorAll(".img");
        imgs.forEach(img => {
            img.addEventListener("click", (e) => {
                //reset opacity
                imgs.forEach(img => {
                    img.style.opacity = 1;
                });
                current.src = e.target.src;
                //adding class 
                //current.classList.add("fade-in");
                //opacity
                e.target.style.opacity = opacity;
            });
        });
    </script>
<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
	
</body>
</html>