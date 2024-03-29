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

		
		  
		  
		  
		  
	//-버튼
	$(".NumberCounter__minus").on("click", function(){
		
		let cart_idx = $(this).attr("name");
		let cnt_minus = "#NumberCounter__minus"+cart_idx;
		let minus = $(cnt_minus).val();

		let cnt_input = "#NumberCounter__input"+cart_idx;
		let cntV = $(cnt_input).val();
		
		let cnt = $("#cart_cnt_input").val();
		
			if(cntV > 1){
				$(cnt_input).val(--cntV);
			}
	});
	//+버튼
	$(".NumberCounter__plus").on("click", function(){
		
		let cart_idx = $(this).attr("name");
		let cnt_plus = "#NumberCounter__plus"+cart_idx;
		let plus = $(cnt_plus).val();

		let cnt_input = "#NumberCounter__input"+cart_idx;
		let cnt = $("#cart_cnt_input").val();
		let cntV = $(cnt_input).val();
		
				$(cnt_input).val(++cntV);
		
	});
	//cnt -1
	$(".NumberCounter__minus").on("click", function(){
		
		let cart_idx = $(this).data("cart_idx");
		let midx_input = $('input[id="midx_input"]');
		let midx = $(midx_input).val();
		let p_idx_input = $('input[id="p_idx_input"]');
		let p_idx = $(p_idx_input).val();

		let cart_cnt = $(this).parent().find('input[name="cart_cnt"]').val();
		let p_price=$(this).val();
		let c_price=p_price*cart_cnt;
		//c_price=c_price.toLocaleString();
		str="<input type='hidden' id='seller_price" + cart_idx + "' value='"+c_price  +"'>"+c_price.toLocaleString();

		
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/updatecnt.do",
			data:{"cart_cnt": cart_cnt,"cart_idx":cart_idx,
					"midx":midx,"p_idx":p_idx},
			success:function(data){
				if(data =="Y"){
					console.log("minus");
					//상품당 총가격 계산
					document.getElementById('CartArtistItem__Price'+cart_idx).innerHTML = "";
					document.getElementById('CartArtistItem__Price'+cart_idx).innerHTML=str;
					//셀러당 총가격 계산
					seller_itemTotal(this,cart_idx);
					//최종 총가격 계산
					itemTotal();
					
					if(document.getElementById('seller_price'+cart_idx).value-document.getElementById('itemFreeDvPrice'+cart_idx).value<0)
		        	{
		        		var mstr=document.getElementById('itemDvPrice'+cart_idx).value.toLocaleString()+"원"; 
						document.getElementById('message'+cart_idx).innerHTML = "";
					 	document.getElementById('message'+cart_idx).innerHTML=mstr;
					 	
		        	}
					
					
				}else{
					console.log("minus x");

				}
			}
		});
	});
	
	//cnt +1
	$(".NumberCounter__plus").on("click", function(){
		
		let cart_idx = $(this).data("cart_idx");
		let midx_input = $('input[id="midx_input"]');
		let midx = $(midx_input).val();
		let p_idx_input = $('input[id="p_idx_input"]');
		let p_idx = $(p_idx_input).val();
		
		let cart_cnt = $(this).parent().find('input[name="cart_cnt"]').val();
		
		//상품당 총가격 계산
		let p_price=$(this).val();
		//alert(p_price);
		//alert(cart_cnt);
		let c_price=p_price*cart_cnt;
		//c_price=c_price.toLocaleString();
		//alert(c_price);
		
		str="<input type='hidden' id='seller_price" + cart_idx + "' value='"+c_price  +"'>"+c_price.toLocaleString();
		
		//alert(str);
		
		
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/updatecnt.do",
			data:{"cart_cnt": cart_cnt,"cart_idx":cart_idx,
					"midx":midx,"p_idx":p_idx},
			success:function(data){
				if(data == "Y"){
					console.log("plus");
					
					
					//상품당 총가격 계산
					document.getElementById('CartArtistItem__Price'+cart_idx).innerHTML = "";
					document.getElementById('CartArtistItem__Price'+cart_idx).innerHTML=str;
					
					//셀러당 총가격 계산
					seller_itemTotal(this,cart_idx);
					
					//최종 총가격 계산
					itemTotal();
					//alert(document.getElementById('seller_price'+cart_idx).value);
					//alert(document.getElementById('itemFreeDvPrice'+cart_idx).value);
					//alert(document.getElementById('seller_price'+cart_idx).value-document.getElementById('itemFreeDvPrice'+cart_idx).value);
					if(document.getElementById('seller_price'+cart_idx).value-document.getElementById('itemFreeDvPrice'+cart_idx).value>=0)
	        		{
							var mstr=""; 
							document.getElementById('message'+cart_idx).innerHTML = "";
						 	document.getElementById('message'+cart_idx).innerHTML="무료배송";
	 	
	        			 
	        		}
					
					
				}else{
					console.log("plus x");

				}
			}
		});
	});
	
	
	//삭제
	$(".CartOptionEditingButtonGroup__button").click(function(){
		
		let cart_idx = $(this).attr("name");
		//alert(cart_idx);
		let midx = $("#midx_input").val();
		let CAI = "#CartArtistItem__itemList"+cart_idx;
		//alert(CAI);

		
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
					alert("삭제하였습니다");
					$(CAI).remove();
				}
			}
		});
	});
	
	
	//모든 체크 박스 선택
	$("#cart-product-all-check").on("click", function(){
		 
		if($("#cart-product-all-check").prop("checked")){
			$("input[type='checkbox']").prop("checked",true);			
		}else{
			$("input[type='checkbox']").prop("checked",false);
		}
		//셀러별 상품가격 업데이트
		 $("input[type='checkbox']").each(function(){
			if($(this).data('checked_cart_idx') != null)
				{
					
					
					seller_itemTotal(this, $(this).data('checked_cart_idx'))
				}
		}); 
		
		//전체 상품가격 업데이트
		itemTotal();
		
	});
	//모든 개별 체크박스가 선택되면 모든 체크박스 바꾸기
	$("input[type='checkbox']").on("click", function(){
		 
		let totalCheckbox=0;
		let totalChecked =0;
		$("input[type='checkbox']:checked").each(function(){
			totalChecked++;
		});
		$("input[type='checkbox']").each(function(){
			totalCheckbox++;
		});
		
		if($('#cart-product-all-check').is(':checked') == true && totalCheckbox != totalChecked){
			//alert(totalChecked+":"+totalCheckbox+":"+$('#cart-product-all-check').is(':checked'));
			$("#cart-product-all-check").prop("checked",false);	
		}
		else if($('#cart-product-all-check').is(':checked') == false && (totalChecked+1)==totalCheckbox)
		{
			
			$("#cart-product-all-check").prop("checked",true);	
			
		}
		//셀러별 상품가격 업데이트
		$("input[type='checkbox']").each(function(){
			if($(this).data('checked_cart_idx') != null)
				{
					
					
					seller_itemTotal(this, $(this).data('checked_cart_idx'))
				}
		});
		//전체 상품가격 업데이트
		itemTotal();
		
		
		
	});
	
	
		
	
});

		
		//전체 상품가격 구하기
		function itemTotal()
		{
			
			var totalProductPrice=0;
			var totalDvPrice=0;
			$("input[type='checkbox']:checked").each(function(){
				if($(this).data('checked_cart_idx') != null)
					{
						//alert(getElementById('seller_price'+$(this).data('checked_cart_idx')).value);
						totalProductPrice+=parseInt(document.getElementById('seller_price'+$(this).data('checked_cart_idx')).value);
					//alert("ewfaesdrfvcuhsduovhbduj : "+document.getElementById('seller_price'+$(this).data('checked_cart_idx')).value);
						
						
						//배송비 구하기
			        	if(parseInt(document.getElementById('seller_price'+$(this).data('checked_cart_idx')).value)>=parseInt(document.getElementById('itemFreeDvPrice'+$(this).data('checked_cart_idx')).value))
			        		{
			        			totalDvPrice+=0;
									
			        			
			        		}
			        	else{
			        		totalDvPrice+=parseInt(document.getElementById('itemDvPrice'+$(this).data('checked_cart_idx')).value);
			        		
			        	}
			        	
						
						
						
					}
				//alert("asdf"+$(this).data('checked_cart_idx'));
				//alert("체크박스 값"+$(this)..data('checked_cart_idx'));
				//alert(totalProductPrice);
				 str="<span id='totalPrice' name='totalPrice'></span><span class='CartCheckoutDesktop__priceUnit'><input type='hidden' id='totalProduct' name='totalProduct' value='"+totalProductPrice  +"'>"+totalProductPrice.toLocaleString()+"원</span>";
					document.getElementById('CartCheckoutDesktop__value').innerHTML = "";
				 	document.getElementById('CartCheckoutDesktop__value').innerHTML=str ;
				 	
				 //배송비
				 	var str2="<span id='delivery_Price' name='delivery_Price'></span><span class='CartCheckoutDesktop__priceUnit'><input type='hidden' id='totaldvprice'  name='totaldvprice'  value='"+totalDvPrice+"'>"+totalDvPrice.toLocaleString()+"원</span>"
				  	document.getElementById('CartCheckoutDesktop__valueDV').innerHTML = "";
					document.getElementById('CartCheckoutDesktop__valueDV').innerHTML=str2 ;
				 //전체 가격
				 	var total=totalDvPrice+totalProductPrice;
				// alert(total);
					var str3="<input type='hidden' id='totalprice'  name='totalprice'  value=''>"+total.toLocaleString()+"원";
				  	document.getElementById('total_Price').innerHTML = "";
					document.getElementById('total_Price').innerHTML=str3 ;
			});
			//alert("전체"+totalProductPrice);
			if(totalProductPrice==0)
				{
				str="<span id='totalPrice' name='totalPrice'></span><span class='CartCheckoutDesktop__priceUnit'><input type='hidden' id='totalProduct' name='totalProduct'  value='0'>0원</span>";
				document.getElementById('CartCheckoutDesktop__value').innerHTML = "";
			 	document.getElementById('CartCheckoutDesktop__value').innerHTML="0원";
			 	document.getElementById('CartCheckoutDesktop__valueDV').innerHTML = "";
				document.getElementById('CartCheckoutDesktop__valueDV').innerHTML="0원" ;
				document.getElementById('total_Price').innerHTML = "";
				document.getElementById('total_Price').innerHTML="0원" ;
				}
			
			
			
			
			
		}
		
		
		
		
		
		//셀러당 총가격 구하기
		function seller_itemTotal(obj, cart_idx)
		{
			//alert("여기는 셀러 총가격");
			//이 아이템의 체크박스 접근
			const item="item_checkedbox"+cart_idx;
			//alert(item);
			 const checkbox = document.getElementById(item);
			//alert(checkbox.value);
			//seller_idx 구하기 
			const seller_idx=checkbox.value;
			//let seller_price=p_price*cart_cnt;
			//seller_price=c_price.toLocaleString();
			//alert(seller_idx);
			  //체크박스의 checked 속성을 체크합니다.
			  //var is_checked = checkbox.checked;
			  //alert(is_checked);
			 // totalPrice_span${seller.seller_idx}
			 //seller_dvPrice${seller.seller_idx}
			 //셀러의 아이템들의 체크박스들 접근하기
			 const checkboxes 
		     = document.getElementsByName('item_checkedbox'+seller_idx);
			 //alert("seller_price:"+seller_price);
			 //셀러의 아이템들이 체크박스를 돌면서 체크돼어있는 아이템들의 총가격만 계산하기
			 var seller_price=0;
			 var seller_dvprice=0;
			 //1.체크박스 돌기
			 for(var i = 0; i < document.getElementsByName('item_checkedbox'+seller_idx).length; i++){
				 //var seller_price=0;	
				 //2.체크돼있는 체크박스일 경우
				 	//alert(document.getElementsByName('item_checkedbox'+seller_idx)[i].checked);
			        if(document.getElementsByName('item_checkedbox'+seller_idx)[i].checked == true){
			        	
			        	//checked++;
			        	//alert(document.getElementsByName('item_checkedbox'+seller_idx)[i].dataset.checked_cart_idx);
			        	//3.해당 아이템의 카트번호 구하기
			        	check_cart=document.getElementsByName('item_checkedbox'+seller_idx)[i].dataset.checked_cart_idx;
			        	//alert(document.getElementById('CartArtistItem__Price'+cart_idx);)
			        	//alert(Number(document.getElementById('seller_price'+check_cart).value)+9);
			        	var c_price = 0;
			        	c_price = parseInt(document.getElementById('seller_price'+check_cart).value);
			        	//alert("개당 가격"+c_price);
			        	seller_price=seller_price+c_price;
			        	 //document.getElementById('seller_totalPrice'+seller_idx).innerHTML = "";
			        	 //document.getElementById('seller_totalPrice'+seller_idx).innerHTML = seller_price;
			        	 //alert("for_ seller_price:"+seller_price);
			        	 
			        	 //alert("cart_idx:"+check_cart+"~"+seller_price);
			        	 
			        	 
						//배송비 구하기
						var c_dvprice=0;
						c_dvprice = parseInt(document.getElementById('itemDvPrice'+check_cart).value);
			        	var c_free_dvprice=0;
			        	c_free_dvprice = parseInt(document.getElementById('itemFreeDvPrice'+check_cart).value);
			        	//alert(c_dvprice);
			        	if(c_price>=c_free_dvprice)
			        		{
			        			c_dvprice=0;
			        		}
			        	 
			        	seller_dvprice=seller_dvprice+c_dvprice;
			        	
			        }
			 }
			  str="<input type='hidden' id='seller_totalPrice" + seller_idx + "' value='"+seller_price  +"'>";
			  document.getElementById('totalPrice_span'+seller_idx).innerHTML = "";
			  document.getElementById('totalPrice_span'+seller_idx).innerHTML=str ;
				
				//alert("seller"+seller_price);
			 	if(seller_price==0)
				{
			 		//str="<input type='hidden' id='seller_totalPrice" + seller_idx + "' value='0'>0";

					  document.getElementById('totalPrice_span'+seller_idx).innerHTML = "";
					  document.getElementById('totalPrice_span'+seller_idx).innerHTML="" ;
						
				}
			 	//alert("총"+seller_dvprice);
			  //const perTotalPrice = "CartArtistItem__Price"+cart_idx;
			  //$(perTotalPrice).val('500');
			 		 var str2="<input type='hidden' id='seller_dvPrice" + seller_idx + "' value='"+seller_dvprice  +"'>";
			  	/* 	document.getElementById('delivery_price'+seller_idx).innerHTML = "";
					document.getElementById('delivery_price'+seller_idx).innerHTML="ertg" ;
						alert(seller_dvprice);
			   */
			 // alert(checkbox.value);
			//alert($(obj).val());
		}
		



		
		
		
		

		//개별체크박스 누를때? 뭐더라?
		function checkSelectProduct(seller_idx)  {
			//alert(seller_idx);
			
			  // 셀러 전체 체크박스
			 const checkboxes 
			     = document.getElementsByName('item_checkedbox'+seller_idx);
			  // 셀러 내 선택된 체크박스 수 구하기
			  var checked =0;
			  for(var i = 0; i < document.getElementsByName('item_checkedbox'+seller_idx).length; i++){
			        if(document.getElementsByName('item_checkedbox'+seller_idx)[i].checked == true){
			        	checked++;
			        	
			        }
			    }
			  
			  // select all 체크박스
			  const selectAll 
			    = document.getElementsByName('artist_checkedbox'+seller_idx);
			  			  
			  //alert(checkboxes.length);
			  //alert(checked);
			  
			  if(checkboxes.length === checked)  {
				  document.getElementsByName('artist_checkedbox'+seller_idx)[0].checked = true;
			  }else {
				  document.getElementsByName('artist_checkedbox'+seller_idx)[0].checked = false;
			  }
		
			}
		
			//셀러 체크박스 누르면 해당 셀러의 상품 체크박스 모두 변
			function selectSeller(selectAll,seller_idx)  {
			  const checkboxes 
			     = document.getElementsByName('item_checkedbox'+seller_idx);
			  //alert(checkboxes.length);
			  checkboxes.forEach((checkbox) => {
			    checkbox.checked = selectAll.checked
			  })
			  
			}
			
			
			
			function cart_idxArr()
			{
				
				var c_idxArr=[];
				$("input[type='checkbox']:checked").each(function(){
					if($(this).data('checked_cart_idx') != null)
						{
						c_idxArr.push($(this).data('checked_cart_idx'));
							
							alert($(this).data('checked_cart_idx'));
						}
				});
				
				$("#c_idxArr").val(c_idxArr);
				
				
				var fm = document.frm;   
				
				if(fm.totalProduct.value=="0")
				{
					alert("담긴 상품이 없습니다.");
					return;
				}
				
				
				
				alert("전송합니다..");
		  		//fm.action = "./memberJoinOk.jsp";
		  		//가상경로 사용 ${pageContext.request.contextPath}/registProcess.do
		  		fm.action = "<%=request.getContextPath()%>/memberpay.do";
		  		fm.method = "get";
		  		fm.submit();  
		  
		    return;
			}
			
	
</script>
 <!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->


    <!-- Bootstrap core CSS -->
    
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/cart.css" rel="stylesheet">
    
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
<div id="wrap">
<main class="container">
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
   				<form name="frm" >
   				
   				<div class="CartArtistList" id="CartArtistList">
   					<div class="vue-sticky-placeholder" style="padding-top: 0px;"></div>
   					<div class="CartList__sticky vue-sticky-el" style="position: static; top: auto; bottom: auto; left: auto; width: auto; z-index: 201;"></div>
<%--    					<c:if test="${countCart}" var="null" > --%>
<%--    					</c:if> --%>
					<!-- seller별로 -->
					<c:forEach items="${cartSellerList}" var="seller">
						
						
						<div class="CartArtistItem" id="CartArtistItem${seller.seller_idx}" data-cart_idx="${seller.seller_idx}">
		   					
		   					 <div class="CartArtistItem__header">
		   						<label>
									<div class="checkbox">   							
		   								<div class="input-checkbox"  id="input-checkbox1">
		   									<input type="checkbox" id="artist_checkedbox${seller.seller_idx}" name="artist_checkedbox${seller.seller_idx}" data-cart_idx="${seller.seller_idx}"  autocomplete="off" class="bp" value="${m_nick}" onclick='selectSeller(this,${seller.seller_idx})' checked="checked" >
		   								</div>
		   							</div>
		   							<span  class="CartArtistItem__title" >${seller.m_nick}</span> <!-- 작가이름 -->
		   						</label>
	   						</div>
	   						
	   						<!-- 상품별로  -->
	   						<c:forEach items="${cart}" var="cart" varStatus="status">
	   							<c:if test="${seller.seller_idx eq cart.seller_idx}">
	   								<section class="CartArtistItem__itemList" id ="CartArtistItem__itemList${cart.cart_idx}">
	   							<input type="hidden" id="p_price_input"  value="${cart.p_price}">
			   					<input type="hidden" id="p_idx_input" value="${cart.p_idx}">
			   					<input type="hidden" id="cart_idx_input" value="${cart.cart_idx}">   					
			   					<input type="hidden" id="midx_input" value="${cart.midx}">
			   					<input type="hidden" id="p_name_input" value="${cart.p_name}">
<%-- 			   					<input type="hidden" id="p_content_input" value="${cart.p_content}">
 --%>			   					<input type="hidden" id="cart_cnt_input" value="${cart.cart_cnt}">
			   					<input type="hidden" id="total_price_input${cart.cart_idx}"value="${cart.p_price * cart.cart_cnt}">
			   								<ul>
			   									<div class="CartProductList">   						
			   										<div class="CartProductListItem" id="CartProductListItem">   						
			   											<div class="CartProductListItem__productInfo">   						
						   									<div class="CartProductListItem__checkboxGroup">
			   													<div class="CartProductListItem__checkboxWrap" style="display:inline-block;" >			
			   														<div class="checkbox">
			   															<div class="input-checkbox" id=""  style="display: inline-block;"> 
			   																<input type="checkbox" id="item_checkedbox${cart.cart_idx}" name="item_checkedbox${seller.seller_idx}" data-checked_cart_idx="${cart.cart_idx}" data-cart_idx="${cart.cart_idx}"  autocomplete="off" class="bp" value="${seller.seller_idx}" onclick='checkSelectProduct(${seller.seller_idx})' checked="checked" >   						
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
			   																			<button type="button" id="NumberCounter__minus${cart.cart_idx}" name="${cart.cart_idx}" class="NumberCounter__minus" value="${cart.p_price}" data-cart_idx="${cart.cart_idx}" >-</button>
			   																			<input  type="text" name="cart_cnt" id="NumberCounter__input${cart.cart_idx}" class="NumberCounter__input" value="${cart.cart_cnt}" readonly="readonly" >
			   																			<button type="button" id="NumberCounter__plus${cart.cart_idx}" name="${cart.cart_idx}" class="NumberCounter__plus" value="${cart.p_price}" data-cart_idx="${cart.cart_idx}" >+</button>   						
			   																		</label>
			   																	</div>
			   															</div>
			   														
			   															<div class="CartOptionListItem__splitRight"  >
			   																<em class="CartOptionListItem__totalPrice" id="CartArtistItem__Price${cart.cart_idx}" name="${cart.p_price}"><input type="hidden" id='seller_price${cart.cart_idx}' value='${cart.c_price}'><fmt:formatNumber pattern="###,###,###" value="${cart.c_price}"/></em> <!-- 상품가격 -->
			   																
			   																<div class="CartOptionListItem__btnGroup">
			   																	<div class="CartOptionEditingButtonGroup">
			   																		<button  id="delete__button${cart.cart_idx}" name="${cart.cart_idx}" class="CartOptionEditingButtonGroup__button CartOptionEditingButtonGroup__button--right" >
			   																		 X
			   																		</button>
			   																	</div>
			   																</div> 
			<!--    																<em class="CartOptionListItem__totalPrice">예상 적립금 : -->
			<!--    																	<a id="CartArtistItem__Point"></a> -->
			<!--    																</em>  	예상적립금													 -->
			   															</div>
			   															
			   														</div>
			   														<section class="CartArtistItem__section">
			   															<input type="hidden" id="itemFreeDvPrice${cart.cart_idx}" value="${cart.p_free_dvprice}">
			   															<div class="dvPrice" id="itemDvPrices${cart.cart_idx}"">
			   															<input type="hidden" id="itemDvPrice${cart.cart_idx}" value="${cart.p_dvprice}">
			   															</div>
			   															<div><fmt:formatNumber pattern="###,###,###" value="${cart.p_free_dvprice}"/>원 이상 구매시 무료배송</div>
			   															<div id="message${cart.cart_idx}">
			   																<c:if test="${cart.p_free_dvprice<=cart.c_price}">무료배송</c:if>
			   																<c:if test="${cart.p_free_dvprice>cart.c_price}">
			   																	<fmt:formatNumber pattern="###,###,###" value="${cart.p_dvprice}"/>원
			   																</c:if>
			   															</div> 
			   															</section>
			   													</div>
			   												</div>
			   						 					</div>
			   										</div>
			   										
			   								</ul>
			   						</section>
	   								
	   								
	   								
	   							</c:if>
	   							
	   							
	   							
	   						</c:forEach>
	   						
	   						<section class="">
		   								<div class="">
		   								<!-- 작품 가격 -->
		   								</div>
		   								<div class="CartArtistItem__price" id="totalPrice_span${seller.seller_idx}" >
											<input type="hidden" id="seller_totalPrice${seller.seller_idx}" value="${seller.seller_price}"><%-- <fmt:formatNumber pattern="###,###,### 원" value="${seller.seller_price}" /> --%>  
											
		   								 <!-- 작품 가격 -->
			   							</div>
		   							</section>
		   							<section class="">
		   								<div class="">
		   								<!-- 배송비 -->
		   								</div>
		   								<div class="CartArtistItem__point" id="delivery_price${seller.seller_idx}">
											<input type="hidden" id="seller_dvPrice${seller.seller_idx}" value="${seller.p_dvprice}">
		   								<!-- 배송비 -->
			   							</div>
			   							
		   					</section>
		   					
		   					<div class="vue-sticky-placeholder"></div>
		   				</div> 	
		   							
						
						
						
						
						
					
					</c:forEach>
					
					
   					
   					
   					
   			<div class="vue-sticky-placeholder" style="padding-top: 0px;"></div>		
        	<div  sticky-side="bottom" on-stick="handleChangeStickBottom"class="CartList__sticky vue-sticky-el"  style="position: sticky; top: auto; bottom: 0px; left: auto; width: auto; z-index: 10;">   	
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
        					<div class="CartCheckoutDesktop__value" id="CartCheckoutDesktop__value">
        						<span id="totalPrice" name="totalPrice"></span>
        						<span class="CartCheckoutDesktop__priceUnit"><input type='hidden' id='totalProduct'  name='totalProduct'  value='${ProductPriceMap.totalproductprice }'><fmt:formatNumber pattern="###,###,### 원" value="${ProductPriceMap.totalproductprice}" /></span>
        					</div>
        				</div>
        				<div class="CartCheckoutDesktop__item--fixed">+</div>
        				<div class="CartCheckoutDesktop__item">
        					<div class="CartCheckoutDesktop__label">배송비</div>
        					<div class="CartCheckoutDesktop__value"  id="CartCheckoutDesktop__valueDV">
        						<span id="delivery_Price" name="delivery_Price"></span>
        						<span class="CartCheckoutDesktop__priceUnit"><input type='hidden' id='totaldvprice'  name='totaldvprice'  value='${ProductPriceMap.totaldvprice }'><fmt:formatNumber pattern="###,###,### 원" value="${ProductPriceMap.totaldvprice}" /></span>
        					</div>
        				</div>
        				<div class="CartCheckoutDesktop__item--fixed">=</div>
        				<div class="CartCheckoutDesktop__item">
        					<div class="CartCheckoutDesktop__label">결제 예정금액</div>
        					<div class="CartCheckoutDesktop__value--highlight" >
        						<span id="finalTotalPrice_span"  name="finalTotalPrice">
        						</span>
        						<span class="CartCheckoutDesktop__priceUnit" id="total_Price"><input type='hidden' id='totalprice'  name='totalprice'  value='${ProductPriceMap.totalprice }'><fmt:formatNumber pattern="###,###,### 원" value="${ProductPriceMap.totalprice}" /></span>
<!--         						<em class="CartOptionListItem__totalPrice">적립금 :
 -->   								<a id="totalPoint_span" name="totalPoint"></a>
   								</em>  	<!-- 예상적립금 -->	
        						
        					</div>
        				</div>
        			</div>
        		</div>
        		
        		<div class="CartPage__bottom">
<%--         		<button type="submit" class="CommonButton CartPage__paymentButton CommonButton--large" onclick = "location.href = '${pageContext.request.contextPath}/memberpay.do'">
 --%>        		주문하기
        		</button>
        		</div>
        	</div>
 		</div>
 		<input type="hidden" id="c_idxArr" name="c_idxArr">
 		<input type="button" class="CommonButton CartPage__paymentButton CommonButton--large" value="등록" onclick="cart_idxArr();"> 
		</form>
		
		
	</div>
</aside>
</main>
</div>




<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
     
  </body>
</html>