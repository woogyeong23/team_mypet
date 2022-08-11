<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />
    <link rel="stylesheet" href="assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
<title>마이펫 후기작성</title>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<style>

</style>

<!-- css***************************************************** -->
    <jsp:include page="../../include/head.jsp" />  
     <!-- 서머노트를 위해 추가해야할 부분 여기부터 -->
	  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
	  <!--  -->
<!-- ******************************************************** -->
<script>
			$(document).ready(function() {
			
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
			            //콜백 함수
			            callbacks : { 
			            	onImageUpload : function(files, editor, welEditable) {
			            // 파일 업로드(다중업로드를 위해 반복문 사용)
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
							url : "uploadSummernoteImageFile",
							contentType : false,
							enctype : 'multipart/form-data',
							processData : false,
							success : function(data) {
								$(el).summernote('editor.insertImage', data.url);
							}
						});
					}
			</script>
	<!-- 서머노트를 위해 추가해야할 부분 여기까지 -->	 
	
<style type="text/css">
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
.section {
    padding-top: 20px;
}
input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
#file {
  display: none;
}
.filebtn{
  padding: 9px 13px;
  background-color:#99ccff;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}
</style>
</head>

<body>
<!-- 헤더와 네비************************************************ -->
    <jsp:include page="../../include/header.jsp" />  
<!-- ******************************************************** -->
<section class="trending-product section" style="margin-top: 12px;">
    <div class="container">
    
    <center><h2>구매후기 작성</h2></center>
    <br>
    <div class="col-lg-12">
    <form class="mb-3" name="myform" id="myform" method="post">
    <table style="width: 100%;">
    <tr>
    <td style="text-align: left; width: 10%"><img src="${pageContext.request.contextPath}/resources/product/${ReviewWP.p_sys_filename}" alt="상품 이미지" width="100" height="100">
    <td style="font-size: 30px; color: black; font-weight: bold; width: 50%">${ReviewWP.p_name}<br>
    <span style="font-size: 20px; color: #99ccff; font-weight:600; width: 50%">${ReviewWP.m_nick}</span>
    <td style="text-align: right; ">
    <fieldset>
	<span class="text-bold">별점을 선택해주세요</span><br>
    <input type="radio" name="reviewStar" value="5" id="rate1"><label for="rate1">★</label>
	<input type="radio" name="reviewStar" value="4" id="rate2"><label for="rate2">★</label>
	<input type="radio" name="reviewStar" value="3" id="rate3"><label for="rate3">★</label>
	<input type="radio" name="reviewStar" value="2" id="rate4"><label for="rate4">★</label>
	<input type="radio" name="reviewStar" value="1" id="rate5"><label for="rate5">★</label>
	</fieldset>
	</td>
    </tr>
    </table>
    </form>
    </div>
<form name="frm" action="${pageContext.request.contextPath}/insertReview.do" method="post"  enctype="multipart/form-data">
		<div style="padding-bottom: 10px">				
<textarea id="summernote" name="p_content"></textarea>
</div>
	<input type="button" value="돌아가기" onclick="javascript:history.back()" style="background-color: grey; color: white; border: none; border-radius: 4px; width: 90px; height: 40px">
	<input type="submit" value="후기등록" style="background-color: #99ccff; color: white; border: none; width: 90px; height: 40px; border-radius: 4px;">
	<!-- <label  class="filebtn" for="file">파일 업로드</label>
	<input multiple="multiple" type="file" name="uploadFile" required="required" id="file" style={{display:"none"}}>
	 --></form>
	</div>
	</section>
<!-- 푸터와 js************************************************ -->
    <jsp:include page="../../include/footer.jsp" />  
<!-- ************************************************ -->
	
</body>
</html>