

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

 

<head>
   
<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />
   <!--  nav sticky -->
    <style type="text/css">
    #naver.fixed{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	background-color:#FFFFF0
    }
    
     /*  nav sticky */

    
    .popup{
   width:100%; 
   height:40px;
    margin: 0 auto; 
   position: relative; 
   background-color: #D9D7F1;
    }
    
   .popup_in{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
    }
    
    
    #popup_close{
    background-color: #D9D7F1;
    border: none;
    float: right;
    color: #FFFFFF;
    margin-right: 300px;
    margin-top:10px;
    }
    
    #popup_link{
    color: #FFFFFF;
    }
    


    
    </style>
<!-- ************************************************ -->

<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {
	  //nav
	  var lnb = $("#naver").offset().top;
	 
	  $(window).scroll(function() {
	   
	    var window = $(this).scrollTop();
	    
	    if(lnb <= window) {
	      $("#naver").addClass("fixed");
	    }else{
	      $("#naver").removeClass("fixed");
	    }
	  });
	  //nav
	  
	  
	  
	  
	  // topbar event popup 지우기
	  $('#popup_close').click(function(){
	        $('.popup').stop().slideUp()
	    });
	    
	});
	
	
	
</script>
</head>


</head>
<body>
     <div class="popup" >
     <div class="popup_in"><a id="popup_link" href="">지금 바로 가입하고 상품을 구입시 
  <span>아이패드</span> Get!</a></div><button id="popup_close"><i class="lni lni-close"></i></button>
  
     </div>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/admin_header.jsp" />  
<!-- ************************************************ -->






  
           
				
				
				
		  <div class = "align-center ">
           <br>    <br>    
<li><a href="${pageContext.request.contextPath}/admin.memberList.do">구매자 리스트</a></li>
<br>


	
 <br>
       </div>
       
  
       
       
       <div class = "align-center ">

 <li><a href="${pageContext.request.contextPath}/admin_buyer.do">커뮤니티 글</a></li>
 
 <br>
 
 
 <br>



     </div>
     
         <div class = "align-center ">
<li><a href="${pageContext.request.contextPath}/admin_buyer.do">주문 내역</a>  </li>
<br>




 <br>

</div>




<div class = "align-center ">

<li><a href="${pageContext.request.contextPath}/admin_buyer.do">고객문의 내역</a>  </li>
<br>




 <br>


</div>



<div class = "align-center ">
             <li><a href="${pageContext.request.contextPath}/admin_buyer.do">후기</a> </li>
             
            
    
     <br>
             
<br>
             
          </div>      
                 
             
             <div class = "align-center ">
<li><a href="${pageContext.request.contextPath}/admin_buyer.do">입점신청</a>  </li>
<br>




 <br>




</div>


       
<!-- 최신순 -->
    <!-- Start Trending Product Area -->
    <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    
                    
                    
                   
                    
               
                    
                    
                    
                    
                </div>
            </div>
        </div>
    </section>
    
    





   


<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>

</html>