<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script type="text/javascript">
$(document).ready(function(){

	cartHeaderView();
	
})

  function cartHeaderView(){
	  
		$.ajax({
			url : "${pageContext.request.contextPath}/cartHeaderView",
			type : "post",
			dataType : "json",
			success : function(list){
			var s ='';
			var headersum = 0 ;
			if(list<1){
				s += '<div style="text-align:center"><h3>쇼핑백이 비었습니다</h3></div>' ;
			}
			
			$.each(list, function(key,value){
				var p_price = parseInt(value.cartVo.p_price);
				var price = new Intl.NumberFormat('ko-KR', {
					style : 'currency',
					currency : 'KRW'
				}).format(p_price);
				
				var cart_idx = parseInt(value.cartVo.cart_idx);
                
                s +=	'<li><a onclick="cartHeaderDel('+cartVo.cart_idx+');" class="remove" title="Remove this item"><i class="lni lni-close"></i></a>';
                s +=	'<div class="cart-img-head"><a class="cart-img" href="${pageContext.request.contextPath}/product/productContent?p_idx='+value.cartVo.p_idx+'">';
                s +=    '<img src="resources/assets/images/products/'+value.cartVo.p_sys_filename+'" alt="#"></a></div>';
                s +=	'<div class="content"><h4><a href="/product/productContent?p_idx='+value.cartVo.p_idx+'">'+value.cartVo.p_name+'</a></h4>';
                s +=	'<p class="quantity">1x - <span class="amount">'+price+'</span></p></div></li>';
               
                
                
                
                
                headersum = headersum + parseInt(p_price);
			});
			
			var cartTotal = new Intl.NumberFormat('ko-KR', {
				style : 'currency',
				currency : 'KRW'
			}).format(headersum);
			
			
			$("#cartPrice").html(cartTotal);
			$("#cartView").html("23232323");
			alert(s);
			}
		})
	    
	    
  }

function cartHeaderDel(cart_idx){
	 
	$.ajax({
		url : "/cartDelete",
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
      <a href="javascript:memberCartHeader" class="main-btn">
      <i class="lni lni-cart"></i>
       <span class="total-items">2</span>
      </a>
<div class="shopping-item">
	<div class="dropdown-cart-header">
		<span>2 Items</span>
			<a href="${pageContext.request.contextPath}/member/memberCartHeader">View Cart</a>
	</div>
	
		<table class="shopping-list">
        	<tbody id="cartView">

            </tbody>
        </table>
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