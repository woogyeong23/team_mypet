
 
   

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

 

<head>
   
<!-- css************************************************ -->
    <jsp:include page="../../include/head.jsp" />
   <!--  nav sticky -->
    <style type="text/css">
    #naver.fixed{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	background-color:#FFFFF0
    }
    
     /*  nav sticky */

    
    .popup{
   width:100%; 
   height:40px;
    margin: 0 auto; 
   position: relative; 
   background-color: #D9D7F1;
    }
    
   .popup_in{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
    }
    
    
    #popup_close{
    background-color: #D9D7F1;
    border: none;
    float: right;
    color: #FFFFFF;
    margin-right: 300px;
    margin-top:10px;
    }
    
    #popup_link{
    color: #FFFFFF;
    }
  table {
    margin:auto; 
}

table, td, th {
    border-collapse : collapse;
    border : 1px solid black;
};
    
    
    </style>
<!-- ************************************************ -->

<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {
	  //nav
	  var lnb = $("#naver").offset().top;
	 
	  $(window).scroll(function() {
	   
	    var window = $(this).scrollTop();
	    
	    if(lnb <= window) {
	      $("#naver").addClass("fixed");
	    }else{
	      $("#naver").removeClass("fixed");
	    }
	  });
	  //nav
	  
	  
	  
	  
	  // topbar event popup 지우기
	  $('#popup_close').click(function(){
	        $('.popup').stop().slideUp()
	    });
	    
	});
	
	
	
</script>


 <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
 <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">

<script>
$(document).ready(function() {
	// alert 창이 먼저 나오는 오류 수정 필요

	

	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

	var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            callbacks : { //여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files, editor,
            welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this);
            		}
            	}
            }
         };
        $('#summernote').summernote(setting);
       
        });
        


        
        
function uploadSummernoteImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "${pageContext.request.contextPath}/uploadSummernoteImageFile",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			alert(data.url);
			$(el).summernote('editor.insertImage', data.url);
		}
	});
}



</script>



</head>



<body>
     <div class="popup" >
     <div class="popup_in"><a id="popup_link" href="">지금 바로 가입하고 상품을 구입시 
  <span>아이패드</span> Get!</a></div><button id="popup_close"><i class="lni lni-close"></i></button>
  
     </div>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/admin_header.jsp" />  
<!-- ************************************************ -->
    
    
    
<!-- 최신순 -->
    <!-- Start Trending Product Area -->
    <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    
                    
                    
                   
                    
               
                    
                    
                    
                    
                </div>
            </div>
        </div>
    </section>



    <div class ="contents">
    <div class = "write">

<h3 style="text-align:center">1대1문의 글 작성</h3>
<form action="${pageContext.request.contextPath}/AWInsertProcess0.do" method="post" enctype="multipart/form-data">
	<table border="1px" align="center">
			<tr>
				<td>제목</td>
				<td><textarea rows="1" cols="50" name="board_subject" id="board_subject"></textarea></td>
			</tr>
			<tr>
			    <td>파일</td>
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
 	
<br><br>
<br><br><br><br><br><br><br>





	
<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
</body>

</html>

 
