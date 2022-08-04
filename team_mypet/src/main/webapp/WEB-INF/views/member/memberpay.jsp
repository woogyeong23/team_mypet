<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html> 
  <head>

 <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->


    <!-- Bootstrap core CSS -->
    
    <link href="resources/assets/css/pay.css" rel="stylesheet">

  </head>
  <body>

    <!-- 헤더와 js************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->
	
<main>
<article class="Mcontainer" >
	
	<form class="form-payment">
		<div class="inner-w800" style="width:800px;">
		<div class="title-style clf">
			<h2 class="txt fl">주문 결제하기</h2>
			
			<ol class="page-location fr">
   				<li>
   					<em class="icon-num">1.</em>
   					<span>장바구니</span>
   					<i class="fa fa-angle-right"></i>
   				</li>
   				<li class="active">
   					<em class="icon-num">2.</em>
   					<span>주문결제</span>
   					
   				</li>
   			</ol>
   		</div>
   		<div class="layout-split" data-layout-split="payment">
   			<section data-ui="toggle-tab">
   				<div class="segment--nospacing">
   					<div class="ui_title--sub tab">
   						<span class="ui_title__txt">주문 고객</span>
			   			<span class="ui_title__txtright--blue user-info-header-right-text">id _ phone</span>
   					</div>
   				</div>
   				<div class="segment--nospacing">
   				
   				<div class="ui_title--sub">
   					<span class="ui_title__txt">주소(배송지)</span>
   				</div>
   				
   				<div class="payment-contents">
   					<div class="address-section">
   						<div class="address-info root">
   							<div class="address-info item">
   								<div class="address-info head">
   									<em class="asterisk red">*</em>
   									<label for="receiver">받는분</label>
				   				</div>
   								<div class="address-info body">
   									<div class="input-text">
   										<input type="text">
   									</div>
   								</div>
   							</div>
   							<div class="address-info item">
   								<div class="address-info head">
   									<em class="asterisk red">*</em>
   									<label for="receiver">전화번호</label>
   								</div>
   								<div class="address-info body">
   									<div class="input-text">
   										<input type="text">
   									</div>
   								</div>
   							</div>
   							<div class="address-info item">
   								<div class="address-info head">
   									<em class="asterisk red">*</em>
   									<label for="receiver">주소</label>
   								</div>
   								<div class="address-info body">
   									<div class="address-ui root">
   										<div class="address-ui address">
	   										<div class="address-ui row">
   												<div class="input-text address-zip-code">
   													<input data-address="delivery_zipcode" type="text" placeholder="우편번호" autocomplete="off">
   												</div>
   												<button data-address="open" class="btn btn-m btn-white" type="button" aria-invalid="false" style="width:77px;">주소찾기</button>
   											</div>
   										</div>
   									</div>
   									<div class="address-ui row">
                 			   			<div class="input-text address-address1">
                        					<input data-address="delivery_address1" type="text" value="" placeholder="기본 주소" required="" autocomplete="off" readonly="">
                    					</div>
                					</div>
   									<div class="address-ui row">
                   						<div class="input-text address-address2">
                       						<input data-address="delivery_address2" type="text" name="delivery_address2" value="" autocomplete="off" placeholder="나머지 주소">
                    					</div>
                					</div>
   								</div>		
   							</div>
   							
   							</div>
   							</div>
   						</div>
   						<div class="ui_title--sub tab "></div>
   					</div>
   				
   			</section>
   			<section>
   			<div class="final-cost ui_sticky absolute" style="top: auto;" data-state="active">
   				<h3 class="table-header">결제 정보</h3>
   				<div class="segment">
   					<table>
   						<tbody>
   							<tr>
   								<th>제품 금액</th>
   								<td></td>
   							</tr>
   							<tr>
   								<th>배송비</th>
   								<td></td>
   							</tr>
   						</tbody>
   					</table>
   					<table class="spacing">
   						<tbody>
   							<tr class="total">
   								<th>최종 결제 금액</th>
   								<td class="hilight">
   								<span></span>
   								<em>원</em>
   								</td>
   							</tr>
   						</tbody>
   					</table>
   				</div>
   					<div class="segment-group">
   						<div class="segment--nospacing">
   							<div class="ui_title--sub tab">
   								<span>결제 시 개인정보 제공에 동의합니다.</span>
   								<span class="checkout-toggle-btn">"더 보기"</span>
   							</div>
   						</div>
   						<div class="segment--nospacing scroll-detector" style="top: 500px; bottom: 69px;">
   							<div class="mfixed">
   								<button class="ui_btn--red--large">
   									<span>2,123,123</span>
   									<span>결제하기</span>
   									<p class="point" style="display: block;">예상적립금
   									<em>212</em>
   									p
   									</p>
   								</button>
   							</div>
   						 </div>
   					</div>
   				
   			</div>
   			
   			</section>
   			</div>
   		</div>
	</form>

</article>
</main>



<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
    
<!-- ************************************************ -->

  </body>
</html>