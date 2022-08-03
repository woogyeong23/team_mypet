<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 자세히 보기</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>



<script type="text/javascript">
$(document).ready(function(){
	
$("#commentBtn").click(function(){
	
	let cc_content=$(".comment").val();
	let cm_idx = "${communityVo.cm_idx}";
	let cc_writer = "${m_nick}";
	
	$.ajax({
		type: 'post',
		url: "${pageContext.request.contextPath}/InsertComment.do",
		data: {"cc_content" : cc_content,
			"cm_idx" : cm_idx,
			"cc_writer" : cc_writer},
		success: function(data){
			if(data == "I") {
				alert("댓글 작성하기 성공");
				location.reload();
			}
			else{
				alert("댓글 작성하기 실패!");
			}
		}, 
		error: 
			function(request,status,error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
	});
});


// 대댓글 팝업 변수 정의
var target = document.querySelectorAll('.btn_open');
var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
var targetID;

 // 팝업 열기(대댓글창)
 for(var i = 0; i < target.length; i++){
   target[i].addEventListener('click', function(){
     targetID = this.getAttribute('href');
     document.querySelector(targetID).style.display = 'block';
   });
 }

 for(var j = 0; j < target.length; j++){
	    btnPopClose[j].addEventListener('click', function(){
	      this.parentNode.parentNode.style.display = 'none';
	    });
     }
 
 
 
 //대댓글 등록하기
 $(".Re_reply").each(function(){
		$(this).click(function(){
			
	    let cc_content=$(this).prev().prev().val(); //댓글 내용
	    let cc_writer = "${m_nick}";
		let cm_idx = "${communityVo.cm_idx}";
		    
	    let cc_idx =$(this).next().val(); 
	    let cc_origin =$(this).next().next().val();
	    let cc_depth =$(this).next().next().next().val();
	    let cc_level = $(this).next().next().next().next().val();

	    $.ajax({
	        type: 'post', //데이터를 보낼 방식
	        url: "${pageContext.request.contextPath}/CCInsert",
	        data: { "cc_content": cc_content,
	        	    "cc_writer": cc_writer,
	        	    "cm_idx": cm_idx,
	        	    "cc_idx":cc_idx, 
	        	    "cc_origin":cc_origin, 
	        	    "cc_depth":cc_depth, 
	        	    "cc_level": cc_level }, //보낼 데이터
	        success: function(data){ //데이터를 보내는것이 성공했을시 출력되는 메시지
		    	if(data == "H" ){
		    	    alert("작성하신 댓글이 등록되었습니다!!");
		    	    location.reload();
				} 
		    	else {
					alert("알수없는 오류로 인해 작성하신 댓글이 누락되었습니다.");
				} 
	        },
			error : function(error){ //에러 발생시
				alert(error);
			}
		});
	    
	}); 
	});	
 

});
</script>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />  
<!-- ************************************************ -->


<style type="text/css">
  /*팝업창*/
    #popup {
        display: none; /*숨기기*/
        position: relative;
        width: 100%;
        height: 100;
        background-color:gray;
        
    }
    
    #pop_in {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%,-50%);
       
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
    
    #that{
    position: relative;
    text-align: center;
    width: 100%;
    height: 200px;
    background-color: gray;
    }
    
    #that_in{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    background-color: white;
    }
    
    .cla{
    font-size: 18px;
    font-weight: 700;
    }
    
    .ckr{
    width:100%;
    height:852px;
    }
    
    .box {
    width: 34px;
    height: 34px; 
    border-radius: 70%;
    overflow: hidden;
    float:left;
    background: #BDBDBD;
}

.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

#dd{
    display: flex;
    justify-content: space-between;
    padding-bottom: 30px;
    }
    

    
</style>

</head>
<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ************************************************ -->

<div style="margin:30px 400px 64px 400px;">


        <div id="dd" >
                <div>
                   <div class="box">
        <img class="profile" src="${pageContext.request.contextPath}/resources/Community/upload/${communityVo.cm_img}">
                   </div>
                    <div style="float:left">
                   <span style="color:black">${communityVo.cm_writer}</span>
                   <br>
                   <span style="">${communityVo.cm_wday}</span>       
                   </div>
               </div>
                              <div><input type="button" value="팔로우"></div>
       </div>

                       
                            <div>
                            <img class="ckr" alt="${communityVo.cm_img}" src="${pageContext.request.contextPath}/resources/Community/upload/${communityVo.cm_img}">
                            </div>
               <div style="padding-top:20px; padding-bottom:30px;">
                        <div style="text-align:center; color:black; font-size:1.3em">${communityVo.cm_subject}</div>
                        <div style="color:black">${communityVo.cm_content}</div>
               </div>



<c:choose>
<c:when test="${midx == communityVo.midx}">
<button type="button" class="btn btn-danger">삭제하기</button>
<a href="${pageContext.request.contextPath}/modi_cm?cm_idx=${communityVo.cm_idx}"><button type="button" class="btn btn-info" id="">수정하기</button></a>
</c:when>
<c:otherwise></c:otherwise>
</c:choose>

      <div class="cla">댓글 <span>${replyCount}</span></div>
<div class="row">
  <div class="col-lg-12 col-12" id="that">
    <div id="that_in">
 <c:choose> 
  <c:when test="${m_id !=null}">
<textarea rows="5" cols="200" class="comment" placeholder="댓글을 입력해주세요."></textarea>
<button type="button" class="btn btn-primary" id="commentBtn">댓글작성</button>
  </c:when>

  <c:otherwise>
<textarea rows="10" cols="50" class="comment" placeholder="로그인 후 댓글을 입력해주세요." readonly></textarea>
  </c:otherwise>
</c:choose>
     </div>
  </div>
</div>
 
<c:forEach var="cl" items="${ccmList}">
<div>작성자 : ${cl.cc_writer}</div>
<div>내용 : ${cl.cc_content}</div>
<div>날짜 : ${cl.cc_wday}</div>

<c:choose>
<c:when test="${m_id != null}">
<a href="#pop_info_${cl.cc_idx}" class="btn_open"><button type="button" class="btn btn-secondary">답글</button></a>
</c:when>
  <c:otherwise></c:otherwise>
</c:choose>

 <!-- 실제 구현되는 답글하기 팝업창 -->
 <div id="pop_info_${cl.cc_idx}" class="pop_wrap" style="display:none;">
	 <div class="pop_inner">
    <textarea rows="5" cols="80" class="Re_retext"
             placeholder="댓글을 작성해주세요." style="border:1; padding: 16px 16px 24px; margin:0px 0px 16px; background:#FFFFFF;"></textarea>
             <br>
     <button type="button" class="Re_reply" style="font: 16px -apple-system, BlinkMacSystemFont; Color:#FFFFFF; Background:#12B886; Padding:0px 20px;">댓글쓰기</button>
           <input type="hidden" id="ridx" value="${cl.cc_idx}">
             <input type="hidden" id="origin" value="${cl.cc_origin}">
             <input type="hidden" id="depth" value="${cl.cc_depth}">
              <input type="hidden" id="level" value="${cl.cc_level}">
      <button type="button" class="btn_close">닫기</button>
  </div>
  </div>
</c:forEach>

</div>




<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
    
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>