<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html> 
    <html>
  <head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
  
  	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
<script>


function execPostCode() {

    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=orders_addr1]").val(data.zonecode);
           $("[name=orders_addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}

</script>
<script>

$(document).ready(function(){
		   	  
			var IMP = window.IMP;
			var code = "imp21307716"; //가맹점 식별코드
			IMP.init(code);
			
			$("#check1").click(function(e){
				//결제요청 
				IMP.request_pay({
					//name과 amout만있어도 결제 진행가능
					pg : 'html5_inicis', //pg사 선택 (kakao, kakaopay 둘다 가능)
					pay_method: $("input[name='orders_payment']").val() ,
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : '결제테스트', // 상품명
					amount : '100',
					buyer_name : $("[name=orders_name]").val(),
				  	buyer_phone : $("[name=orders_phone]").val(),
					buyer_addr1: $("#orders_addr1").val(),
				  	buyer_addr2: $("#orders_addr2").val(),
				  	buyer_addr3: $("#orders_addr3").val(),
					//결제완료후 이동할 페이지 kko나 kkopay는 생략 가능
					m_redirect_url : '${pageContext.request.contextPath}/memberorderList.do'
				}, function(rsp){
					if(rsp.success){//결제 성공시
						var msg = '결제가 완료되었습니다';
						var result = {
						"imp_uid" : rsp.imp_uid,
						"merchant_uid" : rsp.merchant_uid,
						"pay_date" : new Date().getTime(),
						"amount" : rsp.paid_amount,
						"card_no" : rsp.apply_num,
						"refund" : 'payed'
						}
						orderInsert();
						console.log("결제성공 " + msg);
					}
					else{//결제 실패시
						var msg = '결제에 실패했습니다';
						msg += '에러 : ' + rsp.error_msg
					}
					console.log(msg);
				});//pay
			}); //check1 클릭 이벤트
			
			function orderInsert(){
				
				var formObj = $("form[name='orderForm']");


					formObj.attr("action", "${pageContext.request.contextPath}/orderInsert.do");
					formObj.attr("method", "post");
					formObj.submit();
				
			}
});
</script>
 <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
<style>
html, body{
    height: 100%;
    min-height: 100%;
    width: 100%;

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

    <!-- Bootstrap core CSS -->
    
    <link href="resources/assets/css/pay.css" rel="stylesheet">

  </head>
<body>

    <!-- 헤더와 js************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->
<div id="wrap">
<div class="content" style="padding-bottom:0;">
	<form class="form-payment" name="orderForm" >
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
			   			<span class="ui_title__txtright--blue user-info-header-right-text" >${m_nick}님</span>
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
   									<label for="receiver" >받는분</label>
				   				</div>
   								<div class="address-info body">
   									<div class="input-text">
   										<input type="text" name="orders_name" value="">
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
   										<input type="text" name="orders_phone" value="" >
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
   													<input  type="text" name="orders_addr1" id="orders_addr1" placeholder="우편번호" autocomplete="off">
   												</div>
   												<button  class="btn btn-m btn-white" type="button" style="width:77px;" onclick="execPostCode();" >주소찾기</button>
   											</div>
   										</div>
   									</div>
   									<div class="address-ui row">
                 			   			<div class="input-text address-address1">
                        					<input  type="text" name="orders_addr2" id="orders_addr2" value="" placeholder="기본 주소" required="" autocomplete="off" readonly="">
                    					</div>
                					</div>
   									<div class="address-ui row">
                   						<div class="input-text address-address2">
                       						<input type="text" name="orders_addr3" id="orders_addr3" value="" autocomplete="off" placeholder="나머지 주소">
                    					</div>
                					</div>
   								</div>		
   							</div>
   							
   							</div>
   							</div>
   						</div>
   						<div class="ui_title--sub tab "></div>
   					</div>
	   				<div class="ProductPaymentMethodSelector">
	   					<div class="ProductPaymentMethodSelector__title">
	   						<div class="PaymentMethodSelector radiogroup">
	   							<label class="radio-item payment-bill payment-bill">
	   								<div class="payment-radio-item-wrapper" >
	   									<input  name="orders_payment" type="radio" class="idus-icon-radio" checked="checked" value="card"> 
	   									<div class="PaymentMethodSelector__textGroup">
	   										<span class="payment-method">일반 카드 결제</span>
	   									</div>
	   								</div>
	   							</label>
	   						</div>
	   					</div>
	   					<div class="ProductPaymentMethodSelector__title">
	   						<div class="PaymentMethodSelector radiogroup">
	   							<label class="radio-item payment-bill payment-bill">
	   								<div class="payment-radio-item-wrapper">
	   									<input  name="orders_payment" type="radio" class="idus-icon-radio" value="kakaopay">
	   									<div class="PaymentMethodSelector__textGroup">
	   										<span class="payment-method">--</span>
	   									</div>
	   								</div>
	   							</label>
	   						</div>
	   					</div>
	   				</div>
   			</section>
   			<section>
   			<div class="final-cost ui_sticky" style="top: auto;" data-ui="sticky">
   				<h3 class="table-header">결제 정보</h3>
   				<div class="segment">
   					<table>
   						<tbody>
   							<tr>
   								<th>제품 금액</th>
   								<td>
   								<span id="total_Price"></span>
   								<em>원</em>   								
   								</td>
   							</tr>
   							<tr>
   								<th>배송비</th>
   								<td>
   								<span id="total_Point"></span>
   								<em>원</em>
   								</td>
   							</tr>
   						</tbody>
   					</table>
   					<table class="spacing">
   						<tbody>
   							<tr class="total">
   								<th>최종 결제금액</th>
   								<td class="hilight">
   								<span id="final_Price"></span>
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
   								<button type="button" class="ui_btn--red--large"  id="check1" >
   									<span id="final_Price">${orders_totalprice}</span>
   									<em>원</em>
   									<span>결제하기</span>
   									<p class="point" style="display: block;">예상적립금
   									<span id="total_Point"></span>
   									<em>P</em>
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
</div>
</div>


<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
    
<!-- ************************************************ -->

  </body>
</html>