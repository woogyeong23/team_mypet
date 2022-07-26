<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 자세히 보기</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script type="text/javascript">
$(function(){   

$("#commentBtn").click(function(){
	
	let cc_content=$(".comment").val();
	let cm_idx = "${communityVo.cm_idx}";
	// writer 부분 session값에 담겨있는 것으로 대체할 것
	let cc_writer = "111";
	
	$.ajax({
		type: 'post',
		url: "${pageContext.request.contextPath}/InsertComment",
		data: {"cc_content" : cc_content, "cm_idx" : cm_idx, "cc_writer" : cc_writer},
		success: function(data){
			if(data == "N") {
				alert("댓글 작성하기 실패!");
			}
			else{
				alert("댓글 작성하기 성공!");
			}
		},
		error: function(error){ alert("알수없는 오류로 인해 작성하신 댓글이 누락되었습니다."); }
	});
		
});
//111111111111111111111111111111111111
$("#cc2").click(function(){
    $("#popup").fadeIn();
});
$("#popup").click(function(){
    $("#popup").fadeOut();
});
//11111111111111111111111111111111



});
</script>
<style type="text/css">
  /*팝업창*/
    #popup {
        display: none; /*숨기기*/
        position: fixed;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.9);
    }
    
    #popmenu {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%,-50%);
        width: 300px;
        height: 200px;
        text-align: center;
        background: #fff;
    }
    
    #popmenu p {
        margin-top: 80px;
    }
    
    .exit {
        position: absolute;
        left: 50%;
        bottom: 10px;
        transform: translate(-50%,0);
        width: 60px;
        height: 30px;
        text-align: center;
        line-height: 30px;
        background: #007AAE;
        cursor: pointer;
    }
</style>

</head>
<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ************************************************ -->


<h3 style="text-align:center">커뮤니티 글 자세히보기</h3>
<div>${communityVo.cm_subject}</div>
<div><img alt="커뮤니티 상세 보기 이미지" src="${pageContext.request.contextPath}/resources/Community/upload/${communityVo.cm_img}"></div>
<div>${communityVo.cm_content}</div>
<div>${communityVo.cm_writer}</div>
<div>${communityVo.cm_wday}</div>



<c:choose>
<c:when test="${midx == communityVo.midx}">
<button type="button" class="btn btn-danger">삭제하기</button>
<button type="button" class="btn btn-info">수정하기</button>
</c:when>

</c:choose>


<c:choose> 
<c:when test="${m_id != null }">
<textarea style="text-align:ceter" id="" rows="10" cols="50" class="comment" placeholder="댓글을 입력해주세요."></textarea>
<button type="button" class="btn btn-primary" id="commentBtn">댓글작성</button>
</c:when>

<c:otherwise>
<textarea style="text-align:ceter" id="" rows="10" cols="50" class="comment" placeholder="로그인 후 댓글을 입력해주세요." readonly></textarea>
</c:otherwise>
</c:choose>
 
<c:forEach var="cl" items="${ccmList}">
<div>작성자 : ${cl.cc_writer}</div>
<div>내용 : ${cl.cc_content}</div>
<div>날짜 : ${cl.cc_wday}</div>

<c:choose>
<c:when test="${m_id == null}">
<button type="button" class="btn btn-secondary">글</button>
</c:when>
<c:otherwise>
<button type="button" id="cc2" class="btn btn-secondary">답글</button>
</c:otherwise>
</c:choose>

   <div id="popup">
       <div id="popmenu">
           <p>안녕하세요!</p>
           <div class="exit">닫기</div>
       </div>
   </div>
    


</c:forEach>



<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
    
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>