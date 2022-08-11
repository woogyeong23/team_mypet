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



관리자

  
</div>
 <hr/>
    <nav class = "menu">
           <ul class ="navi">
            
            <li><a href="${pageContext.request.contextPath}/#">구매자 관리</a>
           
            


</li>

<li><a href="${pageContext.request.contextPath}/#">판매자 관리</a>


</li>
<li> <a href="${pageContext.request.contextPath}/#">판매량 차트</a>



   

</li>


<li> <a href="${pageContext.request.contextPath}/admin_borad.do">공지사항 관리</a>


 
   


</li>



<li> 	<a href="${pageContext.request.contextPath}/admin_borad2.do">이벤트 관리</a>


    
   


</li>



<li>	<a href="${pageContext.request.contextPath}/#">1:1문의 사항</a>


 
   


</li>



    </nav>

    </div>




    <div class ="contents">
    <div class = "write">

<body>

<h3 style="text-align:center"> 글 작성 확인 페이지</h3>
<div><img alt="이미지" src="${pageContext.request.contextPath}/resources/Community/upload/${img}"/></div>
<div>작성자 : ${writer}</div>
<div>제목 : ${subject}</div>
<div>내용 : ${content}</div>
<a href="${pageContext.request.contextPath}/admin_board.do">공지사항 리스트</a>







</div>
</div>
        
            <ul class ="tabmenu">
                <li>

                    <div class ="notice">
                   
                    </div>
                  </li>
                  <li>

                    <div class ="gallery">
                   
                    </div>
                  </li>

    </ul>


        <div class ="otherwrap">
            <div class ="banner">

           
</div>

                <div class ="shortcut">

                 
                

            </div>
        </div>


        

</div>

</header>

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

copyright 자리



</div>

</div>



</footer>


	

</body>
</html>
