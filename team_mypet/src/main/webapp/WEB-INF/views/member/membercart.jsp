<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html> 
  <head>

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

<main >
<aside class="container">
		<div class="CartPage">
      		<div class="PageHeader"> 
   				<h2 class="PageHeader__title">
   				장바구니</h2>
   					<ol class="PageHeader__step">
   						<li class="PageHeader__stepsItem PageHeader__stepsItem--active">
   						<em>1.</em>
   						<span>장바구니</span>
   						
   						</li>
   						<li class="PageHeader__stepsItem PageHeader__stepsItem--active">
   						<em>2.</em>
   						<span>주문결제</span>
   						
   						</li>
   						
   					</ol>
   					</div>
   				<div class="CartArtistList">
   					<div class="vue-sticky-placeholder" style="padding-top: 0px;"></div>
   					<div class="CartList__sticky vue-sticky-el" style="position: static; top: auto; bottom: auto; left: auto; width: auto; z-index: 201;"></div>
   					<div class="CartArtistItem">
   						<div class="CartArtistItem__header">
   						<label>
							<div class="checkbox">   							
   							<div class="input-checkbox">
   							<input id="" type="checkbox" autocomplete="off" class="bp" value="">
   							</div>
   							</div>
   							<span  class="CartArtistItem__title">디디얌 작가님</sqan>
   						</label>
   						</div>
   							<section class="CartArtistItem__itemList">
   								<ul>
   									<div class="CartProductList">   						
   										<div class="CartProductListItem">   						
   											<div class="CartProductListItem__productInfo">   						
			   									<div class="CartProductListItem__checkboxGroup">
   													<div class="CartProductListItem__checkboxWrap" style="display: inline-block;">			
   														<div class="checkbox">
   															<div class="input-checkbox"  style="display: inline-block;"> 
   																<input id="" type="checkbox" autocomplete="off" class="bp" value="ㅎㅇㅎㅇ">   						
   						 									</div>
   														</div>
   													</div>
   													<img>
   												</div>
   												<div data-v-2389adcc  class="CartProductListItem__productInfoTextGroup">
   												<a href="#" class="CartProductListItem__productName">ㅎㅇㅎㅇ</a>
   												
   												</div>
   												</div>
   												<div class="CartProductListItem__optionInfo">
   													<div class="CartOptionList">
   														<div class="CartOptionListItem">
   															<div class="CartOptionListItem__splitLeft">
   																<em class="CartOptionListItem__optionText"></em>
   																	<div class="CartOptionListItem__counter">
   																		<label class="NumberCounter">
   																			<button type="button" disabled="disabled" class="NumberCounter__button" onclick="">-</button>
   																			<input name="cart_cnt" type="text" class="NumberCounter__input" value="0" readonly>
   																			<button type="button" class="NumberCounter__button">+</button>   						
   																		</label>
   																	</div>
   															</div>
   														
   															<div class="CartOptionListItem__splitRight">
   																<em class="CartOptionListItem__totalPrice">12,000원</em>
   																<div class="CartOptionListItem__btnGroup">
   																	<div class="CartOptionEditingButtonGroup">
   																		<button class="CartOptionEditingButtonGroup__button CartOptionEditingButtonGroup__button--right">
   																		<i class="CartOptionEditingButtonGroup__buttonIcon idus-icon-close">
   																		</i>
   																		</button>
   																	</div>
   																</div>   														
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
   								<div class="CartArtistItem__price">
   								1231223원
	   							</div>
   							</section>
   							<section class="CartArtistItem__section">
   								<div class="CartArtistItem__label">
   								배송비
   								</div>
   								<div class="CartArtistItem__price">
   								3,000원
	   							</div>
   							</section>
   							<div class="vue-sticky-placeholder"></div>
   						</div>   	
			        
   					
   					
   					
   					
   			<div class="vue-sticky-placeholder" style="padding-top: 0px;"></div>		
        	<div  sticky-side="bottom" on-stick="handleChangeStickBottom"class="CartList__sticky vue-sticky-el"  style="position: static; top: auto; bottom: auto; left: auto; width: auto; z-index: 10;">
        	
        	<div class="CartCheckboxControl">
        		<div class="checkbox">
        			<div class="input-checkbox">
        			<input type="checkbox" class="bp" autocomplete="off" id="cart-product-all-check" value="">
        			</div>
        			<label for="cart-product-all-check">
        				<span class="CartCheckboxControl__label">
        				전체 선택 (
            			<span class="CartCheckboxControl__label--bold">1</span>
            			/1)
            			</span>
        			</label>
        		</div>
        			<button class="CommonButton CommonButton--middle CommonButton--white " >선택 삭제</button>
        	</div>
        		<div class="CartCheckout">
        			<div class="CartCheckoutDesktop">
        				<div class="CartCheckoutDesktop__item">
        					<div class="CartCheckoutDesktop__label">작품금액</div>
        					<div class="CartCheckoutDesktop__value">
        						<span>15,000</span>
        						<span class="CartCheckoutDesktop__priceUnit">원</span>
        					</div>
        				</div>
        				<div class="CartCheckoutDesktop__item--fixed">+</div>
        				<div class="CartCheckoutDesktop__item">
        					<div class="CartCheckoutDesktop__label">배송비</div>
        					<div class="CartCheckoutDesktop__value">
        						<span>3,000</span>
        						<span class="CartCheckoutDesktop__priceUnit">원</span>
        					</div>
        				</div>
        				<div class="CartCheckoutDesktop__item--fixed">=</div>
        				<div class="CartCheckoutDesktop__item">
        					<div class="CartCheckoutDesktop__label">결제 예정금액</div>
        					<div class="CartCheckoutDesktop__value--highlight">
        						<span>18,000</span>
        						<span class="CartCheckoutDesktop__priceUnit">원</span>
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


</aside>
</main>

<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
     
  </body>
</html>