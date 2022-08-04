<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script type="text/javascript">
$(document).ready(function(){

	memberCartHeader();
	
})

  function memberCartHeader(){
	  
		$.ajax({
			url : "/member/memberCartHeader",
			type : "get",
			dataType : "json",
			success : function(list){
			var s ='';
			var headersum = 0 ;
			if(list<1){
				s += '<div style="text-align:center"><h3>쇼핑백이 비었습니다</h3></div>' ;
			}
			
			$.each(list, function(key,value){
				var p_price = parseInt(value.productVO.p_price);
				var price = new Intl.NumberFormat('ko-KR', {
					style : 'currency',
					currency : 'KRW'
				}).format(p_price);
				
				var cart_idx = parseInt(value.cart_idx);
                
                s +=	'<li><a onclick="cartHeaderDel('+cart_idx+');" class="remove" title="Remove this item"><i class="lni lni-close"></i></a>';
                s +=	'<div class="cart-img-head"><a class="cart-img" href="${pageContext.request.contextPath}/product/productContent?p_idx='+value.productVO.p_idx+'">';
                s +=    '<img src="resources/assets/images/products/'+value.product_imgVO.p_sys_filename+'" alt="#"></a></div>';
                s +=	'<div class="content"><h4><a href="/product/productContent?p_idx='+value.productVO.p_idx+'">'+value.productVO.p_name+'</a></h4>';
                s +=	'<p class="quantity">1x - <span class="amount">'+price+'</span></p></div></li>';
               
                
                
                
                
                headersum = headersum + parseInt(p_price);
			});
			
			var cartTotal = new Intl.NumberFormat('ko-KR', {
				style : 'currency',
				currency : 'KRW'
			}).format(headersum);
			
			
			$("#cartPrice").html(cartTotal);
			$("#cartView").html(s);
			
			}
		})
	    
	    
  }

function cartHeaderDel(cart_idx){
	 
	$.ajax({
		url : "/member/cartDelete",
		type : "post",
		dataType : "json",
		data : {"cart_idx" : cart_idx},
		success : function(data){
			cartHeaderView();
			toastr.options.preventDuplicates = true;
			toastr.success("삭제완료");
		}
	})
}


</script>
<div class="cart-items">
      <a href="javascript:void(0)" class="main-btn">
      <i class="lni lni-cart"></i>
       <span class="total-items">2</span>
      </a>
<div class="shopping-item">
	<div class="dropdown-cart-header">
		<span>2 Items</span>
			<a href="${pageContext.request.contextPath}/member/memberCartHeader">View Cart</a>
	</div>
	<ul class="shopping-list" id="cartView">
		
	</ul>
	<div class="bottom">
		<div class="total">
			<span>Total</span>
			<span class="cartPrice"></span>
		</div>
		<div class="button">
			<a href="${pageContext.request.contextPath}/member/membercart.do" class="btn animate">Checkout</a>
		</div>
	</div>
</div>
</div>
<script src="resources/assets/js/carHeader.js"></script>
