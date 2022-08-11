<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
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
            
            <li><a href="${pageContext.request.contextPath}/admin_buyer.do ">구매자 관리</a>
           
            


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


<table border="1">


	<h2>게시글 상세</h2>
	<table border="1">
		<tbody>
			<tr>
				<th align="right">글번호</th>
				<td>${vo.bidx}</td>
			</tr>
			<tr>
				<th align="right">작성자</th>
				<td>${vo.name}</td>
			</tr>
			<tr>
				<th align="right">작성일</th>
				<td>${vo.wdate}</td>
			</tr>
			<tr>
				<th align="right">제목</th>
				<td>${vo.title}</td>
			</tr>
			<tr>
				<th align="right">내용</th>
				<td>${vo.content}</td>
			</tr>
		</tbody>
	</table>
	
	<c:if test="${login.midx eq vo.midx }">
		<button>수정</button>
		<button>삭제</button>
	</c:if>
	<button onclick="location.href='admin_borad.do'">목록</button>
	





	<form method="get" action="admin_borad.do">
		<select name="searchType">
			<option value="title" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'title'}">selected</c:if>>제목</option>
			<option value="contentWriter" <c:if test="${!empty searchVO.searchType and searchVO.searchType eq 'contentWriter'}">selected</c:if>>내용+작성자</option>
		</select>
		<input type="text" name="searchValue" <c:if test="${!empty searchVO.searchValue}">value="${searchVO.searchValue}"</c:if>>
		<input type="submit" value="검색">
	</form>

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
