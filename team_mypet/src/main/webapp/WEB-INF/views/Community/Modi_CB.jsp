<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시글 수정하기</title>

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
<h3 style="text-align:center">커뮤니티 글 수정하기</h3>
<form action="${pageContext.request.contextPath}/Modi_CBProcess.do" method="post" enctype="multipart/form-data">
	<table border="1px" align="center">
			<tr>
				<td>제목</td>
				<td><textarea rows="1" cols="50" name="cm_subject">${commuVo.cm_subject}</textarea></td>
			</tr>
			<tr>
			    <td>대표사진 설정</td>
				<td><input type="file" name="uploadImg" multiple/> 기존 대표 사진:${commuVo.cm_origin_img}</td>
			</tr>
			<tr>
			<td>내용</td>
			<td><textarea id="summernote" name="cm_content" >${commuVo.cm_content}</textarea>
                <input type="text" name="cm_writer" value="${commuVo.cm_writer}">
                <input type="hidden" name="cm_idx" value="${commuVo.cm_idx}"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="메인페이지" onclick="document.location.href='${pageContext.request.contextPath}/home.do'"/>&nbsp;|&nbsp;
					<input type="submit" value="저장하기 "/>
				</td>
			</tr>
		</table>

</form>



</body>
</html>