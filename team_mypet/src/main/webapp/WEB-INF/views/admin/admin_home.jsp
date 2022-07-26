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
            <ul class ="submenu">
            <li> <a href ="#">메뉴1</a></li>
            <li><a href ="#">메뉴2</a></li>
            <li><a href ="#">메뉴3</a> </li>

</ul>
</li>

<li><a href="${pageContext.request.contextPath}/#">판매자 관리</a>
<ul class ="submenu">
    <li> <a href ="#"> 메뉴1</a></li>
    <li><a href ="#">메뉴2</a></li>
    <li><a href ="#">메뉴3</a> </li>

</ul>
</li>
<li> <a href="${pageContext.request.contextPath}/#">판매량 차트</a>

<ul class ="submenu">
    <li> <a href ="#">메뉴1</a></li>
    <li><a href ="#">메뉴2</a></li>
   

</ul>
</li>


<li> <a href="${pageContext.request.contextPath}/#">공지사항 관리</a>

<ul class ="submenu">
    <li> <a href ="#">메뉴1</a></li>
    <li><a href ="#">메뉴2</a></li>
   

</ul>
</li>



<li> 	<a href="${pageContext.request.contextPath}/#">이벤트 관리</a>

<ul class ="submenu">
    <li> <a href ="#">메뉴1</a></li>
    <li><a href ="#">메뉴2</a></li>
   

</ul>
</li>



<li>	<a href="${pageContext.request.contextPath}/#">1:1문의 사항</a>

<ul class ="submenu">
    <li> <a href ="#">메뉴1</a></li>
    <li><a href ="#">메뉴2</a></li>
   

</ul>
</li>



    </nav>

    </div>


</header>

<div class = "bodywrap">
<div class = "imgslide">

<img src="images/lee.jpg" alt="lee" width="1200px" height="600px">

</div>
    <div class ="contents">
  
        
            <ul class ="tabmenu">
                <li>

                    <div class ="notice">
                        공지사항자리
                    </div>
                  </li>
                  <li>

                    <div class ="gallery">
                        이벤트 자리
                    </div>
                  </li>

    </ul>


        <div class ="otherwrap">
            <div class ="banner">

            판매퍙 차트 자리
</div>

                <div class ="shortcut">

                    회원 관리
                

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

copyright 자리



</div>

</div>



</footer>


	

</body>
</html>
