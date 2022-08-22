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
 
  table {
    margin:auto; 
}

table, td, th {
    border-collapse : collapse;
    border : 1px solid black;
};
    
    
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
<body>
     <div class="popup" >
     <div class="popup_in"><a id="popup_link" href="">지금 바로 가입하고 상품을 구입시 
  <span>아이패드</span> Get!</a></div><button id="popup_close"><i class="lni lni-close"></i></button>
  
     </div>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/admin_header.jsp" />  
<!-- ************************************************ -->
    
    



<table border="1">
      <div class = "align-center">
	<h2>이벤트</h2>
	</div>

		<thead>
		<td><a href="${pageContext.request.contextPath}/admin_write2.do">글쓰기</a></td>
			<tr>
				
				<th>제목</th>
			<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${EventList.size() == 0 }">
				<tr>
					<td colspan="4">등록 된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${EventList.size() > 0}">
				<c:forEach var="BoardVo" items="${EventList}">
					<tr>
					
						<td><a href="${pageContext.request.contextPath}/admin_boardd2.do?bidx=${BoardVo.bidx}">${BoardVo.board_subject}</a></td>   
					   <td>${BoardVo.board_wday}</td>
					</tr>
				
				
                            
					
				</c:forEach>	

			
			</c:if>
			
			
		</tbody>
	
		
	</table>




    
  
<br><br><br><br>

         <jsp:include page="../../include/footer.jsp" />  
</body>

</html>
     