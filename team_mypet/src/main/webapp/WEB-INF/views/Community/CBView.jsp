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
	let midx = "${midx}";
	
	$.ajax({
		type: 'post',
		url: "${pageContext.request.contextPath}/InsertComment.do",
		data: {"cc_content" : cc_content,
			"cm_idx" : cm_idx,
			"cc_writer" : cc_writer,
			"midx" : midx},
		success: function(data){
			if(data == "I") {
				alert("댓글 작성하기 성공");
				location.reload();
			}
			else{
				alert("댓글 작성하기 실패!");
			}
		}, 
		error : function(error){ alert(error);}
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


 
 
 
 //대댓글 등록하기
 $(".Re_reply").each(function(){
		$(this).click(function(){
			
	    let cc_content= $(this).prev().val(); //댓글 내용
	    let cc_writer = "${m_nick}";
		let cm_idx = "${communityVo.cm_idx}";
		let midx = "${midx}";
		    
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
	        	    "cc_level": cc_level,
	        	    "midx": midx}, //보낼 데이터
	        success: function(data){ //데이터를 보내는것이 성공했을시 출력되는 메시지
		    	if(data == "H" ){
		    	    alert("작성하신 댓글이 등록되었습니다!!");
		    	    location.reload();
				} 
		    	else {
					alert("알수없는 오류로 인해 작성하신 댓글이 누락되었습니다.");
				} 
	        },
			error : function(error){ alert(error); }
		});
	    
	}); 
	});
 
  $("#good").click(function(){
	 let midx = "${midx}";
	 let cm_idx = "${communityVo.cm_idx}";
	 
	 $.ajax({
		 type: 'post',
		 url: "${pageContext.request.contextPath}/cmLike",
		 data: {"midx" : midx, "cm_idx" : cm_idx},
		 
		 success: function(data){
				if(data == "Y") {
					location.reload();
				}else{
					alert("알수없는 오류로 인해 '좋아요'가 누락되었습니다.");
				}
			},
			error : function(error){ alert(error); }
	 });
  });
  
  $("#bad").click(function(){
		 let midx = "${midx}";
		 let cm_idx = "${communityVo.cm_idx}";
		 
		 $.ajax({
			 type: 'post',
			 url: "${pageContext.request.contextPath}/cmBad",
			 data: {"midx" : midx, "cm_idx" : cm_idx},
			 
			 success: function(data){
					if(data == "Y") {
						location.reload();
					}else{
						alert("알수없는 오류로 인해 '좋아요 취소'가 누락되었습니다.");
					}
				},
				error : function(error){ alert(error); }
		 });
	  });
  
  $("#none").click(function(){
	  alert("로그인 후 이용가능한 서비스입니다.");
  });
  
  
  $("#CBdelete").click(function(){
		  var result = confirm("해당 게시물을 삭제하시겠습니까?");
		  if(result){
			  let cm_idx = "${communityVo.cm_idx}";
				 
				 $.ajax({
					 type: 'post',
					 url: "${pageContext.request.contextPath}/cmDelete",
					 data: {"cm_idx" : cm_idx},
					 
					 success: function(data){
							if(data == "Y") {
								alert("해당 게시물이 삭제되었습니다.");
								location.replace("${pageContext.request.contextPath}/CBList.do");
							}else{
								alert("알수없는 오류로 인해 '게시물 삭제'가 취소되었습니다.");
							}
						},
						error : function(error){ alert(error); }
				 });
		  }else{
		      alert("게시물 삭제를 취소하였습니다.");
		  }
	  
  });
  
  $(".ccDel").each(function(){
		$(this).click(function(){
			 
			var ccdee = confirm("해당 댓글을 삭제하시겠습니까?");
		     if(ccdee){
		    	  let cc_idx =$(this).next().val(); 
		    	  
		    	  $.ajax({
		    		type:'post',
		    		url: "${pageContext.request.contextPath}/ccDelete",
		    		data:{"cc_idx" : cc_idx},
		    		
		    		success: function(data){
		    			if(data == "Y") {
		    				alert("댓글을 삭제하였습니다.");
		    				location.reload();
		    			}else{
		    				alert("알수없는 오류로 인해 '댓글 삭제'가 취소되었습니다.");
		    			}
		    		},	
					error : function(error){ alert(error); }
		    	  });
		     }else{
			      alert("댓글 삭제를 취소하였습니다.");
		     }
		 });
  });
  
  
  $(".likeCc").each(function(){
		$(this).click(function(){
			let midx = "${midx}";
			let cc_idx = $(this).next().val();
			alert(cc_idx+"cc_idx");
			
			$.ajax({
				type:'post',
				url:"${pageContext.request.contextPath}/ccLike",
				data: {"midx" : midx,
					"cc_idx" : cc_idx},
					
					success: function(data){
						if(data == "Y") {
							alert("해당 댓글에 '좋아요'를 표시하였습니다.");
							location.reload();
						}else{
							alert("알수없는 오류로 인해 '좋아요'가 누락되었습니다.");
						}
					},
					error : function(error){ alert(error); }	
			});

		});
	});
  
 
  
  

  
  
  
  
  

});



</script>


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
     
    .cla{
    font-size: 18px;
    font-weight: 700;
    position:relative;
    margin-top: 15px;
    display: flex;
    height: 30px;
    width:100%;
    }
    
    .ckr{
    width:100%;
    height:852px;
    }
    
    .box {
    width: 45px;
    height: 45px; 
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
    
#asd{
    display: flex;
    flex: 1;
    padding: 8px 12px;
    border-style: none;
    border-radius: 18px;
    background-color: #f5f5f5;
}

.comment{
    padding: 0;
    width: 100%;
    max-height: 80px;
    font-size: 14px;
    caret-color: #fae100;
    color: #333333;
    background-color: transparent;
    border: none;
    resize: none;
    outline: none;
    overflow: auto;
}


#commentBtn{
    align-self: center;
    margin-left: 8px;
    padding: 8px;
    line-height: 17px;
    font-weight: 700;
    font-size: 14px;
    color: #fae100;
    border: 0 none;
    background: transparent;
    border-radius: 0;
    display: inline-block;
}

#tre{
width:100%;
padding: 8px 16px;
    display: flex;
}



.CommentContent{
position: relative;
    display: flex;
    padding: 12px 16px;
}

.CommentContentProfile{
position: relative;
    padding-right: 8px;
}

.CommentContent__wrap{
    flex: 1;
}

.CommentContent__header{
    padding: 5px 0;
}

.CommentContent__userName{
    line-height: 17px;
    padding-bottom: 5px;
    font-weight: 700;
    font-size: 14px;
    color: #333333;
}

.CommentContent__body{
    line-height: 21px;
    font-size: 14px;
}

.CommentContent__commentText{
    font-weight: 400;
    color: #333333;
    word-break: break-all;
}

.CommentContent__footer {
    padding-top: 8px;
}

.CommentContentAction__wrap{
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
.CommentContent__createAt {
    line-height: 14px;
    font-weight: 400;
    font-size: 12px;
    color: #acacac;
}

.CommentContentAction__wrap > *:not(:first-child) {
    padding-left: 20px;
}

#CommentContentActionButton {
    font-weight: 700;
    font-size: 12px;
    line-height: 14px;
    color: #999999;
}

button {
    border: 0 none;
    background: transparent;
    cursor: pointer;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    display: inline-block;
    padding: 0;
    margin: 0;
}
.Re_reply{
 align-self: center;
    margin-left: 8px;
    padding: 8px;
    line-height: 17px;
    font-weight: 700;
    font-size: 14px;
    color: #fae100;
    border: 0 none;
    background: transparent;
    border-radius: 0;
    display: inline-block;
}

.ReplyListItem__content {
   padding-left: 52px;
}

.ReplyListItem__action {
  padding-left: 72px;
}

.cmBTN_area {
   display:flax; 
   position:relative;
   height:70px;
 }

.cmBTN_area .good_area{
   position:relative;
   top:50%;
   left:50%;
 }
 
 .cmBTN_area .good_area .good{
  height: 50px;
  width: 50px;
  line-height: 50px;
  display: inline-block;
  border-radius: 50%;
  border: 1px solid #eee;
  color: #555;
  font-size: 22px;
  text-align: center;
  position: relative;
  margin-right: 12px;
 }
 .cmBTN_area .good_area .good:hover {
 color: #fff;
 background-color:rgb(237,73,86);
 border-color: transparent;
 }
 
 .cmBTN_area .good_area .liked{
  height: 50px;
  width: 50px;
  line-height: 50px;
  display: inline-block;
  border-radius: 50%;
  border: 1px solid #eee;
  color: #fff;
  background-color:rgb(237,73,86);
  font-size: 22px;
  text-align: center;
  position: relative;
  margin-right: 12px;
 }
 
  .cmBTN_area .good_area .liked:hover {
 color: #fff;
 background-color:#555;
 border-color: transparent;
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
        <img class="profile" src="${pageContext.request.contextPath}/resources/Extra/img/${communityVo.m_profile}">
                   </div>
                    <div style="float:left">
                   <span style="margin-left: 15px; font-size:1.3em; color:black; margin-top:10px; top:60%">${communityVo.cm_writer}</span>
                   </div>
                   <div style="margin-left:900px; float:right; margin-top:20px; top:60%"><span style="">${communityVo.cm_wday}</span>
                   <br>
                   <c:if test="${midx == communityVo.midx}">
<a href="${pageContext.request.contextPath}/modi_cm?cm_idx=${communityVo.cm_idx}"><button type="button" style="background-color:blue; color:#ffffff; border-radius:10%;">수정</button></a>
<button type="button" id="CBdelete" style="background-color:red; color:#ffffff; border-radius:10%;">삭제</button>
                   </c:if>
                   </div>
                   
                  
               </div>
                             
       </div>

                       
                            <div>
                        <c:if test="${communityVo.cm_img != ''}">
                         <img class="ckr" alt="${communityVo.cm_img}" src="${pageContext.request.contextPath}/resources/Community/upload/${communityVo.cm_img}">
                        </c:if>

                            </div>
               <div style="padding-top:20px; padding-bottom:30px;">
                        <div style="text-align:center; color:black; font-size:1.3em">${communityVo.cm_subject}</div>
                        <div style="color:black">${communityVo.cm_content}</div>
               </div>


<div class="cmBTN_area">
   <div class="good_area">
   <c:choose>
   
     <c:when test="${midx == null}">
     <button type="button" class="good" id="none"><i class="lni lni-heart"></i></button>
     </c:when>
   
     <c:when test="${CmLikeYn == 1}">
     <button type="button" class="liked" id="bad"><i class="lni lni-heart"></i></button>
     </c:when>
   
     <c:otherwise>
     <button type="button" class="good" id="good"><i class="lni lni-heart"></i></button>
     </c:otherwise>
   
   </c:choose>
   <p> 좋아요 <span>${communityVo.community_like_cnt}</span>개</p>
   </div>
   </div>




<div class="cla">댓글 <span>${replyCount}</span></div>
<div class="row">
  <div class="col-lg-12 col-12">
       
 <c:choose> 
  <c:when test="${m_id !=null}">
<div id="tre">
<div id="asd">
  <textarea rows="1" class="comment" maxlength="500" placeholder="댓글을 입력해주세요."></textarea>
</div>

<button type="button" id="commentBtn">등록</button>
</div>
  </c:when>

  <c:otherwise>
<div id="tre">
   <div id="asd">
    <textarea rows="10" cols="50" class="comment" placeholder="로그인 후 댓글을 입력해주세요." readonly></textarea>
   </div>
</div>    
  </c:otherwise>
</c:choose>
       
  </div>
</div>
 
<c:forEach var="cl" items="${ccmList}">
<c:choose>
         <c:when test="${cl.cc_depth == 0}">
         <!--  답글 아닐 경우 -->
<div class="CommentContent">
<div class="CommentContentProfile">
<!-- 프로필 사진 들어가면 좋음-->
</div>

<div class="CommentContent__wrap">
     <div class="CommentContent__header">
         <strong class="CommentContent__userName">${cl.cc_writer}</strong> 
         <c:if test="${midx == cl.midx}">
           <button class="ccDel" style="margin-left:90%; background-color:#dae1e6; width:20px; height:20px; border-radius:10%;"><i class="lni lni-close"></i></button>
           <input type="hidden" name="cc_idx" value="${cl.cc_idx}">
       </c:if>
     </div>
     
<p class="CommentContent__body">
        <span class="CommentContent__commentText">${cl.cc_content}</span>
</p>
<div class="CommentContentAction CommentContent__footer">
       <div class="CommentContentAction__wrap">
            <span class="CommentContent__createAt">${cl.cc_wday}</span>
  <c:choose>
       <c:when test="${midx != null}">

      <button type="button" id="CommentContentActionButton" class="likeCc" style="color:rgb(237,73,86);"><i class="lni lni-smile"></i> 공감하기 ${cl.cc_like}</button>
              <input type="hidden" value="${cl.cc_idx}">

     <a href="#pop_info_${cl.cc_idx}" class="btn_open">
     <button type="button" id="CommentContentActionButton"><i class="lni lni-bubble"></i> 답글하기</button>
     </a>
        </c:when>
        <c:otherwise></c:otherwise> 
  </c:choose>
         </div>
       </div>
    </div>
  </div>
         </c:when>
  <c:otherwise>
  <!-- 답글일 경우 -->
  <div class="CommentContent ReplyListItem__content">
   <div class="CommentContentProfile">
   <!-- 프로필 사진 들어가면 좋음-->
   </div>
         <div class="CommentContent__wrap">
           <div class="CommentContent__header">
                    <strong class="CommentContent__userName">${cl.cc_writer}</strong>
            <c:choose>
         <c:when test="${midx == cl.midx}">
           <button class="ccDel" style="margin-left:90%; background-color:#dae1e6; width:19px; height:19px;"><i class="lni lni-close"></i></button>
           <input type="hidden" value="${cl.cc_idx}">
         </c:when>
         <c:otherwise>
         
         </c:otherwise>
         </c:choose>
          </div> 
                    <p class="CommentContent__body">
                    <span class="CommentContent__commentText">${cl.cc_content}</span>
                   </p>
            <div class="CommentContentAction CommentContent__footer">
            <div class="CommentContentAction__wrap">
            <span class="CommentContent__createAt">${cl.cc_wday}</span>
  <c:choose>
       <c:when test="${midx != null}">
<button type="button" id="CommentContentActionButton" class="likeCc" style="color:rgb(237,73,86);"><i class="lni lni-smile"></i> 공감하기 ${cl.cc_like}</button>
              <input type="hidden" value="${cl.cc_idx}">
<a href="#pop_info_${cl.cc_idx}" class="btn_open"><button type="button" id="CommentContentActionButton"><i class="lni lni-bubble"></i> 답글하기</button></a>
        </c:when>
              <c:otherwise></c:otherwise> 
  </c:choose>
            </div>
          </div>
       </div>
    </div>
    <div class="ReplyListItem__action">
    </div>
  </c:otherwise>
</c:choose>
 <!-- 실제 구현되는 답글하기 팝업창 -->

	
<div id="pop_info_${cl.cc_idx}" class="pop_wrap" style="display:none;">
    <div class="pop_inner">
        <div id="tre">
            <div id="asd">
                 <textarea rows="1" class="comment" maxlength="500" placeholder="답글을 입력해주세요."></textarea>
                    <button type="button" class="Re_reply">등록</button>
                    <input type="hidden" id="ridx" value="${cl.cc_idx}">
                    <input type="hidden" id="origin" value="${cl.cc_origin}">
                    <input type="hidden" id="depth" value="${cl.cc_depth}">
                    <input type="hidden" id="level" value="${cl.cc_level}">
             </div>   
       </div>
   </div>
</div>

           
<!--       <button type="button" class="btn_close">닫기</button> -->
</c:forEach>





</div>




<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
    

</body>
</html>