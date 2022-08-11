<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 작성 페이지</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 서머노트를 위해 추가해야할 부분 -->
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
<h3 style="text-align:center">커뮤니티 글 작성</h3>
<form action="${pageContext.request.contextPath}/CBInsertProcess.do" method="post" enctype="multipart/form-data">
	<table border="1px" align="center">
			<tr>
				<td>제목</td>
				<td><textarea rows="1" cols="50" name="cm_subject" id="cm_subject"></textarea></td>
				<c:if test="${msg1!=null}">
				  <script>
				  alert("${msg1}");
				  </script>
				</c:if>
			</tr>
			<tr>
			    <td>대표사진 설정</td>
				<td><input type="file" name="uploadImg" multiple/></td>
			</tr>
			<tr>
			<td>내용</td>
			<td><textarea id="summernote" name="cm_content"></textarea>
			<c:if test="${msg2!=null}">
			  <script>
			alert("${msg2}");
			 </script>
			</c:if>
                <input type="hidden" name="midx" id="midx" value="${midx}">
                <input type="hidden" name="cm_writer" value="${m_nick}"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="메인페이지" onclick="document.location.href='${pageContext.request.contextPath}/home.do'"/>&nbsp;|&nbsp;
					<input type="submit"  value="등록하기"/>
				
				</td>
			</tr>
		</table>

</form>

</body>
</html>