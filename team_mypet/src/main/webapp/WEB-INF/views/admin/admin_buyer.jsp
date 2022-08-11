<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>관리자페이지</title>
	
	
<script src ="resources/assets/js/jquery-1.12.3.js"></script>
	<script src ="resources/assets/js/script.js"defer type ="text/javascript"></script>
	

	<link href = "resources/assets/css/style.css"type="text/css" rel = "stylesheet">
		
		
	
</head>
<body>



	
<header>	
	
	



    <div class = "wrap">
    <div class = "logo">



 <li><a href="${pageContext.request.contextPath}/admin.do">관리자</a> </li>

  
</div>
 <hr/>
    <nav class = "menu">
           <ul class ="navi">
            
            <li><a href="${pageContext.request.contextPath}/admin_buyer.do">구매자 관리</a>
           
            


</li>

<li><a href="${pageContext.request.contextPath}/#">판매자 관리</a>


</li>
<li> <a href="${pageContext.request.contextPath}/#">판매량 차트</a>



   

</li>


<li> <a href="${pageContext.request.contextPath}/admin_board.do">공지사항 관리</a>


 
   


</li>



<li> 	<a href="${pageContext.request.contextPath}/admin_board2.do">이벤트 관리</a>


    
   


</li>



<li>	<a href="${pageContext.request.contextPath}/admin_mune.do">1:1문의 사항</a>


 
   


</li>



    </nav>

    </div>


</header>

<div class = "bodywrap">
<div class = "imgslide">


<div class = "aa">

                       
           
				
				
				
		
             
<li><a href="${pageContext.request.contextPath}/memberList.do">구매자 리스트</a></li>
<br>


	
를 볼 수 있는
페이지입니다. <br>
       </div>
       
  
       
       
       <div class = "bb">

 <li><a href="${pageContext.request.contextPath}/admin_buyer.do">커뮤니티 글</a></li>
 
 <br>
 
 
을 볼 수 있는
페이지입니다. <br>



     </div>
     
         <div class = "cc">
<li><a href="${pageContext.request.contextPath}/admin_buyer.do">주문 내역</a>  </li>
<br>




을 볼 수 있는
페이지입니다. <br>

</div>




<div class = "dd">

<li><a href="${pageContext.request.contextPath}/admin_buyer.do">고객문의 내역</a>  </li>
<br>




을 볼 수 있는
페이지입니다. <br>


</div>



<div class = "ee">
             <li><a href="${pageContext.request.contextPath}/admin_buyer.do">후기</a> </li>
             
            
    
     <br>
             
를볼 수 있는
페이지입니다. <br>
             
          </div>      
                 
             
             <div class = "ff">
<li><a href="${pageContext.request.contextPath}/admin_buyer.do">입점신청</a>  </li>
<br>




글을 볼 수 있는
페이지입니다. <br>




</div>


    <div class ="contents">
  
        
            <ul class ="tabmenu">
                <li>

                    <div class ="notice">
                       
                    </div>
                  
                  <li>

                    <div class ="gallery">
                         
                    </div>
                  

    </ul>


        <div class ="otherwrap">
            <div class ="banner">

           
</div>

                <div class ="shortcut">

     
            </div>
        </div>


        

</div>



<footer>

    <div class="wrap">
    <div class ="btlogo">

     하단 로고 자리
    </div>
    
    <div class="site">
    <div class ="btmenu">
        하단 자리

   </div>



<div class ="copy">
 


</div>

</div>



</footer>


	

</body>
</html>
