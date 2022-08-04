<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html> 
    <html>
  <head>
  

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	

	//수량 감소
	$("#NumberCounter__button1").click(function(){
		let NC = $(this).parent().find("#NumberCounter__input");
		let NCV = NC.val();
			
		if(NCV > 1){
		NC.val(parseInt(NCV)-1);
		};
	});
	//수량 증가
	$("#NumberCounter__button2").click(function(){
		let NC = $(this).parent().find("#NumberCounter__input");
		let NCV = NC.val();
		
		NC.val(parseInt(NCV)+1);
	});
	
	setTotalInfo();

	$("#artist_checkedbox").on("change", function(){

		setTotalInfo("#CartArtistItem");

	});
	
	
	//모든 체크 박스 선택
	$("#cart-product-all-check").on("click", function(){
		if($("#cart-product-all-check").prop("checked")){
			$("#item_checkedbox").attr("checked",true);
			$("#artist_checkedbox").attr("checked",true);
		}else{
			$("#item_checkedbox").attr("checked",false);
			$("#artist_checkedbox").attr("checked",false);
		}
	});
	
	
	
	
	
	
	
	function setTotalInfo(){
		
		let Price = $("#p_price_input").val();	// 총 가격
		let Price_cnt = Price.length;
		let totalPrice = 0;				// 총 가격
		let totalPoint = 0;				// 총 마일리지
		let deliveryPrice = 0;			// 배송비
		let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
		let cnt = $("#NumberCounter__input").val();
		
		$("#CartArtistItem").each(function(index, element){
			
			if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
				for (var i = 0; i < Price_cnt; i++){
					// 총 가격
					totalPrice += parseInt($(element).Price[i]) * parseInt($(element).cnt[i]);
					// 총 마일리지
					totalPoint += parseInt($(element).Price[i]) * 0.05;	
				}
					
			}

		});
		
		
		/* 배송비 결정 */
		if(totalPrice >= 30000){
			deliveryPrice = 0;
		} else if(totalPrice == 0){
			deliveryPrice = 0;
		} else {
			deliveryPrice = 3000;	
		}
		
			finalTotalPrice = totalPrice + deliveryPrice;
		
		/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
		
		// 총 가격
		$("#totalPrice_span").text(totalPrice);
		// 총 마일리지
		$("#totalPoint_span").text(totalPoint);
		// 배송비
		$("#delivery_price").text(deliveryPrice);	
		// 최종 가격(총 가격 + 배송비)
		$("#finalTotalPrice_span").text(finalTotalPrice);		
	}


});
</script>
 <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->


    <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/cart.css" rel="stylesheet">
  </head>
  <body>

    <!-- 헤더와 js************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->

<main>
<input type="hidden" name="midx" value="${midx}">



<aside class="container">
		<div class="CartPage">
      		<div class="PageHeader"> 
   				<h2 class="PageHeader__title">
   				장바구니</h2>
   					<ol class="PageHeader__step">
   						<li class="PageHeader__stepsItem PageHeader__stepsItem active">
   						<em>1.</em>
   						<span>장바구니</span>
   						
   						</li>
   						<li class="PageHeader__stepsItem PageHeader__stepsItem">
   						<em>2.</em>
   						<span>주문결제</span>
   						</li>
   					</ol>
   					</div>
   				
   				<div class="CartArtistList" id="CartArtistList">
   					<div class="vue-sticky-placeholder" style="padding-top: 0px;"></div>
   					<div class="CartList__sticky vue-sticky-el" style="position: static; top: auto; bottom: auto; left: auto; width: auto; z-index: 201;"></div>
   					
   					<c:forEach items="${cart}" var="cart" varStatus="status">
   					<div class="CartArtistItem" id="CartArtistItem">
   					<input type="hidden" name="p_price" id="p_price_input" value="${cart.p_price}">
   					<input type="hidden" name="p_idx" id="p_idx_input" value="${cart.p_idx}">
   					<input type="hidden" name="p_name" id="p_name_input" value="${cart.p_name}">
   					<input type="hidden" name="p_content" id="p_content_input" value="${cart.p_content}">
   					<input type="hidden" name="cart_cnt" id="cart_cnt_input" value="${cart.cart_cnt}">
   						<div class="CartArtistItem__header">
   						<label>
							<div class="checkbox">   							
   							<div class="input-checkbox">
   							<input id="artist_checkedbox" type="checkbox" autocomplete="off" class="bp" value="${cart.p_content}" checked="checked">
   							</div>
   							</div>
   							<span  class="CartArtistItem__title">${cart.p_content}</sqan> <!-- 작가이름 -->
   						</label>
   						</div>
   							<section class="CartArtistItem__itemList">
   								<ul>
   									<div class="CartProductList">   						
   										<div class="CartProductListItem" id="CartProductListItem">   						
   											<div class="CartProductListItem__productInfo">   						
			   									<div class="CartProductListItem__checkboxGroup">
   													<div class="CartProductListItem__checkboxWrap" style="display: inline-block;">			
   														<div class="checkbox">
   															<div class="input-checkbox"  style="display: inline-block;"> 
   																<input id="item_checkedbox" type="checkbox" autocomplete="off" class="bp" value="${cart.p_name}" checked="checked">   						
   						 									</div>
   														</div>
   													</div>
   													<img >
   												</div>
   												<div  class="CartProductListItem__productInfoTextGroup">
   												<a href="#" class="CartProductListItem__productName" >${cart.p_name}</a> <!-- 상품이름 -->
   												
   												</div>
   												</div>
   												<div class="CartProductListItem__optionInfo">
   													<div class="CartOptionList">
   														<div class="CartOptionListItem">
   															<div class="CartOptionListItem__splitLeft">
   																<em class="CartOptionListItem__optionText"></em>
   																	<div class="CartOptionListItem__counter">
   																		<label class="NumberCounter">
   																			<button type="button" id="NumberCounter__button1"  class="NumberCounter__button" >-</button>
   																			<input  type="text" name="cart_cnt" id="NumberCounter__input" class="NumberCounter__input" value="1" readonly="readonly">
   																			<button type="button" id="NumberCounter__button2" class="NumberCounter__button">+</button>   						
   																		</label>
   																	</div>
   															</div>
   														
   															<div class="CartOptionListItem__splitRight"  >
   																<em class="CartOptionListItem__totalPrice" id="CartArtistItem__Price" ><fmt:formatNumber pattern="###,###,###" value="${cart.p_price}"/></em> <!-- 상품가격 -->
   																
   																<div class="CartOptionListItem__btnGroup">
   																	<div class="CartOptionEditingButtonGroup">
   																		<button id="Delete__button" class="CartOptionEditingButtonGroup__button CartOptionEditingButtonGroup__button--right">
   																		<i class="CartOptionEditingButtonGroup__buttonIcon idus-icon-close">
   																		</i>
   																		</button>
   																	</div>
   																</div> 
   																<br>
   																<em class="CartOptionListItem__totalPrice">예상 적립금 :
   																	<a id="CartArtistItem__Point"></a>
   																</em>  	<!-- 예상적립금 -->													
   															</div>
   														</div>
   													</div>
   												</div>
   						 					</div>
   										</div>
   										
   								</ul>
   							</section>
   							<section class="CartArtistItem__section">
   								<div class="CartArtistItem__label">
   								작품 가격
   								</div>
   								<div class="CartArtistItem__price" id="totalPrice_span" >
   								 <!-- 작품 가격 -->
	   							</div>
   							</section>
   							<section class="CartArtistItem__section">
   								<div class="CartArtistItem__label">
   								배송비
   								</div>
   								<div class="CartArtistItem__price" id="delivery_price" >
   								<!-- 배송비 -->
	   							</div>
   							</section>
   							<div class="vue-sticky-placeholder"></div>
   						</div>   	
					</c:forEach>
   					
   					
   			<div class="vue-sticky-placeholder" style="padding-top: 0px;"></div>		
        	<div  sticky-side="bottom" on-stick="handleChangeStickBottom"class="CartList__sticky vue-sticky-el"  style="position: static; top: auto; bottom: auto; left: auto; width: auto; z-index: 10;">   	
        	<div class="CartCheckboxControl">
        		<div class="checkbox" id="checkbox">
        			<div class="input-checkbox">
        			<input type="checkbox" class="bp" autocomplete="off" id="cart-product-all-check" value="" checked="checked">
        			</div>
        			<label for="cart-product-all-check">
        				<span class="CartCheckboxControl__label">
        				전체 선택 (
            			<span class="CartCheckboxControl__label--bold" id="totalcnt">1</span>
            			/${cartCount}) 
            			</span>
        			</label>
        		</div>
        			<button class="CommonButton CommonButton--middle CommonButton--white" id="cart-product-check-reset" >선택 해제</button>
        	</div>
        		<div class="CartCheckout">
        			<div class="CartCheckoutDesktop">
        				<div class="CartCheckoutDesktop__item">
        					<div class="CartCheckoutDesktop__label">작품금액</div>
        					<div class="CartCheckoutDesktop__value">
        						<span id="totalPrice"></span>
        						<span class="CartCheckoutDesktop__priceUnit">원</span>
        					</div>
        				</div>
        				<div class="CartCheckoutDesktop__item--fixed">+</div>
        				<div class="CartCheckoutDesktop__item">
        					<div class="CartCheckoutDesktop__label">배송비</div>
        					<div class="CartCheckoutDesktop__value">
        						<span id="delivery_price">3,000</span>
        						<span class="CartCheckoutDesktop__priceUnit">원</span>
        					</div>
        				</div>
        				<div class="CartCheckoutDesktop__item--fixed">=</div>
        				<div class="CartCheckoutDesktop__item">
        					<div class="CartCheckoutDesktop__label">결제 예정금액</div>
        					<div class="CartCheckoutDesktop__value--highlight" >
        						<span id="finalTotalPrice_span">18,000</span>
        						<span class="CartCheckoutDesktop__priceUnit">원</span>
        						<em class="CartOptionListItem__totalPrice">적립금 :
   								<a id="totalPoint_span"></a>
   								</em>  	<!-- 예상적립금 -->	
        						
        					</div>
        				</div>
        			</div>
        		</div>
        		
        		<div class="CartPage__bottom">
        		<button type="submit" class="CommonButton CartPage__paymentButton CommonButton--large" onclick = "location.href = '${pageContext.request.contextPath}/memberpay.do'">
        		주문하기
        		</button>
        		</div>
        	</div>
 		</div>
	</div>
</aside>
</main>

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
     
  </body>
</html>