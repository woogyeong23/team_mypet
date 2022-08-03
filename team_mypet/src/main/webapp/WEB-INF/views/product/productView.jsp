<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<script>

//수량버튼1
/* const formform = document.getElementByName("form1"),
pprice=document.form1.pprice,
pcount=document.form1.pcount,
add=document.form1.add,
minus=document.form1.minus,
sum=document.form1.sum;

if(formform){
	sum.value=pprice.value;
	
	let countval=pcount.value,
		sumval=sum.value,
		priceval=pprice.value;

	if(add){
		add.addEventListener('click',function(){
			countval++;
			sumval=countval*priceval;
			pcount.value=countval;
			sum.value=sumval;
			console.log(countval,sumval,priceval);
		});
	}

	if(minus){
		minus.addEventListener('click',function(){
			if (countval>1){
			countval--;
			sumval=countval*priceval;
			pcount.value=countval;
			sum.value=sumval;
			console.log(countval,sumval,priceval);
			}else{
				countval=1;
			}
		});
	}
} */

//수량버튼2
	let count = $(".pcount").val();
	$(".plus_btn").on("click", function(){
		$(".pcount").val(++count);
	});
	$(".minus_btn").on("click", function(){
		if(count > 1){
			$(".pcount").val(--count);	
		}
	});





/*
//서버로 전송할 데이터
const form = {
		p_idx : '${productVo.p_idx}',
		p_name : '${productVo.p_name}',
		p_count:'',
		
}

//장바구니추가버튼
$("#btn_cart").on("click",function(e){
	form.p_count = $(".quantity_input").val();
	$.ajax({
		url : '${pageContext.request.contextPath}/membercart.do', //호출할 url
		type : 'GET', // 호출할 방법(get,post)
		data : form, //서버로 보낼 데이터
		success : function(result){ //요청 성공시 수행될 메서드, 파라미터는 서버가 반환하는 값
			cartAlert(result);
		} 
	})
});


function cartAlert(result){
	if(result =='0'){
		alert("장바구니에 추가할 수량을 선택해주세요.");
	}else{
		alert("장바구니에 추가되었습니다.")
	}
		
}
*/

</script>


<!-- css***************************************************** -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ******************************************************** -->
</head>

<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ******************************************************** -->



<section class="item-details section" style="padding-top: 10px;">
	<div class="container">
		<div class="top-area">
			<div class="row align-items-center">
				<!-- 상품이미지 -->
				<div class="col-lg-6 col-md-12 col-12">
					<div class="product-images">
						<main id="gallery"> 
							<div class="main-img">
									<img src="${pageContext.request.contextPath}/resources/assets/images/products/${productView.p_sys_filename}" width="300px" height="400px" id="current" alt="#">
							</div>
							<div class="images">
								<c:forEach var="Product_ImgVo" items="${product_imgs}">
								<img src="${pageContext.request.contextPath}/resources/assets/images/products/${Product_ImgVo.p_sys_filename}" class="img" alt="#">	
								</c:forEach>
							</div>
						</main>
					</div>
				</div>
				<!-- 상품이미지 옆 박스 -->
				<div class="col-lg-6 col-md-12 col-12">
					<div class="product-info">
						<table style="width: 100%; margin: 0px 0px 20px;">
							<tr>
								<td><h4 class="seller">${productView.m_nick}>></h4></td>
								<td style="text-align: right; "><button class="chat-button">판매자와채팅</button></td>
							</tr>
						</table>
							<p style="font-size: 40px; color: black; margin: 0px 0px 50px;">${productView.p_name}</p>
							
							<!-- 할인율이 있을 경우 할인율과 할인된 가격까지 표시, 할인율이 0%일 경우 본래 가격만 표시 -->
							<c:if test="${productView.p_discount ne '0'}">
							<h3 class="price" style="margin-bottom:5px">${productView.p_disprice}원<span>${productView.p_price}원</span><span style="color: red; font-size:15px; text-decoration: none; ">${productView.p_discount}%</span></h3>
							</c:if>
							<c:if test="${productView.p_discount eq '0'}">
							<h3 class="price" style="margin-bottom:5px">${productView.p_price}원</h3>
							</c:if>
							
							<!-- 별점 -->
							<div class="row">
              					<div class="col-lg-12">
                    				<div class="single-product" style="border: none; box-shadow: 0px 0px 0px; margin:0px 0px 0px; padding: 0px">
                       					<div class="product-info" style="padding: 0px">
                            				<ul class="review" style="margin: 0px 0px 0px;">
                                				<li><i class="lni lni-star-filled"></i></li>
                                				<li><i class="lni lni-star-filled"></i></li>
                                				<li><i class="lni lni-star-filled"></i></li>
                               					<li><i class="lni lni-star-filled"></i></li>
                                				<li><i class="lni lni-star"></i></li>
                            				</ul>
                        				</div>
                    				</div> 
                				</div>
    						</div>
							<!-- 별점끝 -->
							
						<div style="padding-bottom: 20px">
							<p>적립금<span style="padding-left: 10px">${productView.p_point}</span></p>
							<p>배송비<span style="padding-left: 10px">${productView.p_dvprice}원(${productView.p_free_dvprice}원이상 무료배송)</span></p>
						</div>


						<hr>
						<form name="formform">
						<div class="count">
							<div>
								수량 :
								<input type="button" class="plus_btn" name="add" value=" + "  style="width: 25px" >
								<!-- <input type="hidden" class="pprice" name="pprice" value="50">
								 --><input type="text" class="pcount" name="pcount" value="1" size="3" max="" style="text-align: center;">
								<input type="button" class="minus_btn" name="minus" value=" - " style="width: 25px">
							</div>
								<span><input type="text" name="sum" size="11" readonly="readonly"> 원</span> <!-- ${p_price} -->
						</div>
						</form>	
						<hr>

						<div class="total">
							구매가능수량 ${productView.p_limit_cnt}개
							<span>총 금액<span style="color:red; font-size: 20px; padding-left: 20px">${productView.p_price}원</span></span>
						</div>


						<div class="bottom-content">
							<div class="row align-items-end">
								<div class="col-lg-4 col-md-4 col-12">
									<div class="button cart-button">
										<button id="btn_cart" class="btn" style="width:100%;">장바구니</button>
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
		<!-- 상품상세정보란 -->
		<div class="product-details-info">
			<div class="single-block">
				<div class="row">
					<div class="col-lg-12 col-12">
						<div class="info-body custom-responsive-margin">
							<h4>상품상세정보</h4>
							<p>${productView.p_content}</p>
						</div>
			

						
					<!-- 성분표시/환불 팝오버 -->
		<div class="accordion accordion-flush" id="accordionFlushExample">
		
					<table style="width: 100%">
					<tr>
					<td width="50%">
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        성분 표시
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse show" aria-labelledby="flush-headingOne">
      <div class="accordion-body">${productView.p_ingerdient}</div>
    </div>
  </div>
</td>
<td width="50%">
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        배송/환불
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse show" aria-labelledby="flush-headingTwo">
      <div class="accordion-body">${productView.p_cancle_info}</div>
    </div>
  </div>
  </td>
  </tr>
  </table>
</div>
					<!-- 팝오버끝 -->
					
					</div>
				</div>
			</div>
				
			</div>
			<!-- 리뷰 -->
			<div class="product-details-info">
			<div class="single-block">
			<div class="row">
				<div class="col-lg-12 col-12">
					<div class="reviews">
						<table style="width: 100%">
						<tr>
						<td style="width:10%;"><h4 class="title" style="margin-bottom:0px;">구매후기</h4></td>
						
						<!-- 후기정렬 -->
						<td style="align:left; width: 10%;">
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
						<hr style="color:gray;">
						</div>	

						<!-- 리스트 반복문 -->

							<div class="single-review">
								
								<div class="reviewbox">
								<!-- 이미지가 눌이 아니면 -->
								<div class="col-lg-10">
								<table>
								
								<tr>
								<td rowspan="2">
								<img src="${pageContext.request.contextPath}/resources/assets/images/products/gum1.jpg" style="width: 200px; height: 150px" alt="#"> <!-- 리뷰이미지 -->		
								</td>
								<td style="height: 30px">
								<span style="color: #99ccff; font-size: 20px">강강(작성자닉)</span> <!-- 해당판매상품이름/상세페이지로링크 -->
								별점		
								</td>
								</tr>
								
								<tr>
								<td>
								존맛탱
								</td>
								</tr>
								
								</table>
								
								<p class="reviewb">작성일 2022-06-07<span align="right" style="padding-right: 10px">댓글 수 0</span></p>
								</div>
								<div class='v-line'></div>
								
								<div class="col-lg-2" style="padding-left: 10px;">
								<table style="height: 100%">
								<tr><td><span style="color: #99ccff; font-size: 20px">강아지껌(상품명)</span></td></tr>
								<tr><td>반려동물정보</td></tr>
								<tr><td>종:고양이</td></tr>
								<tr><td>이름:강산</td></tr>
								<tr><td>나이:4</td></tr>
								</table>
								</div>
								</div>
								<hr>
								
						<!-- 리스트 반복문끝 -->
							</div>
						</div>
					</div>
				</div>	
			</div>
	</div>
</section>
				<!-- 리뷰끝 -->
				
				<!-- 판매자의 다른 상품 -->
  				<!-- 판매자의 다른 상품끝 -->
					
				<!-- 비슷한 상품 -->
				<!-- 비슷한 상품끝 -->

						
<!-- 수량버튼 스크립트 -->

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