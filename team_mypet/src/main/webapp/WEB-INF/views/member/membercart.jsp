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
	

	//버튼
	$(".NumberCounter__minus").on("click", function(){
		
		let p_idx = $(this).attr("name");
		let cnt_minus = "#NumberCounter__minus"+p_idx;
		let minus = $(cnt_minus).val();

		let cnt_input = "#NumberCounter__input"+p_idx;
		let cntV = $(cnt_input).val();
		
		let cnt = $("#cart_cnt_input").val();
		
			if(cntV > 1){
				$(cnt_input).val(--cntV);
				console.log("minus");
			}
	});
	//버튼
	$(".NumberCounter__plus").on("click", function(){
		
		let p_idx = $(this).attr("name");
		let cnt_plus = "#NumberCounter__plus"+p_idx;
		let plus = $(cnt_plus).val();

		let cnt_input = "#NumberCounter__input"+p_idx;
		let cnt = $("#cart_cnt_input").val();
		let cntV = $(cnt_input).val();
		
				$(cnt_input).val(++cntV);
				console.log("plus");
		
	});
	//cnt -1
	$(".NumberCounter__minus").on("click", function(){
		
		let cart_idx = $(this).data("cart_idx");
		let midx = $("#midx_input").val();
		let p_idx = $("#p_idx_input").val();
		let cart_cnt = $(this).parent().find("input[name='cart_cnt']").val();

		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/updatecnt.do",
			data:{"cart_cnt": cart_cnt,"cart_idx":cart_idx,
					"midx":midx,"p_idx":p_idx},
			success:function(data){
				if(data =="Y"){
					console.log("minus");

				}else{
					console.log("minus x");

				}
			}
		});
	});
	
	//cnt +1
	$(".NumberCounter__plus").on("click", function(){
		
		let cart_idx = $(this).data("cart_idx");
		let midx = $("#midx_input").val();
		let p_idx = $("#p_idx_input").val();
		let cart_cnt = $(this).parent().find("input[name='cart_cnt']").val();
		
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/updatecnt.do",
			data:{"cart_cnt": cart_cnt,"cart_idx":cart_idx,
					"midx":midx,"p_idx":p_idx},
			success:function(data){
				if(data == "Y"){
					console.log("plus");
				}else{
					console.log("plus x");

				}
			}
		});
	});

	
	//삭제
	$(".CartOptionEditingButtonGroup__button").click(function(){
		
		let cart_idx = $(this).attr("name");
		let midx = $("#midx_input").val();
		let CAI = "#CartArtistItem"+cart_idx;
		
		
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/deletecart.do",
			data:{"cart_idx":cart_idx,"midx":midx
			},
			success:function(data){
				if(data == "N"){
					console.log(result);
					alert("삭제놉");
				}else{
					$(CAI).remove();
				}
			}
		});
	});
	
	let cart_idx = $("#cart_idx_input").val();
	let cart_arr = new Array(cart_idx);
	
	let atichk = "#artist_checkedbox"+cart_idx;
	console.log(cart_arr);

	setTotalInfo();
	$(atichk).on("change", function(){
		console.log(atichk);
		setTotalInfo("#CartArtistItem");
	
	});
	//모든 체크 박스 선택
	$("#cart-product-all-check").on("click", function(){
		
		if($("#cart-product-all-check").prop("checked")){
			$("input[type='checkbox']").prop("checked",true);			
		}else{
			$("input[type='checkbox']").prop("checked",false);
		}
	});
	//모든 체크박스가 선택되면 바뀌기..
	$("input[type='checkbox']").on("click",function(){
		
		if($("input[type='checkbox']").prop("checked")){
			$("#cart-product-all-check").prop("checked",true);			
		}else{
			$("#cart-product-all-check").prop("checked",false);
		}
	});
	let chk_arr = new Array();
	$("input[tpye='chekcbox']:checked").each(function(){
		let chk = $(this).val();
		chk_arr.push(chk);
		alert(chk_arr);
	});
	
	
	function setTotalInfo(){
		 
		let cart_idx = $("#cart_idx_input").val();
		let atichk = "#artist_checkedbox"+cart_idx;
		
		let price = $("#p_price_input").val()*1;	// 총 가격
		let cart_idx_cnt = cart_idx.length;
		let cnt = $("#cart_cnt").val();
		let Price = "#price_span"+cart_idx;
		let totalPrice = 0;				// 총 가격
		let totalPoint = 0;				// 총 마일리지
		let deliveryPrice = 0;			// 배송비
		let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
		
		
		$(".CartArtistItem").each(function(index, element){
			
					// 총 가격
					totalPrice += parseInt($(element).Price) * parseInt($(element).cnt);
					// 총 마일리지
					totalPoint += parseInt($(element).Price) * 0.05;	
		
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
		$(Price).text(Price);
		$("#totalPrice").text(totalPrice);
		// 총 마일리지
		$("#totalPoint").text(totalPoint);
		// 배송비
		$("#deliveryPrice").text(deliveryPrice);	
		// 최종 가격(총 가격 + 배송비)
		$("#finalTotalPrice").text(finalTotalPrice);		
	}


});

</script>
 <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->


    <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/cart.css" rel="stylesheet">
    <c:set var="Price" value="0" />
    <c:set var="totaldelPrice" value="0" />
    <c:set var="totalPrice" value="0" />
    
    <style>
    .NumberCounter__minus {
    display: inline-block;
    vertical-align: middle;
    color: #666666;
    font-size: 12px;
    border: 1px solid #ccc;
    width: 24px;
    height: 24px;
    line-height: 24px;
    vertical-align: middle;
    font-weight: bold;
}

.NumberCounter__plus {
    display: inline-block;
    vertical-align: middle;
    color: #666666;
    font-size: 12px;
    border: 1px solid #ccc;
    width: 24px;
    height: 24px;
    line-height: 24px;
    vertical-align: middle;
    font-weight: bold;
}
.NumberCounter__plus {
    border-top-left-radius: 2px;
    border-bottom-left-radius: 2px;
}
.NumberCounter__minus {
    border-top-left-radius: 2px;
    border-bottom-left-radius: 2px;
}
    </style>
  </head>
  
  <body>

    <!-- 헤더와 js************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
	<!-- ************************************************ -->

<main class="content">
<input type="hidden" name="midx" value="${midx}">




<aside>
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
<%--    					<c:if test="${countCart}" var="null" > --%>
<%--    					</c:if> --%>
   					<c:forEach items="${cart}" var="cart" varStatus="status">
   					<c:set var="idx" value="${cart.cart_idx}" />
   					<div class="CartArtistItem" id="CartArtistItem${cart.cart_idx}" name="${cart.cart_idx}">
   					<div>
   					<input type="hidden" id="p_price_input" value="${cart.p_price}">
   					<input type="hidden" id="p_idx_input" value="${cart.p_idx}">
   					<input type="hidden" id="cart_idx_input" value="${cart.cart_idx}">   					
   					<input type="hidden" id="midx_input" value="${cart.midx}">
   					<input type="hidden" id="p_name_input" value="${cart.p_name}">
   					<input type="hidden" id="p_content_input" value="${cart.p_content}">
   					<input type="hidden" id="cart_cnt_input" value="${cart.cart_cnt}">
   					</div>
   						<div class="CartArtistItem__header">
   						<label>
							<div class="checkbox">   							
   								<div class="input-checkbox"  id="input-checkbox1">
   									<input id="artist_checkedbox${cart.cart_idx}" name="${cart.cart_idx}" data-cart_idx="${cart.cart_idx}" type="checkbox" autocomplete="off" class="bp" value="${m_nick}" checked="checked" >
   								</div>
   							</div>
   							<span  class="CartArtistItem__title" >${m_nick}</span> <!-- 작가이름 -->
   						</label>
   						</div>
   							<section class="CartArtistItem__itemList" >
   								<ul>
   									<div class="CartProductList">   						
   										<div class="CartProductListItem" id="CartProductListItem">   						
   											<div class="CartProductListItem__productInfo">   						
			   									<div class="CartProductListItem__checkboxGroup">
   													<div class="CartProductListItem__checkboxWrap" style="display:inline-block;" >			
   														<div class="checkbox">
   															<div class="input-checkbox" id="input-checkbox2"  style="display: inline-block;"> 
   																<input id="item_checkedbox${cart.cart_idx}" name="${cart.cart_idx}" data-cart_idx="${cart.cart_idx}" type="checkbox" autocomplete="off" class="bp" value="${pageContext.request.contextPath}/resources/product/${cart.p_sys_filename}" checked="checked" >   						
   						 									</div>
   														</div>
   													</div>
   													<img src="${pageContext.request.contextPath}/resources/product/${cart.p_sys_filename}">
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
   																			<button type="button" id="NumberCounter__minus${cart.p_idx}" name="${cart.p_idx}" class="NumberCounter__minus"  data-cart_idx="${cart.cart_idx}" >-</button>
   																			<input  type="text" name="cart_cnt" id="NumberCounter__input${cart.p_idx}" class="NumberCounter__input" value="${cart.cart_cnt}" readonly="readonly">
   																			<button type="button" id="NumberCounter__plus${cart.p_idx}" name="${cart.p_idx}" class="NumberCounter__plus"  data-cart_idx="${cart.cart_idx}">+</button>   						
   																		</label>
   																	</div>
   															</div>
   														
   															<div class="CartOptionListItem__splitRight"  >
   																<em class="CartOptionListItem__totalPrice" id="CartArtistItem__Price${cart.cart_idx}"name="${cart.cart_idx}" >개당 금액:<fmt:formatNumber pattern="###,###,###" value="${cart.p_price}"/></em> <!-- 상품가격 -->
   																
   																<div class="CartOptionListItem__btnGroup">
   																	<div class="CartOptionEditingButtonGroup">
   																		<button type="button" id="delete__button${cart.cart_idx}" name="${cart.cart_idx}" class="CartOptionEditingButtonGroup__button CartOptionEditingButtonGroup__button--right" >
   																		 X
   																		</button>
   																	</div>
   																</div> 
<!--    																<em class="CartOptionListItem__totalPrice">예상 적립금 : -->
<!--    																	<a id="CartArtistItem__Point"></a> -->
<!--    																</em>  	예상적립금													 -->
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
   								<div class="CartArtistItem__price" id="totalPrice_span${cart.cart_idx}" name="${cart.cart_idx}">

   								 <!-- 작품 가격 -->
	   							</div>
   							</section>
   							<section class="CartArtistItem__section">
   								<div class="CartArtistItem__label">
   								배송비
   								</div>
   								<div class="CartArtistItem__price" id="delivery_price${cart.cart_idx}" name="${cart.cart_idx}">

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
        			<input type="checkbox" class="bp" autocomplete="off" id="cart-product-all-check" name="${cart_idx}" checked="checked">
        			</div>
        			<label for="cart-product-all-check">
        				<span class="CartCheckboxControl__label">
        				전체 선택 (
            			<span class="CartCheckboxControl__label--bold" id="totalcnt">1</span>
            			/${countCart}) 
            			</span>
        			</label>
        		</div>
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
        						<span id="delivery_price"></span>
        						<span class="CartCheckoutDesktop__priceUnit">원</span>
        					</div>
        				</div>
        				<div class="CartCheckoutDesktop__item--fixed">=</div>
        				<div class="CartCheckoutDesktop__item">
        					<div class="CartCheckoutDesktop__label">결제 예정금액</div>
        					<div class="CartCheckoutDesktop__value--highlight" >
        						<span id="finalTotalPrice_span"></span>
        						<span class="CartCheckoutDesktop__priceUnit">원</span>
        						<em class="CartOptionListItem__totalPrice">적립금 :
   								<a id="totalPoint_span" ></a>
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