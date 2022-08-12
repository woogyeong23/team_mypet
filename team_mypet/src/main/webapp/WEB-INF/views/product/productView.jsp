<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		let p_idx = ${productVo.p_idx}
		$("#add_cart").click(function(){
			
			alert("asd");
			
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/cartMemInto.do",
				async : false,
				data : {'p_idx' : p_idx},
				success : function(data) {
					if (data == 'add_success') {
						toastr.options.preventDuplicates = true;
						toastr.success("장바구니 추가완료");
					} else if (data == 'already_existed') {
						toastr.options.preventDuplicates = true;
						toastr.warning("이미 추가 된 상품입니다");
					}
				}
			});
		});
	});
	
	function change_qty2(t){
		  //var min_qty = '수량버튼'*1;
		  var min_qty = 1;
		  var this_qty = $("#cart_cnt").val()*1;
		  var max_qty = ${productView.p_limit_cnt}; // 현재 재고
		  if(t=="m"){
		    this_qty -= 1;
		    if(this_qty<min_qty){
		      //alert("최소구매수량 이상만 구매할 수 있습니다.");
		      alert("수량은 1개 이상부터 가능합니다.");
		      return;
		      }
		    }
		    else if(t=="p"){
		      this_qty += 1;
		      if(this_qty>max_qty){
		        alert("구매 가능 수량을 초과합니다.");
		        return;
		        }
		    }
		  var show_total_amount = basic_amount * this_qty;
		  //$("#cart_cnt_txt").text(this_qty); 
		  $("#cart_cnt").val(this_qty);
		  $("#it_pay").val(show_total_amount);
		  $("#total_amount").html(show_total_amount.format());
		}
		
	//장바구니추가버튼
	$("#btn_cart").on("click",function(e){
		form.p_count = $("#cart_cnt").val();
		$.ajax({
			url : "${pageContext.request.contextPath}/member/membercart/insertCart.do", //호출할 url
			type : 'post', // 호출할 방법(get,post)
			data : form, //서버로 보낼 데이터
			success : function(result){ //요청 성공시 수행될 메서드, 파라미터는 서버가 반환하는 값
				cartAlert(result);
			},
		      error: function() {
		          alert("에러 발생");
		      }
		})
	});
	function cartAlert(result){
		if(result == '0'){
			alert("장바구니에 추가를 하지 못하였습니다.");
		} else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		} else if(result == '2'){
			alert("장바구니에 이미 추가되어져 있습니다.");
		} else if(result == '5'){
			alert("로그인이 필요합니다.");	
		}
	}
</script>




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

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- 수량변경 스크립트 -->
<script>
/*
$(document).ready(function() {
	let p_idx = ${productVo.p_idx}
	$("#add_cart").click(function(){
		
		alert("장바구니 추가중");
		
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/cartMemInto.do",
			async : false,
			data : {'p_idx' : p_idx},
			success : function(data) {
				if (data == 'add_success') {
					toastr.options.preventDuplicates = true;
					toastr.success("장바구니 추가완료");
				} else if (data == 'already_existed') {
					toastr.options.preventDuplicates = true;
					toastr.warning("이미 추가 된 상품입니다");
				}
			}
		});
	});
});*/

// 2,500 <-
 Number.prototype.format = function(){
	  if(this==0) return 0;

	  var reg = /(^[+-]?\d+)(\d{3})/;
	  var n = (this + '');

	  while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

	  return n;
	};

	
	
String.prototype.format = function(){
	  var num = parseFloat(this);
	  if( isNaN(num) ) return "0";
	  return num.format();
	};
	    
var basic_amount = parseInt(${productView.p_price});

function change_qty2(t){
	  //var min_qty = '수량버튼'*1;
	  var min_qty = 1;
	  var this_qty = $("#cart_cnt").val()*1;
	  var max_qty = ${productView.p_limit_cnt}; // 현재 재고
	  if(t=="m"){
	    this_qty -= 1;
	    if(this_qty<min_qty){
	      //alert("최소구매수량 이상만 구매할 수 있습니다.");
	      alert("수량은 1개 이상부터 가능합니다.");
	      return;
	      }
	    }
	    else if(t=="p"){
	      this_qty += 1;
	      if(this_qty>max_qty){
	        alert("구매 가능 수량을 초과합니다.");
	        return;
	        }
	    }

	  var show_total_amount = basic_amount * this_qty;
	  //$("#cart_cnt_txt").text(this_qty); 
	  $("#cart_cnt").val(this_qty);
	  $("#it_pay").val(show_total_amount);
	  $("#total_amount").html(show_total_amount.format());
	}
	


function cartAlert(result){
	if(result == '0'){
		alert("장바구니에 추가를 하지 못하였습니다.");
	} else if(result == '1'){
		alert("장바구니에 추가되었습니다.");
	} else if(result == '2'){
		alert("장바구니에 이미 추가되어져 있습니다.");
	} else if(result == '5'){
		alert("로그인이 필요합니다.");	
	}
}

</script>


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

#cate {
padding-bottom: 20px;
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

<section class="item-details section" style="padding-top: 10px;">
	<div class="container">
		<div class="top-area">
			<span id="cate">
				<c:choose>
					<c:when test="${productView.p_category_idx == 1}">강아지 > 개껌</c:when>
					<c:when test="${productView.p_category_idx == 2}">강아지 > 스낵</c:when>
					<c:when test="${productView.p_category_idx == 3}">강아지 > 뼈/육포</c:when>
					<c:when test="${productView.p_category_idx == 4}">강아지 > 스틱</c:when>
					<c:when test="${productView.p_category_idx == 5}">강아지 > 프리미엄</c:when>
					<c:when test="${productView.p_category_idx == 6}">강아지 > 통살</c:when>
							       
					<c:when test="${productView.p_category_idx == 7}">고양이 > 츄르</c:when>
					<c:when test="${productView.p_category_idx == 8}">고양이 > 스낵</c:when>
					<c:when test="${productView.p_category_idx == 9}">고양이 > 캣잎</c:when>
					<c:when test="${productView.p_category_idx == 10}">고양이 > 통살</c:when>
					<c:when test="${productView.p_category_idx == 11}">고양이 > 프리미엄</c:when>
					<c:when test="${productView.p_category_idx == 12}">고양이 > 스틱</c:when>
				</c:choose>
			</span>
					
			<div class="row align-items-center">
				<!-- 상품이미지 -->
				<div class="col-lg-6 col-md-12 col-12">
					<div class="product-images">
						<main id="gallery"> 
							<div class="main-img">
									<img src="${pageContext.request.contextPath}/resources/product/${productView.p_sys_filename}" width="300px" height="400px" id="current" alt="#">
							</div>
							<div class="images">
								<c:forEach var="Product_ImgVo" items="${product_imgs}">
								<img src="${pageContext.request.contextPath}/resources/product/${Product_ImgVo.p_sys_filename}" class="img" alt="#">	
								</c:forEach>
							</div>
						</main>
					</div>
				</div>
				<!-- 상품이미지 옆 박스 -->
				<div class="col-lg-6 col-md-12 col-12">
					<input type="hidden" name="p_idx" value="${productVo.p_idx}">
					<input type="hidden" name="midx" value="${productVo.midx}">
										
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
                            				<ul class="review">
                               <c:forEach begin="1" end="${productView.avg_reviews_stars}" step="1">
									<li><i class="lni lni-star-filled" style="font-size: 20px"></i></li>
								</c:forEach>
								<c:if test="${productView.avg_reviews_stars%5 > 0}">
								   <li><i class="lni lni-star-half"></i></li>
								</c:if>
							   <c:forEach begin="1" end="${5-productView.avg_reviews_stars}" step="1">
							      <li><i class="lni lni-star-empty"></i></li>
							   </c:forEach>	
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
						<form class="cart_form" method="get" action="${pageContext.request.contextPath}/insertCart.do">
	
						<hr>
						<div class="col-lg-12">
						<div class="count">
						<!-- 수량변경 버튼 -->
								
							<div>
								<input type="hidden" name="p_idx" value="${productView.p_idx}">
								<span style="float:left; padding-right: 10px">수량 :</span>
								<div class="qty" style="float:left;">					
        							<div class="plus" style="float: left; padding-right:10px"><a href="javascript:change_qty2('p')"><img src="${pageContext.request.contextPath}/resources/assets/images/logo/add.png" width="20px" height="20px" alt="+"></a></div>
        							<input type="text" style="float: left; text-align: center;" size="3" name="cart_cnt" id="cart_cnt" value="1" readonly="readonly">
       								<div class="minus" style="float: left; padding-left:10px"><a href="javascript:change_qty2('m')"><img src="${pageContext.request.contextPath}/resources/assets/images/logo/minus.png" width="20px" height="20px" alt="-"></a></div>
								</div>     
								<!-- <div>
								수량 : <input type="hidden" name="p_price" value="5500">
								<input type="button" value=" + " name="add" style="width: 25px" >
								<input type="text" name="amount" value="1" size="3" max="" style="text-align: center;">
								<input type="button" value=" - " name="min" style="width: 25px" >
								</div>	 -->						
      						</div>
      						

						</div>
						</div>
						<hr>
						<div class="total">
							구매가능수량 ${productView.p_limit_cnt}개
							<span>총 금액<span id="total_amount" style="color:red; font-size: 20px; padding-left: 20px">${productView.p_price}</span>원</span>
						</div>
						<!-- 수량변경 버튼 끝 -->

						
						<div class="bottom-content">
							<div class="row align-items-end">
								<div class="col-lg-4 col-md-4 col-12">

									<div class="button cart-button">
										<button id="btn_cart" class="btn" style="width:100%;">장바구니</button> 
									</div>
								</div>
						
						
								<div class="col-lg-4 col-md-4 col-12">
									<div class="order-button">
										<button type="button" class="btn">구매하기</button> <!-- button의 기본 타입은 submit이므로 submit 버튼이 아니라면 type="button"을 따로 지정해줘야함 -->
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-12">
									<div class="wish-button">
										<button type="button" class="btn"><i class="lni lni-heart"></i></button>
									</div>
								</div>
							</div>
						</div>
						</form>
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
							<p align="center">${productView.p_content}</p>
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
								<a href="reviewWrite.do?p_idx=${productView.p_idx}"><button class="btn" id="reviewWritebtn" style="width: 100px; height:40px">리뷰작성</button></a>
						</div>
						</td>
						</tr>
						</table>
						<hr style="color:gray;">
						</div>	

						<!-- 리스트 반복문 -->

							<div class="single-review">
								
                				<c:forEach var="reviewVo" items="${reviewList}">
                
								<div class="reviewbox">
								<!-- 이미지가 눌이 아니면 -->
								
								<div class="col-lg-10">
								
								
								<table>
								
								<tr>
								<td rowspan="2">
								<img src="${pageContext.request.contextPath}/resources/product/${reviewVo.review_img}" style="width: 200px; height: 150px" alt="#"> <!-- 리뷰이미지 -->		
								
								</td>
								<td style="height: 30px">
								<span style="color: #99ccff; font-size: 25px; padding-right: 10px; padding-left: 10px">${reviewVo.p_name}</span> <!-- 해당판매상품이름/상세페이지로링크 -->
					
								<ul class="review" style="float:right;">
                               <c:forEach begin="1" end="${reviewVo.avg_reviews_stars}" step="1">
									<li style="display: inline-block;"><i class="lni lni-star-filled" style="color: #fecb00; font-size: 15px"></i></li>
								</c:forEach>
								<c:if test="${reviewVo.avg_reviews_stars%5 > 0}">
								   <li style="display: inline-block;"><i class="lni lni-star-half" style="color: #fecb00; font-size: 15px"></i></li>
								</c:if>
							   <c:forEach begin="1" end="${5-reviewVo.avg_reviews_stars}" step="1">
							      <li style="display: inline-block;"><i class="lni lni-star-empty" style="color: #fecb00; font-size: 15px"></i></li>
							   </c:forEach>	
								</ul>
								
								</td>
								</tr>
								
								<tr>
								<td>
								<a href="reviewContent.do?review_idx=${reviewVo.review_idx}">${reviewVo.review_content} (후기내용)</a>
								</td>
								</tr>
								
								</table>
								
								<p class="reviewb">작성일 ${reviewVo.review_wday }<span align="right" style="padding-right: 10px">댓글 수 ${reviewVo.review_reply_cnt}</span></p>
								</div>
								<div class='v-line'></div>
								
								<div class="col-lg-2" style="padding-left: 10px;">
								<table style="height: 100%">
								<tr><td><span style="color: #99ccff; font-size: 20px">작성자:${reviewVo.review_nick}</span></td></tr>
								<tr><td>반려동물정보</td></tr>
								<tr><td>종:고양이</td></tr>
								<tr><td>이름:강산</td></tr>
								<tr><td>나이:4</td></tr>
								</table>
								
								</div>
								
								</div>
								
								<hr>
								</c:forEach>
								
								
						<!-- 리스트 반복문끝 -->
							</div>
						</div>
					</div>
				</div>	
			</div>
			
			
			<!-- 리뷰끝 -->
				
				<!-- 판매자의 다른 상품 -->
				<section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title" style="background-color:#FFFFFF ">
                        <h2>판매중인 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            <c:choose>
            <c:when test="${spCount == 0 }">
             <div class="result">
                    <div class="result_in">
                    <h1 style="color:rgb(181, 181, 181); text-align:center"><i class="lni lni-empty-file"></i></h1>
                               <br>
                   <h5 style="color: rgb(181, 181, 181);">작가(판매자)님이 판매중인 상품이 없습니다.</h5>
                   </div>
                    </div>
            </c:when>
       <c:otherwise>
          <p>총 <span class="result_span">${spCount}</span>개의 상품을 판매하고 있어요</p>
             <c:forEach var="productVo" items="${spList}" end="4">
             
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product">
                        <div class="product-image">
                            <img src="${pageContext.request.contextPath}/resources/product/${productVo.p_sys_filename}" alt="#">
                            <div class="button">
                                <a href="product-details.html" class="btn"><i class="lni lni-cart"></i> 찜하기</a>
                            </div>
                        </div>
                        <div class="product-info">
                            <span class="category">${productVo.p_category_idx}</span>
                            <h4 class="title">
                                <a href="#">${productVo.p_name}</a>
                            </h4>
                            <ul class="review" style="float:right;">
                               <c:forEach begin="1" end="${productVo.avg_reviews_stars}" step="1">
									<li style="display: inline-block;"><i class="lni lni-star-filled" style="color: #fecb00; font-size: 15px"></i></li>
								</c:forEach>
								<c:if test="${productVo.avg_reviews_stars%5 > 0}">
								   <li style="display: inline-block;"><i class="lni lni-star-half" style="color: #fecb00; font-size: 15px"></i></li>
								</c:if>
							   <c:forEach begin="1" end="${5-productVo.avg_reviews_stars}" step="1">
							      <li style="display: inline-block;"><i class="lni lni-star-empty" style="color: #fecb00; font-size: 15px"></i></li>
							   </c:forEach>	
								</ul>
                            <div class="price">
                                <span>${productVo.p_price}</span>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Product -->
                </div>
                </c:forEach>
            </c:otherwise>
                </c:choose>
            </div>
        </div>
    </section>
    
  				<!-- 판매자의 다른 상품끝 -->
					
				<!-- 비슷한 상품 -->
				<!-- 비슷한 상품끝 -->
			
			
			
			
	</div>
</section>
				

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