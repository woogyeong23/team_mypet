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


<li> <a href="${pageContext.request.contextPath}/admin_board.do">공지사항 관리</a>


 
   


</li>



<li> 	<a href="${pageContext.request.contextPath}/admin_board2.do">이벤트 관리</a>


    
   


</li>



<li>	<a href="${pageContext.request.contextPath}/#">1:1문의 사항</a>


 
   


</li>



    </nav>

    </div>


</header>

<div class = "bodywrap">


<table border="1">



	<h2>게시판 목록</h2>
	


		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${list.size() == 0 }">
				<tr>
					<td colspan="4">등록 된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${boardList.size() > 0}">
				<c:forEach var="vo" items="${boardList}">
					<tr>
						<td>${com.jeonju.mypet.vo.bidx}</td>
						<td><a href="admin_board_d.do?bidx=${com.jeonju.mypet.vo.bidx}">${com.jeonju.mypet.vo.midx}</a></td>
						<td>${com.jeonju.mypet.vo.name}</td>
						<td>${com.jeonju.mypet.vo.writer}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>






	<form method="get" action="admin_board.do">
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
