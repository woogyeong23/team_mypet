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

<h2>게시글 등록</h2>
	<form action="admin_write.do" method="post">
		<table>
			<tbody>
				<tr>
					<th align="right">
						제목 :
					</th>
					<td>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<th align="right">
						내용 : 
					</th>
					<td>
						<textarea rows="10" cols="50" name="content"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<button>저장</button>
		
	</form>

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
