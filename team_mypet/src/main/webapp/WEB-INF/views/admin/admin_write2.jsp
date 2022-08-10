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

<h3 style="text-align:center">이벤트 글 작성</h3>
<form action="${pageContext.request.contextPath}/AWInsertProcess2.do" method="post" enctype="multipart/form-data">
	<table border="1px" align="center">
			<tr>
				<td>제목</td>
				<td><textarea rows="1" cols="50" name="board_subject" id="board_subject"></textarea></td>
			</tr>
			<tr>
			    <td>대표사진 설정</td>
				<td><input type="file" name="uploadImg" multiple/></td>
			</tr>
			<tr>
			<td>내용</td>
			<td><textarea id="summernote" name="board_content"></textarea>
                <input type="hidden" name="midx" id="midx" value="${midx}">
                <input type="hidden" name="board_writer" value="${m_nick}"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="메인페이지" onclick="document.location.href='${pageContext.request.contextPath}/home.do'"/>&nbsp;|&nbsp;
					<input type="submit"  value="등록하기"/>
				
				</td>
			</tr>
		</table>

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
